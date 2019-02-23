<?php
namespace app\admin\controller;

use app\admin\model\Menu;
use think\Controller;
use think\Session;

class Common extends Controller{

    public function _initialize()
    {
        //栏目信息
        $menu = new Menu();
        $controller = strtolower(request()->controller());
        $action = strtolower(request()->action());
        $menuInfo = collection($menu->get_menu("controller = '{$controller}' and action = '{$action}'",1))->toArray();


        $this->assign('menu',$menuInfo);

        if (!Session::get('manage')) {
            if ($this->request->isAjax()) {
                die(json_encode(["code"=>1,"msg"=>"","url"=>url("login/index")]));
            } else {
                return $this->redirect(url("login/index"));
            }
        }

        if($menuInfo && !in_array($menuInfo[0]['menu_id'],Session::get('right'))) {
            if ($this->request->isAjax()) {
                die(json_encode(["code"=>1,"msg"=>"","url"=>url("login/index")]));
            } else {
                return $this->redirect(url("index/welcome"));
            }
        }
    }
}