<?php
namespace Admin\Controller;

use Think\Controller;
/*
*  医院信息管理
*/
class HospitalController extends Controller
{
    public function listHos()
    {
        $model = D('hospital_info');
        $info  = $model->search();
        $this->assign($info);
        $this->display();
    }

    public function add()
    {
        $model = D('hospital_info');
        if (IS_POST) {
            //dump($_POST);die;
            if ($info = $model->create(I('post.'), 1)) {
                if ($model->add()) {
                    $this->success('操作成功!', U('listHos'));
                    exit;
                }
            }
            $error = $model->getError();
            $this->error($error);
        }
        $this->display();
    }

    public function delete()
    {

        $id    = I('get.id'); //获取医院ID
        $model = D("hospital_info");
        if (false !== $model->delete($id)) {
            $this->success('操作成功!', U('listHos'));
            exit;
        }
        $error = $model->getError();
        $this->error($error);

    }

    //医院图片AJAX删除方法
    public function ajaxDelImg()
    {
        $imgId = I('get.imgId'); //获取医院图片ID
        $model = D('hos_img');
        //获得医院图片的路径
        $imgPath = $model->field("hos_img,hos_mid_img,hos_sm_img")->find($imgId);
        //从硬盘上删除
        delImg($imgPath);
        $model->delete($imgId);
    }

    public function edit()
    {
        $id    = I('get.id'); //获取医院ID
        $model = D('hospital_info');
        if (IS_POST) {
            
            if ($model->create(I('post.'), 2)) {
                if (FASLE !== $model->save()) {
                    $this->success('操作成功!', U('listHos'));
                    exit;
                }
            }
            $error = $model->getError();
            $this->error($error);
        }
        //取出该医院的数据
        $data = $model->find($id);
        $address = explode(" ",$data['hos_address']);
        $data['hos_address'] = $address;
        //dump($data['hos_address'][0]);die;
        //取出该医院的图片显示到修改表单上
        $imgModel = D('hos_img');
        $imgData  = $imgModel->where(array(
            'hos_id' => array('eq', $id),
        ))->select();
        $this->assign(array(
            'imgData' => $imgData,
            'data'    => $data,
        ));
        $this->display();
    }

    /**
    医院科室管理
    **/
    
    public function listDep()
    {
        $hos_id = I('get.hos_id');
        $model  = D('hospital_info');
        $data   = $model->getDep($hos_id);
        $this->assign('data', $data);
        $this->display();
    }

    public function addDep()
    {
        $model    = D('hospital_info');
        $depModel = D('hos_dep');
        if (IS_POST) {
            $_POST['dep_time'] = date('Y-m-d H:i:s');
            if ($depModel->create(I('post.'), 1)) {
                if ($depModel->add()) {
                    $this->success('操作成功!', U('listDep', array('hos_id' => $_POST['hos_id'])));
                    exit;
                }
            }
            $error = $model->getError();
            $this->error($error);
        }
        $dep = $model->getTree();
        $this->assign(array(
            'dep' => $dep,
        ));
        $this->display();
    }

    public function editDep()
    {
        $model    = D('hospital_info');
        $depModel = D('hos_dep');
        $dep_id   = I('get.dep_id');
        $hos_id   = I('get.hos_id');
        if (IS_POST) {
            $_POST['dep_time'] = date('Y-m-d H:i:s');
            if($info = $depModel->create(I('post.'),2)){
                if(FALSE!==$depModel->save()){
                    $this->success('操作成功!', U('listDep', array('hos_id' => $hos_id)));
                    exit;
                }
            }
            $error = $model->getError();
            $this->error($error);
            
        }
        //取出该医院的科室信息
        $data = $depModel->where(array(
            'hos_id' => array('eq', $hos_id),
            'dep_id' => array('eq', $dep_id),
        ))->find();
        //取出所有科室
        $dep = $model->getTree();
        $this->assign(array(
            'dep'  => $dep,
            'data' => $data,
        ));
        $this->display();
    }
    public function delDep(){
        $hos_id = I('get.hos_id');
        $id= I('get.id');//此ID为hos_dep的主键ID值
        $model = D('hos_dep');
        if(false !== $model->delete($id)){
            $this->success('操作成功!', U('listDep', array('hos_id' => $hos_id)));
            exit;
        }
        $error = $model->getError();
        $this->error($error);
    }
}
