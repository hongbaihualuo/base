<?php
namespace app\api\service;

use think\image\Exception;
use think\Request;

class FileService extends Common {

    /**
     * 单个图片上传
     * @return string
     */
    public function upload_one(){
        //try{
            $file = request()->file('img');// 获取表单提交过来的文件
			die($this->cjson(1,request()->file('img')));
            if(!is_array($file)) return false;
            $error = $_FILES['file']['error'];
			
            if($error) return false;

            //上传的时候的原文件名
            $dir = config('upload_path');

            if (!is_dir($dir['img'])) mkdir($dir['img'],0777,true);
            $info = $file->move($dir['img']);

            //获取文件的全路径
            $imgurl = substr(str_replace('\\', '/', $info->getPathname()),1);

            return $imgurl;
        /*}catch(Exception $e){
            return false;
        }*/

    }

    /**
     * 单个视频上传
     * @return string
     */
    public function upload_video_one(){
        try{
            $file = request()->file('file');// 获取表单提交过来的文件
            if(!is_array($file)) return false;
            $error = $_FILES['file']['error'];
            if($error) return false;

            //上传的时候的原文件名
            $dir = config('upload_path');

            if (!is_dir($dir['video'])) mkdir($dir['video'],0777,true);
            $info = $file->move($dir['video']);

            //获取文件的全路径
            $imgurl = substr(str_replace('\\', '/', $info->getPathname()),1);

            return $imgurl;
        }catch(Exception $e){
            return false;
        }

    }
	
	public function base_upload_img($name,$type = 1){
		if($_FILES[$name]["error"])
		{
			die($this->cjson(1,'未找到上传文件！'));
		}
		else
		{
			if ($type == 1) {
				//判断上传文件类型为png或jpg且大小不超过1024000B
				if (($_FILES[$name]["type"]=="image/png"||$_FILES[$name]["type"]=="image/jpeg")&&$_FILES[$name]["size"]<1024000)
				{
					//上传的时候的原文件名
					$dir = config('upload_path');
					$imgdir = $dir['img'].'/'.date('Ymd');
					if (!is_dir($imgdir)) mkdir($imgdir,0777,true);	
					
					//防止文件名重复
					$filename =$imgdir.'/'.time().$_FILES[$name]["name"];

					$filename =iconv("UTF-8","gb2312",$filename);
						
					if ( move_uploaded_file($_FILES[$name]["tmp_name"],$filename) ){
						return $filename;
					} else {
						die($this->cjson(1,'上传失败！'));
					}
							   
				}
				else
				{
					die($this->cjson(1,'图片格式不正确或文件大于1M！'));
				}
			} else if ($type == 2){
				//判断上传文件类型为png或jpg且大小不超过1024000B
				if ($_FILES[$name]["size"]<1024000*50)
				{
					//上传的时候的原文件名
					$dir = config('upload_path');
					$filedir = $dir['video'].'/'.date('Ymd');
					if (!is_dir($filedir)) mkdir($filedir,0777,true);	
					
					//防止文件名重复
					$filename =$filedir.'/'.time().$_FILES[$name]["name"];

					$filename =iconv("UTF-8","gb2312",$filename);
						
					if ( move_uploaded_file($_FILES[$name]["tmp_name"],$filename) ){
						return $filename;
					} else {
						die($this->cjson(1,'上传失败！'));
					}
							   
				}
				else
				{
					die($this->cjson(1,'文件格式不正确或文件大于50M！'));
				}
			}
			
		}
	}
	
}