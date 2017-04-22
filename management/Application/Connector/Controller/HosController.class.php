<?php
namespace Connector\Controller;

use Think\Controller;

class HosController extends Controller{
	//获得热门医院列表
	public function getHotHos(){
    	$model = D('Hospital_info');
        $ic = C('IMAGE_CONFIG');
        //dump($ic['viewPath']);
    	$data = $model->select();
        for ($i=0; $i <count($data) ; $i++) { 
            $data[$i]['hos_navigate_img'] = $ic['viewPath'].$data[$i]['hos_navigate_img'];
        }
        //dump($data);die;
    	echo json_encode($data);
    }

    //获得医院详情
     public function getHosDetail(){
        $hos_id = I('get.hos_id');
        $model = D('Admin/hospital_info');
        $info = $model -> getHosDetail($hos_id);
        //dump($info);die;
        echo json_encode($info);
    }

    //获得医院详情轮播图片
    public function getHosImg(){
        $hos_id = I('get.hos_id');
        $model = D('hos_img');
        $info = $model->where(array(
            'hos_id' => array('eq',$hos_id),
            ))->select();
        $ic = C('IMAGE_CONFIG');
        for ($i=0; $i <count($info) ; $i++) { 
            $info[$i]['hos_img'] = $ic['viewPath'].$info[$i]['hos_img'];
            $info[$i]['hos_sm_img'] = $ic['viewPath'].$info[$i]['hos_sm_img'];
            $info[$i]['hos_mid_img'] = $ic['viewPath'].$info[$i]['hos_mid_img'];
        }
        //dump($info);die;
        echo json_encode($info);
    }

    //获得所有医院列表
    public function getHos(){
        $model = D('Hospital_info');
        $ic = C('IMAGE_CONFIG');
        //dump($ic['viewPath']);
        $data = $model->select();
        for ($i=0; $i <count($data) ; $i++) { 
            $data[$i]['hos_navigate_img'] = $ic['viewPath'].$data[$i]['hos_navigate_img'];
        }
        //dump($data);die;
        echo json_encode($data);
    }
	
	//按医院找医生
	public function hosDoc(){
		$province=I('post.province');
		$town=I('post.town');
		$ic = C('IMAGE_CONFIG');
		$data['hos_address'] = array('like',"%$province%$town%");
		$res=  M('hospital_info')->where($data)->select();
		//图片拼装
		for ($i=0; $i <count($res) ; $i++) { 
	        $res[$i]['hos_navigate_img'] = $ic['viewPath'].$res[$i]['hos_navigate_img'];
	    }
		
		//如果查询没有东西还要返回空
		if($res){
			
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}
	
	
	
}