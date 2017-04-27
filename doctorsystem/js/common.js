

var serverName = '10.77.115.200:80';
 				  

//判断是否登录了
function islogin(){
    var doc_phone = plus.storage.getItem('doc_phone');
    if(doc_phone != null){
        return true;
    }else{
       	return false;
    }
}
