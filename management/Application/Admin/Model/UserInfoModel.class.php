<?php
namespace Admin\Model;
use Think\Model;

class UserInfoModel extends Model{
	public function search($perPage=5)
	{
		/* 分页 */
        $count = $this->count();
        //实例化翻页类对象
        $pageObj = new \Think\Page($count, $perPage);
        //设置翻页样式
        $pageObj->setConfig('next', '下一页');
        $pageObj->setConfig('prev', '上一页');
        //生成翻页按钮（上一页，下一页）
        $pageButton = $pageObj->show();
        $data       = $this
            ->limit($pageObj->firstRow . "," . $pageObj->listRows)
            ->select();
        return array(
            'data' => $data, //用户信息
            'page' => $pageButton, //分页结果
        );
	}

	protected function _before_insert(&$data,$option){
		if($_FILES['user_img']['error']==0){
			$ret  = uploadOne('user_img','User');
			$data['user_img'] = $ret['images'][0];
		}
		$data['user_city'] = $_POST['prov']." ".$_POST['city']." ".$_POST['dist'];
		$data['user_time'] = date('Y-m-d H:i:s');
	}

	 protected function _before_update(&$data,$option)
    {
        $user_id = $option['where']['user_id'];
        if($_FILES['user_img']['error']==0){
            $ret  = uploadOne('user_img','User');
            if($ret['ok']==1){
                $data['user_img'] = $ret['images'][0];
            }else{
                $this->error=$ret['error'];
                return  false;
            }
            //删除原来硬盘上的图片
            $oldPath = $this->field("user_img")->find($user_id);
            delImg($oldPath);
            
        }
        $data['user_city'] = $_POST['prov']." ".$_POST['city']." ".$_POST['dist'];
        $data['user_time'] = date('Y-m-d H:i:s');
    }

    protected function _before_delete($option){
    	$user_id = $option['where']['user_id'];
        //删除原来硬盘上的图片
        $oldPath = $this->field("user_img")->find($user_id);
        delImg($oldPath);
    }
}


?>