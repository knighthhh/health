<?php
namespace Connector\Controller;

use Think\Controller;
class UserController extends Controller{
	public function reg(){
		if(!$_POST['user_phone']||!$_POST['user_password']) {
			$res['result']=0;
			$res['data']="手机号码或者密码不能为空";
		}else{
			$model = D('user_info');
			$data['user_phone']=$_POST['user_phone'];
			// 用户注册之前先对密码加密
			$data['user_password']=md5($_POST['user_password'].C('MD5_KEY'));
			//用户名生成随机字符串
			$name = new \Org\Util\String();
			$data['user_name']=$name->randString(6,5);
			$data['user_time']=date('Y-m-d H:i:s');
			//设置默认头像
			$data['user_img']='User/user_img.png';
			$findmess['user_phone']=$_POST['user_phone'];
			$user=$model->where($findmess)->find();
			//先判断该手机是否注册过
			if ($user) {
				//User exists
				$res['result']=0;
				$res['data']="该手机号已经被注册";
			}else{
				//注册融云token
				$appKey = 'c9kqb3rdcvq4j';
				$appSecret = 'usuKQXzEY2';
				$RongCloud = new \Im\RongCloud($appKey,$appSecret);
				// 获取 Token 方法
				$rongyun = $RongCloud->user()->getToken($data['user_phone'], 'username', 'http://www.rongcloud.cn/images/logo.png');
				$rongyun = json_decode($rongyun,1);
				$data['im_token'] = $rongyun['token'];
				//写入数据库
				$addres=$model->add($data);
				$res['result']=1;
				$res['data']="恭喜注册成功";
			}
		}

		echo json_encode($res);
	}
	
	public function login(){
		
		if(I('post.user_phone') && I('post.user_token')){
			$data['user_phone']=I('post.user_phone');
			$data['user_token']=I('post.user_token');
			$mess=M('user_info')->where($data)->find();
			if ($mess) {
				
				//token过期，重新登录
				if(ceil((time() - strtotime($mess['token_time']))/(60*60*24))>=7){
					$res['result']=0;
					$res['data']="您的登录信息已过期，请重新登录";
				}else{
					$res['result']=1;
					$res['data']="自动登录成功";
					$res['user_token']=md5('user_phone'+time());
					$res['user_id']=$mess['user_id'];
					$res['im_token']=$mess['im_token'];
				//	$res['user_name']=$mess['user_name'];
					
					$token['user_token']=$res['user_token'];
					$token['token_time']=date('Y-m-d H:i:s');
					$token['login_time']=date('Y-m-d H:i:s');
					M('user_info')->where($data)->save($token);
				
				}
				
			}else{
				$res['result']=0;
				$res['data']="您的登录信息已过期，请重新登录";
			}
		}else{
			$data['user_phone']=I('post.user_phone');
			$data['user_password']=md5(I('post.user_password').C('MD5_KEY'));
			$mess=M('user_info')->where($data)->find();
			if ($mess) {
				$res['result']=1;
				$res['data']="登录成功";
				$res['user_token']=md5('user_phone'+time());
				$res['user_id']=$mess['user_id'];
				$res['im_token']=$mess['im_token'];
				//$res['user_name']=$mess['user_name'];
				
				$token['user_token']=$res['user_token'];
				$token['token_time']=date('Y-m-d H:i:s');
				$token['login_time']=date('Y-m-d H:i:s');
				M('user_info')->where($data)->save($token);
				
			}else{
				$res['result']=0;
				$res['data']="用户名或密码错误";
			}
		}

		echo json_encode($res);
	}
	
	public function getuserInfo(){
			$data['user_phone']=I('post.user_phone');
			$res=M('user_info')->where($data)->find();
			$ic = C('IMAGE_CONFIG');
			$res['user_img']=$ic['viewPath'].$res['user_img'];
			$res['result']=1;
			
			echo json_encode($res);
	}
	
	public function aa(){
		$appKey = 'c9kqb3rdcvq4j';
		$appSecret = 'usuKQXzEY2';
		$RongCloud = new \Im\RongCloud($appKey,$appSecret);
				
		$result = $RongCloud->message()->getHistory('2017041701');
		echo "getHistory    ";
		print_r($result);
		echo "\n";
	}
}