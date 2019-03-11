<?php
namespace app\admin\controller;

use app\admin\model\Menu;
use app\admin\service\VideoService;
use think\cache\driver\Redis;
use think\Session;

class Suggest extends Common{

    /**
     * 意见反馈
     */
    public function index(){
        $svideo = new VideoService();
        $data = $svideo->suggest_search();

        $this->assign('data',$data);
        return $this->fetch();
    }
}