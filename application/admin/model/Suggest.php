<?php
namespace app\admin\model;

use think\Model;

class Suggest extends Model
{

    /**
     * 获取用户
     * @return false|\PDOStatement|string|\think\Collection
     */
    public function get_suggest($where='',$num=6,$page=0,$field='a.*')
    {
        $this->field($field)->alias('a')->where($where)->order('a.id desc');

        if (!$page) {
            $list = $this->limit($num)->select();
        } else {
            $list = $this->paginate($num,false,['query'=>$_REQUEST]);
        }

        return $list;
    }

    /**
     * 获取总记录数
     * @return int|string
     */
    public function get_suggest_count($where)
    {
        $count = $this->alias('a')
            ->where($where)->count();
        return $count;
    }

}