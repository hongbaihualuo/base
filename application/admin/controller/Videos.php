<?php
namespace app\admin\controller;

class Videos extends Common{

    /**
     * 视频列表页 （service层）
     * @return mixed
     */
    public function videos(){
        $smember = new MemberService();
        $data = $smember->member_search();

        $this->assign('data',$data);
        return $this->fetch();
    }

    /**
     * 添加视频 （model层）
     */
    public function videos_add(){

        if (request()->isAjax()) {
            $smember = new MemberService();
            $data = $smember->member_save();
            die($data);
        }
        $userType = new UserType();
        $this->assign('type',$userType->get_type());
        return $this->fetch();
    }

    /**
     * 修改视频 （service层）
     */
    public function videos_edit(){

        if (request()->isAjax()) {
            $smember = new MemberService();
            if (input('onoff')) {
                $data = $smember->member_onoff();
            } else {
                $data = $smember->member_save();
            }
            die($data);
        }

        $id = input('id');

        $user = new User();
        $userType = new UserType();

        $detail = $user->get_user("a.user_id = {$id}",1);
        if (count($detail)<=0)$this->error('未找到相应用户');

        $this->assign('detail',$detail[0]);
        $this->assign('type',$userType->get_type());
        return $this->fetch();
    }

    /**
     * 删除视频 （service层）
     */
    public function videos_delete()
    {
        $smember = new MemberService();
        $data = $smember->member_delete();
        die($data);
    }
}