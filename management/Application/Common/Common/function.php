<?php
//上传单张图片函数
function uploadOne($imgName, $dirName, $thumb = array())
{
    $ic     = C('IMAGE_CONFIG');
    $upload = new \Think\Upload(array(
        'rootPath' => $ic['rootPath'],
        'ext'      => $ic['ext'],
    ));
    $upload->savePath = $dirName . "/";
    $info             = $upload->upload(array($imgName => $_FILES[$imgName]));
    if (!$info) {
        return array(
            'ok'    => 0,
            'error' => $upload->getError(),
        );
    } else {
        $ret['ok'] = 1;
        //生成原图的名字
        $ret['images'][0] = $logoName = $info[$imgName]['savepath'] . $info[$imgName]['savename'];
        if ($thumb) {
            $image = new \Think\Image();
            foreach ($thumb as $k => $v) {
                //生成缩略图的名字
                $ret['images'][$k + 1] = $info[$imgName]['savepath'] . "thumb_" . $k . "_" . $info[$imgName]['savename'];
                $image->open($ic['rootPath'] . $logoName);
                //生成缩略图并保存在指定目录中
                $image->thumb($v[0], $v[1])->save($ic['rootPath'] . $ret['images'][$k + 1]);
            }
        }

    }
    return $ret;
}

//删除图片函数
function delImg($oldPath)
{
    $ic = C('IMAGE_CONFIG');
    foreach ($oldPath as $k => $v) {
        unlink($ic['rootPath'] . $v);
    }

}

//显示图片函数封装
function showImage($url, $width = '', $height = '')
{
    $ic = C('IMAGE_CONFIG');
    if ($width) {
        $width = "width='$width'";
    }

    if ($height) {
        $height = "height='$height'";
    }

    echo "<img $width $height src='{$ic['viewPath']}$url' />";

}

function getFirstCharter($str)
{
    if (empty($str)) {return '';}
    $fchar = ord($str{0});
    if ($fchar >= ord('A') && $fchar <= ord('z')) {
        return strtoupper($str{0});
    }

    $s1  = iconv('UTF-8', 'gb2312', $str);
    $s2  = iconv('gb2312', 'UTF-8', $s1);
    $s   = $s2 == $str ? $s1 : $str;
    $asc = ord($s{0}) * 256 + ord($s{1}) - 65536;
    if ($asc >= -20319 && $asc <= -20284) {
        return 'A';
    }

    if ($asc >= -20283 && $asc <= -19776) {
        return 'B';
    }

    if ($asc >= -19775 && $asc <= -19219) {
        return 'C';
    }

    if ($asc >= -19218 && $asc <= -18711) {
        return 'D';
    }

    if ($asc >= -18710 && $asc <= -18527) {
        return 'E';
    }

    if ($asc >= -18526 && $asc <= -18240) {
        return 'F';
    }

    if ($asc >= -18239 && $asc <= -17923) {
        return 'G';
    }

    if ($asc >= -17922 && $asc <= -17418) {
        return 'H';
    }

    if ($asc >= -17417 && $asc <= -16475) {
        return 'J';
    }

    if ($asc >= -16474 && $asc <= -16213) {
        return 'K';
    }

    if ($asc >= -16212 && $asc <= -15641) {
        return 'L';
    }

    if ($asc >= -15640 && $asc <= -15166) {
        return 'M';
    }

    if ($asc >= -15165 && $asc <= -14923) {
        return 'N';
    }

    if ($asc >= -14922 && $asc <= -14915) {
        return 'O';
    }

    if ($asc >= -14914 && $asc <= -14631) {
        return 'P';
    }

    if ($asc >= -14630 && $asc <= -14150) {
        return 'Q';
    }

    if ($asc >= -14149 && $asc <= -14091) {
        return 'R';
    }

    if ($asc >= -14090 && $asc <= -13319) {
        return 'S';
    }

    if ($asc >= -13318 && $asc <= -12839) {
        return 'T';
    }

    if ($asc >= -12838 && $asc <= -12557) {
        return 'W';
    }

    if ($asc >= -12556 && $asc <= -11848) {
        return 'X';
    }

    if ($asc >= -11847 && $asc <= -11056) {
        return 'Y';
    }

    if ($asc >= -11055 && $asc <= -10247) {
        return 'Z';
    }

    return null;
}
