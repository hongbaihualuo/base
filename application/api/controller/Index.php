<?php
namespace app\api\controller;


use app\api\service\VideoService;

class Index
{
    /**
     * 视频列表
     */
    public function video_list()
    {
        $svideo = new VideoService();
        $list = $svideo->videos_search();
        die($list);
    }

    /**
     * 视频评论列表
     */
    public function video_comment()
    {
        $svideo = new VideoService();
        $list = $svideo->comment_search();
        die($list);
    }

    /**
     * 意见反馈
     */
    public function suggest()
    {
        $svideo = new VideoService();
        $list = $svideo->suggest_add();
        die($list);
    }
}
