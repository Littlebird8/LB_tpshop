<?php

namespace app\admin\model;

use think\Model;

class Attribute extends Model
{
    //将数据表中的默认字段改为需要的字段
    public function getAttrTypeAttr($value){
        $attr_type=['唯一属性','单选属性'];
        return $attr_type[$value];
    }
    public function getAttrInputTypeAttr($value){
        $attr_type=['输入框','下拉列表','多选框'];
        return $attr_type[$value];
    }
}
