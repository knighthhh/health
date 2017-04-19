<?php
namespace Connector\Controller;

use Think\Controller;
class ImController extends Controller{
	public function headimg(){
		$ic = C('IMAGE_CONFIG');
		$data['imgData']=I('post.imgData');
		$img = base64_decode($data['imgData']);
		$path = './Public/Uploads/User/headimg/';
		$imgname=uniqid().'.png';
		$zijie = file_put_contents($path.$imgname, $img);//返回的是字节数
		if($zijie){
			$res['result']=1;
			$res['imgurl']=$ic['viewPath'].'User/headimg/'.$imgname;
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}
	function aa(){
		 echo uniqid(); 
	}
}