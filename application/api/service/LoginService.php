<?php
namespace app\api\service;

use app\admin\model\User;
use app\api\model\UserLogin;
use think\Session;

class LoginService extends Common {

    /**
     * 获取登录验证码
     */
    public function login_sendmsg()
    {
        $mobile = input('mobile');
        if (empty($mobile)) return $this->cjson(1,'手机号码不能为空');

        $preg = "/^1[3456789]\d{9}$/";
        if (!preg_match($preg, $mobile)) return $this->cjson(1,'手机号码不正确');

        $rand = rand(1000,9999);
        $msg = "您的验证码是：{$rand}。请不要把验证码泄露给其他人。";
        Session::set('mobile',$mobile);
        Session::set('mobile_code',$rand);
        Session::set('mobile_code_time',time());

        $userLogin = new UserLogin();
        $check_login = $userLogin->get(["mobile"=>$mobile]);

        if ( $check_login && time() - strtotime($check_login['add_time']) < 60) return $this->cjson(1,'请求频率过快！');
        $data = [
            'mobile' => $mobile,
            'code'  => $rand,
            'add_time' => date('Y-m-d H:i:s')
        ];

        if ($check_login) {
            $result = $userLogin->save($data,['mobile'=>$mobile]);
        } else {
            $result = $userLogin->save($data);
        }
        if (!$result)  return $this->cjson(1,'短信发送失败，请重新发送！');

        $ssend = new SendService();
        return $ssend->send_msg($mobile,$msg);
    }

    /**
     * 登录数据处理
     * @return string
     */
    public function login_check(){

        $mobile = input('mobile');
        $code = input('code');

        $user = new User();
        $userLogin = new UserLogin();

        $check_login = $userLogin->get(["mobile"=>$mobile]);
        if ( $check_login && time() - strtotime($check_login['add_time']) < 60) return $this->cjson(1,'请求频率过快！');

        if (!$mobile) return $this->cjson(1,'手机号不能为空');
        if (!$code) return $this->cjson(1,'验证码不能为空');
        if (!$check_login) return $this->cjson(1,'验证码储存错误，请重新发送验证码！');
        if (time() - strtotime($check_login['add_time']) > 600) return $this->cjson(1,'验证码已过期');
        if ($code != $check_login['code']) return $this->cjson(1,'验证码错误');

        $check = $user->get_user("mobile = '{$mobile}'",1,0,'a.user_id,a.nickname,a.img,a.status');
        if ($check[0]['status'] == 1) return $this->cjson(1,'账号已停用！');
        if (count($check) <= 0 ) return $this->cjson(1,'账号不存在！');

        $token = password_hash($mobile,PASSWORD_DEFAULT);

        $user->save(['last_ip'=>request()->ip(),'last_time'=>date('Y-m-d H:i:s')],["user_id"=>$check[0]['user_id']]);
        $data = [
            'user_id' => $check[0]['user_id'],
            'token' => $token
        ];
        if ($userLogin->save($data,['mobile'=>$mobile])){
            return $this->cjson(0,'登录成功',['token'=>$token,'list'=>$check[0]]);
        } else {
            return $this->cjson(1,'token存储失败');
        }


    }
}