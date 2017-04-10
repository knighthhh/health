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
            $firstCharter = mb_substr($v['doc_name'],0,1);
            $firstCharter = getFirstCharter($firstCharter);
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
        //dump($info);die;
        echo json_encode($info);
    }
}