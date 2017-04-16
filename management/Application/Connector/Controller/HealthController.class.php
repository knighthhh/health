<?php
namespace Connector\Controller;

use Think\Controller;

class HealthController extends Controller{
    /*获取历史就诊记录*/
    public function getHisVis()
    {
        $user_phone = I('get.user_phone');
        $relative_id = I('get.relative_id');
        // $user_phone = 12345678912;
        // $relative_id = 4;
        //先根据用户手机获得用户ID
        $model = D('user_info');
        $user_id = $model->field("user_id")->where(array(
            'user_phone' => array('eq',$user_phone)
            ))->find();
        //再根据用户ID获得用户历史就诊记录
        $HisModel = D('see_doc_case');
        $data = $HisModel
        ->field('a.*,b.page_img_path,c.check_img_path')
        ->alias('a')
        ->join('__PAGE_IMG__ b on a.seecase_id = b.seecase_id', 'LEFT')
        ->join('__CHECK_IMG__ c on a.seecase_id = c.seecase_id', 'LEFT')
        ->where(array(
            'a.relative_id' => array('eq',$relative_id),
            'a.user_id' => array('eq',$user_id['user_id'])
            ))->select();
        foreach ($data as $k => $v) {
            $data[$k]['page_info'] = htmlspecialchars_decode($v['page_info']);
            $data[$k]['check_info'] = htmlspecialchars_decode($v['check_info']);

        }
        //dump($data);die;
        echo json_encode($data);
    }

    //获取历史就诊中的亲友姓名
    public function getHisRelaName()
    {
        $user_phone = I('get.user_phone');
        //$user_phone = 12345678912;
        //先根据用户手机获得用户ID
        $model = D('user_info');
        $user_id = $model->field("user_id")->where(array(
            'user_phone' => array('eq',$user_phone)
            ))->find();
        //获取亲友姓名
        $relaModel = D('relative_info');
        $data = $relaModel->field('relative_id,relative_name')->where(array(
            'user_id' => array('eq',$user_id['user_id'])
            ))->select();
        //dump($data);die;
        echo json_encode($data);
    }
}