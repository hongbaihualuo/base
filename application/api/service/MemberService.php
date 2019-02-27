<?php
namespace app\api\service;


use app\api\model\User;
use app\api\model\UserInfo;
use app\api\model\UserLogin;
use app\api\model\Video;
use think\image\Exception;
use think\Session;

class MemberService extends Common
{
    /**
     * 用户点赞
     */
    public function add_good ($video_id)
    {
        if (!$video_id)  return $this->cjson(2,'未找到该视频！');

        $video = new Video();

        $videoInfo = $video->get($video_id);
        if (!$videoInfo)   return $this->cjson(3,'未找到该视频！');

        if ($video->save(['good'=>$videoInfo['good']+1],[])) {
            return $this->cjson(0,'点赞成功！');
        } else {
            return $this->cjson(1,'点赞失败！');
        }
    }

    /**
     * 用户踩
     */
    public function add_bad ($video_id)
    {
        if (!$video_id)  return $this->cjson(1,'未找到该视频！');

        $video = new Video();

        $videoInfo = $video->get($video_id);
        if (!$videoInfo)   return $this->cjson(1,'未找到该视频！');

        if ($video->save(['bad'=>$videoInfo['bad']+1],[])) {
            return $this->cjson(0,'踩成功！');
        } else {
            return $this->cjson(1,'踩失败！');
        }
    }

    /**
     * 用户转发
     */
    public function add_send ($video_id)
    {
        if (!$video_id)  return $this->cjson(1,'未找到该视频！');

        $video = new Video();

        $videoInfo = $video->get($video_id);
        if (!$videoInfo)   return $this->cjson(1,'未找到该视频！');

        if ($video->save(['send_num'=>$videoInfo['send_num']+1],[])) {
            return $this->cjson(0,'添加成功！');
        } else {
            return $this->cjson(1,'添加失败！');
        }
    }

    /**
     * 用户信息
     */
    public function member_search($user_id)
    {
        $user = new \app\admin\model\User();
        $data = $user->get_user("a.user_id = {$user_id}",1,0,'a.mobile,a.nickname,a.last_time,a.img,ui.sex,ui.sign,ui.like');
        if (count($data) <= 0 ) return $this->cjson(1,'未找到该用户');

        return $this->cjson(0,'请求成功',$data[0]);
    }

    /**
     * 用户添加
     */
    public function member_add()
    {
        $mobile = input('mobile');
        $code = input('code');

        if (!$mobile) return $this->cjson(1,'手机号不能为空');
        if ($mobile != Session::get('mobile')) return $this->cjson(1,'请使用发送验证码的手机号注册');
        if (!$code) return $this->cjson(1,'验证码不能为空');
        if (time()-Session::get('mobile_code_time') > 600) return $this->cjson(1,'验证码错误');
        if ($code != Session::get('mobile_code')) return $this->cjson(1,'验证码错误');
        $token = password_hash($mobile,PASSWORD_DEFAULT);

        $data = [
            'mobile' => $mobile,
            'password' => $token,
            'nickname'  =>rand(100000,999999),
            'add_time'  => date('Y-m-d H:i:s'),
            'add_ip'  => request()->ip(),
            'last_time'  => date('Y-m-d H:i:s'),
            'last_ip'  => request()->ip(),
        ];

        $user = new User();
        $userInfo = new UserInfo();
        $userLogin = new UserLogin();

        $check_user = $user->get_user("mobile = '{$data['mobile']}'",1);
        if (count($check_user)>0 ) return $this->cjson(1,'手机号已存在！');

        $user->startTrans();
        $userInfo->startTrans();

        try{
            $user->save($data);
            $user_id = $user->getLastInsID();
            $userInfo->save(['user_id'=>$user->getLastInsID()]);
            $user->commit();
            $userInfo->commit();

            $dataLogin = [
                'user_id' => $user_id,
                'token' => $token,
                'add_time' => date('Y-m-d H:i:s')
            ];
            $userLogin->save($dataLogin);
            return $this->cjson(0,'添加成功',['token'=>$token,'list'=>['user_id'=>$user_id,'nickname'=>$data['nickname'],'img'=>'','status'=>0]]);
        }catch(Exception $e){
            $user->rollback();
            $userInfo->rollback();
            return $this->cjson(1,'执行失败');
        }
    }

    /**
     * 用户修改
     */
    public function member_edit()
    {
        $user_id = input('user_id');

        $data = [
            'nickname'  => input('nickname'),
        ];

        $user = new User();
        $userInfo = new UserInfo();

        $user->startTrans();
        $userInfo->startTrans();

        try{
            $dataInfo = [
                'sex'=>input('sex') == 1 ? input('sex') : 0,
                'sign'=>input('sign'),
                'like'=>input('like'),
            ];

            $user->save($data,['user_id' => $user_id]);
            $userInfo->save($dataInfo,['user_id' => $user_id]);
            $user->commit();
            $userInfo->commit();
            return $this->cjson(0,'修改成功');
        }catch(Exception $e){
            $user->rollback();
            $userInfo->rollback();
            return $this->cjson(1,'执行失败');
        }
    }

    /**
     * 用户头像切换
     */
    public function member_img($user_id)
    {
        $sfile = new FileService();
        $img = $sfile->upload_one();

        if (!$img) return $this->cjson(1,'上传失败');

        $data = [
            'img'  => $img,
        ];

        $user = new User();

        if ($user->save($data,['user_id' => $user_id])){
            return $this->cjson(0,'修改成功');
        } else {
            return $this->cjson(1,'修改失败');
        }
    }
}