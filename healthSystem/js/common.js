


//var serverName = '192.168.43.193:88';
var serverName = '172.17.32.112:88';


//判断是否登录了
function islogin(){
    var user_phone = plus.storage.getItem('user_phone');
    if(user_phone != null){
        return true;
    }else{
       	return false;
    }
}
