 <?php
if (!empty($_POST)) { 
 
    $ret=array('strings'=>$_POST,'error'=>'0'); 
 
    $fs=array(); 
 
    foreach ( $_FILES as $name=>$file ) { 
 
        $fn=$file['name']; 
//      $ft=strrpos($fn,'.',0); 
//      $fm=substr($fn,0,$ft); 
//      $fe=substr($fn,$ft); 
        $fp='D:/WWW/'.$fn; 
//      $fi=1; 
//      while( file_exists($fp) ) { 
//          $fn=$fm.'['.$fi.']'.$fe; 
//          $fp='D:/WWW/'.$fn; 
//          $fi++; 
//      } 
 
        move_uploaded_file($file['tmp_name'],$fp); 
 
//      $fs[$name]=array('name'=>$fn,'url'=>$fp,'type'=>$file['type'],'size'=>$file['size']); 
    } 
 
//  $ret['files']=$fs; 
// 
//  echo json_encode($ret); 
}else{ 
    echo "{'error':'Unsupport GET request!'}"; 
} 
 
?> 