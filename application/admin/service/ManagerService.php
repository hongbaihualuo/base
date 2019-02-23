<?php
namespace app\admin\service;


use app\admin\model\Manage;
use app\admin\model\ManageGroup;
use think\image\Exception;

class ManagerService extends Common {

    /**
     * 管理员搜索列表
     */
    public function manager_search(){

        $search['account'] = input('account');
        $search['realname'] = input('realname');

        $where = '1 = 1';
        if ($search['account']) $where .= " and a.manage = '{$search['account']}'";
        if ($search['realname']) $where .= " and a.real_name = '{$search['realname']}'";

        $manage = new Manage();
        $list = $manage->get_manager($where,10,1);

        $data['list'] = $list;
        $data['page'] = $list->render();
        $data['count'] = $manage->get_manager_count($where);
        $data['search'] = $search;

        return $data;
    }

    /**
     * 管理员设置
     * @return string
     */
    public function manager_save(){
        $id = input('id');

        $data = [
            'manage'  => input('account'),
            'manage_group_id'  => input('group'),
            'real_name'  => input('name'),
            'status'  => input('status') == 0 ? input('status') : 1
        ];

        if (!$data['manage'] ) return $this->cjson(1,'账号不能为空！');
        if (!is_numeric($data['manage_group_id']) ) return $this->cjson(1,'组别错误！');
        if (input('cpassword') != input('password')) return $this->cjson(1,'两次密码输入不一致！');

        $mange = new Manage();

        if ( input('password') ) $data['password'] = password_hash(input('password'), PASSWORD_DEFAULT);
        if($id){
            if ( $data['status'] == 0 ) {
                $check = ManageGroup::get($data['manage_group_id']);
                if ($check['status'] == 1) return $this->cjson(1,'所在组别已停用，请先启用对应组别！');
            }
            $result = $mange->save($data,['manage_id' => $id]);
        } else {
            $data['add_time'] = date('Y-m-d H:i:s');
            $result = $mange->save($data);
        }

        if ($result) {
            return $this->cjson(0,'');
        } else {
            return $this->cjson(1,'执行失败');
        }

    }

    /**
     * 管理员删除
     */
    public function manager_delete()
    {
        $id = input('id/a');
        if($id == 1) return $this->cjson(1,'初始管理员禁止删除');
        if (Manage::destroy($id)) {
            return $this->cjson(0,'');
        } else {
            return $this->cjson(1,'删除失败');
        }
    }

    /**
     * 管理组设置
     * @return string
     */
    public function group_save(){
        $id = input('id');

        $data = [
            'manage_group_name'  => input('name'),
            'manage_group_desc'  => input('desc'),
            'status'  => input('status') == 0 ? input('status') : 1
        ];

        if (!$data['manage_group_name'] ) return $this->cjson(1,'组名不能为空！');
        if($id == 1 && $data['status'] == 1) return $this->cjson(1,'基础管理组禁止关闭');

        $mange = new Manage();
        $mangeGroup = new ManageGroup();

        if($id){
            $mange->startTrans();
            $mangeGroup->startTrans();
            try{
                if ($data['status'] == 1) {
                    $mange->save(['status'=>1],['manage_group_id'=>$id]);
                }
                $mangeGroup->save($data,['manage_group_id' => $id]);
                $mange->commit();
                $mangeGroup->commit();
                $result = true;
            }catch(Exception $e){
                $mange->rollback();
                $mangeGroup->rollback();
                $result = false;
            }

        } else {
            $result = $mangeGroup->save($data);
        }

        if ($result) {
            return $this->cjson(0,'');
        } else {
            return $this->cjson(1,'执行失败');
        }

    }

    /**
     * 管理员删除
     */
    public function group_delete()
    {
        $id = input('id');
        if($id == 1) return $this->cjson(1,'基础管理组禁止删除');

        $mange = new Manage();
        $mangeGroup = new ManageGroup();

        $mange->startTrans();
        $mangeGroup->startTrans();
        try{
            $mange->where(['manage_group_id'=>$id])->delete();
            $mangeGroup->where(['manage_group_id'=>$id])->delete();
            $mange->commit();
            $mangeGroup->commit();
            $result = true;
        }catch(Exception $e){
            $mange->rollback();
            $mangeGroup->rollback();
            $result = false;
        }

        if ($result) {
            return $this->cjson(0,'');
        } else {
            return $this->cjson(1,'删除失败');
        }
    }

    /**
     * 管理组权限设置
     */
    public function group_right_save(){

        $id = input('id');
        $right = input('right/a');

        $mangeGroup = new ManageGroup();

        $data = [
            'manage_group_right'=>implode(',',$right)
        ];

        if ($mangeGroup->save($data,['manage_group_id'=>$id])) {
            return $this->cjson(0,'');
        } else {
            return $this->cjson(1,'设置失败');
        }
    }
}
