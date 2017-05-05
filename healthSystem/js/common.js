


//var serverName = '192.168.43.193:88';
var serverName = '114.115.143.74:80';


//判断是否登录了
function islogin(){
    var user_phone = plus.storage.getItem('user_phone');
    if(user_phone != null){
        return true;
    }else{
       	return false;
    }
}
