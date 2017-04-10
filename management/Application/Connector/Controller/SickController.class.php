<?php
namespace Connector\Controller;

use Think\Controller;

class SickController extends Controller{
    //获取疾病列表信息
	public function getSick(){
        $model = D('Admin/department_info');
        $sickModel = D('Admin/illness');
        //$info = $model->getChildDep(1);
        $data = $model->where(array(
            'parent_id' => array('eq',0)))->select();
        $i = 0;
        foreach ($data as $k => $v) {
            $data[$i]['child']=$model->getChildDep($v['dep_id']);
            $i++;
        }
        $k = 0;
        foreach ($data as $k => $v) {
             $j = 0;
            foreach ($v['child'] as $k1 => $v1) {
                $data[$k]['child'][$j]['sick'] = $sickModel->where(array(
                    'two_depa_id'=>array('eq',$v1['dep_id'])
                    ))->select();
                $j++;
            }
            $k++;
        }
        // dump($data);
        // for ($i=0; $i < count($data) ; $i++) { 
        //     echo $data[$i]['dep_name'];
        //     //echo count($data[$i]['child']);
        //     for ($j=0; $j < count($data[$i]['child']); $j++) { 
        //         //dump($data[$i]['child'][$j]);
               
        //         for ($k=0; $k < count($data[$i]['child'][$j]['sick']); $k++) { 
        //              dump($data[$i]['child'][$j]['dep_name']);
        //             echo $data[$i]['child'][$j]['sick'][$k]['illness_name'];
        //         }
        //     }
        // }
        echo json_encode($data);
    }
}