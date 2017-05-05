


//var serverName = '192.168.43.193:88';
var serverName = '114.115.143.74:80';
//var serverName = '10.77.117.237:88';

 				  

//判断是否登录了
function islogin(){
    var doc_phone = plus.storage.getItem('doc_phone');
    if(doc_phone != null){
        return true;
    }else{
       	return false;
    }
}
