<?php
namespace app\admin\service;

class Common{

    public function _initialize(){

    }

    /**
     * 返回数据转换
     */
    public function cjson($code,$msg='',$url=''){
        $data = ['code'=>$code,'msg'=>$msg,'url'=>$url];
        return json_encode($data,true);
    }

}