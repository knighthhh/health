


var serverName = '10.77.116.160:80';


//判断是否登录了
function islogin(){
    var user_phone = plus.storage.getItem('user_phone');
    if(user_phone != null){
        return true;
    }else{
       	return false;
    }
}
