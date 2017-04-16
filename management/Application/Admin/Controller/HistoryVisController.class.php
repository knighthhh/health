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
		$info = $model->search();
		//dump($info);die;
		$this->assign($info);
		$this->display();
	}

	public function add()
	{
		$model = D('see_doc_case');
		if(IS_POST){	
		//dump($_POST);die;	
			if($info=$model->create(I('post.'),1)){
				//dump($info);die;
				if($model->add()){
					$this->success('操作成功!', U('listHis'));
                    exit;
				}
			}
			$error = $model->getError();
            $this->error($error);
		}
		$this->display();
	}

	public function edit()
	{
		$seecase_id = I('get.seecase_id');
		$model  = D('see_doc_case');
        if (IS_POST) {
        	//dump($_POST);die;
        	if ($model->create(I('post.'), 1)) {
                if (FASLE !== $model->save()) {
                    $this->success('操作成功!', U('listHis'));
                    exit;
                }
            }
            $error = $model->getError();
            $this->error($error);
        }
        //取出处方和检查图片
        $pageModel = D('page_img');
        $checkModel = D('check_img');
        $pageImg = $pageModel->where(array(
        	'seecase_id' => array('eq',$seecase_id)
        	))->select();
        $checkImg = $checkModel->where(array(
        	'seecase_id' => array('eq',$seecase_id)
        	))->select();
        //取出历史就诊信息到修改表单上
        $data = $model->find($seecase_id);
        //dump($data);die;
        $this->assign(array(
        	'data' => $data,
        	'pageImg' => $pageImg,
        	'checkImg' => $checkImg
        	));
		$this->display();
	}

	public function delete()
	{
		$seecase_id = I('get.seecase_id');
		$model  = D('see_doc_case');
        if (FASLE !== $model->delete($seecase_id)) {
            $this->success('操作成功!', U('listHis'));
            exit;
        }
        $error = $model->getError();
        $this->error($error);
	}
}
