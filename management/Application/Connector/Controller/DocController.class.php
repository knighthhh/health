<?php
namespace Connector\Controller;

use Think\Controller;

class DocController extends Controller{
	//获得热门医生列表
	public function getHotDoc(){
    	$model = D('Admin/doctor_info');
        $ic = C('IMAGE_CONFIG');
    	$data = $model -> getHotDoc();
        for ($i=0; $i <count($data) ; $i++) { 
            $data[$i]['doc_img'] = $ic['viewPath'].$data[$i]['doc_img'];
        }
    	//dump($data);die;
    	echo json_encode($data);
    }

    //获得医生详情
    public function getDocDetail(){
        $doc_id = I('get.doc_id');
        $model = D('Admin/doctor_info');
        $ic = C('IMAGE_CONFIG');
        $info = $model -> getDocDetail($doc_id);
        $info['doc_img'] = $ic['viewPath'].$info['doc_img'];
        //dump($info);die;
        echo json_encode($info);
    }

    //按医生姓名列表查找功能
    public function getDocName(){
        $model = D('Admin/doctor_info');
        $data = $model
        ->field("doc_id,doc_name")
        ->select();
        $i = 0;
        foreach ($data as $k => $v) {
            $firstCharter = mb_substr($v['doc_name'],0,1,'utf8');
            $number = array(1,2,3,4,5,6,7,8,9,0);
            //dump($number);die;
            if(!in_array($firstCharter,$number)){
				$firstCharter = getFirstCharter($firstCharter);
            }
            $data[$i]['firstCharter'] = $firstCharter;
            $i++;
        }
        $arr = array();
        foreach ($data as $k=> $v) {
            $arr[] = $v['firstCharter'];
        }
        array_multisort($arr,SORT_ASC,$data);
        $i = 0;
        foreach ($data as $k => $v) {
             if(!in_array($v['firstCharter'],$info[$i-1])){
                 $info[$i][] = $v['firstCharter'];
                 $i++;
              }
        }
        foreach ($info as $k => $v) {
            foreach ($data as $k1 => $v1) {
                if($v1['firstCharter']==$info[$k][0])
                    $info[$k]['doc'][] = $v1;
                //echo $v1['firstCharter'];
            }
        }
		$firstCharter = getFirstCharter("sdas");
        echo json_encode($info);
    }

	//医生登录
	public function login(){
		
			$data['doc_phone']=I('post.doc_phone');
			$data['doc_password']=md5(I('post.doc_password').C('MD5_KEY'));
			$mess=M('doctor_info')->where($data)->find();
			if ($mess) {
				$res['result']=1;
				$res['data']="登录成功";
				//$res['user_token']=md5('user_phone'+time());
				$res['doc_id']=$mess['doc_id'];
				$res['im_token']=$mess['im_token'];
				//$res['user_name']=$mess['user_name'];
				
//				$token['user_token']=$res['user_token'];
//				$token['token_time']=date('Y-m-d H:i:s');
//				$token['login_time']=date('Y-m-d H:i:s');
//				M('user_info')->where($data)->save($token);
				
			}else{
				$res['result']=0;
				$res['data']="用户名或密码错误";
			}
		echo json_encode($res);
	}
	
	//头像修改
	public function headimg(){
		if(!empty($_POST)){
			$data['doc_phone']=I('post.doc_phone');
			foreach ( $_FILES as $name=>$file ) {
				if($file['error']==0){
					 $cfg = array(
	                   'rootPath' => './Public/Uploads/doctor/headimg/',
	               );
	               $up = new \Think\Upload($cfg);
	               $z = $up -> uploadOne($file);
				   $path = 'doctor/headimg/'.$z['savepath'].$z['savename'];
				   $saveimg['doc_img']=$path;
				   //上传成功，把头像路径写入数据库
				   if($z){
				   		M('doctor_info')->where($data)->save($saveimg);
					    $res['result']=1;
				   }
				}else{
					$res['result']=0;
				}
			}
        }else{
        	$res['result']=0;
        }
		echo json_encode($res);
	}
}