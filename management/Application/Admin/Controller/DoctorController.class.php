<?php
namespace Admin\Controller;

use Think\Controller;
/*
*  医生信息管理
*/
class DoctorController extends Controller
{
	public function listDoc()
	{
		$model = D('doctor_info');
		$info = $model->search();
		//dump($info);die;
		$this->assign($info);
		$this->display();
	}

	public function add()
	{
		$model = D('doctor_info');
		$hos_id = I('get.hos_id');
		if(IS_POST){
			//dump(I('post.'));die;
			if($info=$model->create(I('post.'))){
				//dump($info);die;
				if($model->add()){
					$this->success('操作成功!', U('listDoc', array('hos_id' => $hos_id)));
                    exit;
				}
			}
			$error = $model->getError();
            $this->error($error);
		}
		$depModel = D('hospital_info');
		$dep = $depModel->getDep($hos_id);
		//dump($dep);die;
		$this->assign('dep',$dep);
		$this->display();
	}

	public function edit()
	{
		$doc_id = I('get.doc_id');
		$hos_id = I('get.hos_id');
		$model = D('doctor_info');
		if (IS_POST) {
            if($info = $model->create(I('post.'),2)){
                if(FALSE!==$model->save()){
                    $this->success('操作成功!', U('listDoc', array('hos_id' => $hos_id)));
                    exit;
                }
            }            
            $error = $model->getError();
            $this->error($error);
            
        }
		$depModel = D('hospital_info');
		$dep = $depModel->getDep($hos_id);
		$data = $model->find($doc_id);
		$address = explode(" ",$data['doc_address']);
        $data['doc_address'] = $address;
        //dump($data);die;
		$this->assign(array(
			'data' => $data,
			'dep'  => $dep
			));
		$this->display();
	}

	public function delete()
	{
		$doc_id = I('get.doc_id');
		$hos_id = I('get.hos_id');
		$model = D('doctor_info');
		if(FALSE !== $model->delete($doc_id)){
			$this->success('操作成功!', U('listDoc', array('hos_id' => $hos_id)));
            exit;
		}
		$error = $model->getError();
        $this->error($error);
	}
}
