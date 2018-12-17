<?php

namespace app\admin\controller;
use think\Request;

class Index extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
//        $this->view->engine->layout(false);
        return view();
    }

}
