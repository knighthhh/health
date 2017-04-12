<?php
namespace Admin\Controller;

use Think\Controller;
/*
*  历史就诊记录管理
*/
class HistoryVisController extends Controller
{


	public function listHis()
	{
		$model = D('see_doc_case');
		$data = $model->search();
		$this->assign('data',$data);
		$this->display();
	}

	public function add()
	{
		$model = D('department_info');
		if(IS_POST){		
			if($info=$model->create(I('post.'),1)){
				if($model->add()){
					$this->success('操作成功!', U('listDep'));
                    exit;
				}
			}
			$error = $model->getError();
            $this->error($error);
		}
		$data = $model->where(array(
            'parent_id' => array('eq', 0)))->select();
		$this->assign('data',$data);
		$this->display();
	}

	public function edit()
	{
		$dep_id = I('get.dep_id');
		$model  = D('department_info');
        if (IS_POST) {
        	if ($model->create(I('post.'), 1)) {
                if (FASLE !== $model->save()) {
                    $this->success('操作成功!', U('listDep'));
                    exit;
                }
            }
            $error = $model->getError();
            $this->error($error);
        }
        //取出该科室信息到修改表单上
        $data = $model->find($dep_id);
        //取出科室列表
        $dep = $model->where(array(
            'parent_id' => array('eq', 0)))->select();
        $this->assign(array(
        	'data' => $data,
        	'dep'  => $dep
        	));
		$this->display();
	}

	public function delete()
	{
		$dep_id = I('get.dep_id');
		$model  = D('department_info');
        if (FASLE !== $model->delete($dep_id)) {
            $this->success('操作成功!', U('listDep'));
            exit;
        }
        $error = $model->getError();
        $this->error($error);
	}
}
