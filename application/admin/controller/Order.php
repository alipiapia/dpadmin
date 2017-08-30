<?php
// +----------------------------------------------------------------------
// | 框架 [ thinkphp ]
// +----------------------------------------------------------------------
// | 版权所有 2008~2017 thinkphp [ http://www.thinkphp.cn ]
// +----------------------------------------------------------------------
// | 官方网站: http://thinkphp.cn
// +----------------------------------------------------------------------
// | 开源协议 ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------

namespace app\admin\controller;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;
use app\common\model\User as UserModel;
use app\common\model\Product as ProductModel;
use app\common\model\Order as OrderModel;
use util\Tree;
use think\Db;
use PHPExcel_IOFactory;
use PHPExcel;
use PHPExcel_Cell_DataType;
// use plugins\Excel\controller;

/**
 * 订单控制器
 * @package app\order\admin
 */
class Order extends Admin
{
    public function export(){//导出Excel
        // pp(input('post.'));
        $input = input('');
        $map = [
			'o.id' => ['in', $input['ids']],
			'o.order_status' => ['neq', '4'],
		];
        $xlsName  = "商城订单";
        $xlsCell  = array(
            array('order_sn','订单号'),
            array('user_name','收件人姓名'),
            array('user_mobile','收件人手机'),
            array('user_address','收件人地址'),
            array('product_name','商品名称'),
            array('product_count','商品数量'),
            array('product_price','购买商品金额'),
            array('order_note','备注'),
            array('user_buyer','会员'),
        );

        $xlsData  = Db::name('Order')
        ->alias('o')
        ->where($map)
        ->join('__PRODUCT__ p', 'o.product_id = p.id')
        ->join('__USER__ u', 'o.buyer = u.id')
        ->join('__USER_ADDRESS__ a', 'o.buyer_address = a.id')
        ->field('order_sn, a.username as user_name, a.mobile as user_mobile, o.buyer_address, p.name as product_name, product_count, p.member_price*product_count as product_price, order_note, u.username as user_buyer')
        ->select();
        // $xlsData = (new OrderModel)->getColumn($map, 'id,order_sn,order_note');
        $newXlsData = $xlsData;
        foreach ($xlsData as $k => $v) {
            $newXlsData[$k]['user_address'] = get_user_addresses($v['buyer_address']);
        }
        // pp($newXlsData);
        $res = $this->exportExcel($xlsName,$xlsCell,$newXlsData,false);
        // plugin_action('Excel/Excel/export', [$xlsName,$xlsCell,$xlsData]);

        // ob_end_clean();//这一步非常关键，用来清除缓冲区防止导出的excel乱码
        header("Pragma: public");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        // header("Content-Type: application/vnd.ms-execl");
        header("Content-Type: application/force-download");
        header("Content-Type: application/download");
        header("Content-type:application/vnd.ms-excel;charset=utf-8;name=".$res);
        header("Content-Disposition: attachment; filename=".$res);
        header("Content-Transfer-Encoding: binary");
        header("Pragma: no-cache");
        header("Expires: 0");
        // echo $res;die;

        // $res ? $this->success('导出成功', null, '_parent_reload') : $this->success('导出失败', null, '_close_pop');
        // pp('http://'. request()->server('HTTP_HOST') . DS. $res);
        echo 'http://'. request()->server('HTTP_HOST') . DS. $res;die;
        // $this->redirect($res);die;
        if($res) echo "<script language='javascript'>window.location.href='$res'</script>";

    }

    public function exportExcel($expTitle,$expCellName,$expTableData, $excelVersion = true){
        //include_once EXTEND_PATH.'PHPExcel/PHPExcel.php';//方法二
        $xlsTitle = iconv('utf-8', 'gb2312', $expTitle);//文件名称
        $fileName = $expTitle.date('_YmdHis');//or $xlsTitle 文件名称可根据自己情况设定
        // pp($fileName);
        $cellNum = count($expCellName);
        $dataNum = count($expTableData);
        $objPHPExcel = new PHPExcel();//方法一
        // $objPHPExcel = new \PHPExcel();//方法二
        $cellName = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM','AN','AO','AP','AQ','AR','AS','AT','AU','AV','AW','AX','AY','AZ');
        $objPHPExcel->getActiveSheet(0)->mergeCells('A1:'.$cellName[$cellNum-1].'1');//合并单元格
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A1', $expTitle.'  导出时间:'.date('Y-m-d H:i:s'));
        for($i=0;$i<$cellNum;$i++){
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue($cellName[$i].'2', $expCellName[$i][1]);
        }
        // Miscellaneous glyphs, UTF-8
        for($i=0;$i<$dataNum;$i++){
            for($j=0;$j<$cellNum;$j++){
                $objPHPExcel->getActiveSheet(0)->setCellValue($cellName[$j].($i+3), ' '.$expTableData[$i][$expCellName[$j][0]]);
            }
        }

        if($excelVersion){
            $excelVersion = 'Excel2007';//Excel版本
            $fileName .= '.xlsx';
        }else{
            $excelVersion = 'Excel5';//Excel版本
            $fileName .= '.xls';
        }

        ob_end_clean();//这一步非常关键，用来清除缓冲区防止导出的excel乱码
        header("Pragma: public");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        // header("Content-Type: application/vnd.ms-execl");
        header("Content-Type: application/force-download");
        header("Content-Type: application/download");
        header("Content-type:application/vnd.ms-excel;charset=utf-8;name=".$fileName);
        header("Content-Disposition: attachment; filename=".$fileName);
        header("Content-Transfer-Encoding: binary");
        header("Pragma: no-cache");
        header("Expires: 0");

        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, $excelVersion);//"Excel2007"生成2007版本的xlsx，"Excel5"生成2003版本的xls
        $objWriter->save('php://output');
        exit;
        // $objWriter->save(PUBLIC_PATH . 'download' . DS . date('Ymd') . DS . "$fileName");
        return $objWriter;

        $file_dir = 'public'. DS . 'download' . DS . date('Ymd');
        // pp($file_dir);
        if (!is_dir($file_dir)) {
            $mkdir = mkdir($file_dir, 0777, true);
            if($mkdir){
                $els = $objWriter->save($file_dir . DS . "$fileName");
                // pp($els);
                if(file_exists($file_dir . DS . "$fileName")){
                    // readfile($file_dir . DS . "$fileName");
                    // echo $file_dir;die;
                    return $file_dir . DS . "$fileName";
                    echo "<script>alert('导出成功！');</script>";
                }else{                    
                    echo "<script>window.location.reload();</script>";
                }
            }
        }else{
            $els = $objWriter->save($file_dir . DS . "$fileName");
            if(file_exists($file_dir . DS . "$fileName")){
                    // readfile($file_dir . DS . "$fileName");die;
                    // echo $file_dir . DS . "$fileName";die;
                return $file_dir . DS . "$fileName";
                echo "<script>alert('导出成功！');</script>";
            }else{                    
                echo "<script>window.location.reload();</script>";
            }
        }
    }

    /**
     * 订单首页
     * @return mixed
     */
    public function index()
    {
        cookie('__forward__', $_SERVER['REQUEST_URI']);

        // 获取查询条件
         $map = $this->getMap();
		 
        $search_field = input('search_field');
        $keyword = input('keyword');
        $keyword_arr = ['like', '%'.$keyword.'%'];
        $serach_field_arr = explode('|', $search_field);
//        $map = [];
//		 pp($map[$search_field]);

        if(in_array('order_sn', $serach_field_arr)){
            $ordIds = (new OrderModel)->getColumn(['order_sn' => $keyword_arr], 'id'); 
            if($ordIds){
                $map['order_sn'] = $keyword_arr;
            }            
        }
        
        // if(in_array('order_note', $serach_field_arr)){
        //     $ordIds = (new OrderModel)->getColumn(['order_note' => $keyword_arr], 'id'); 
        //     if($ordIds){
        //         $map['order_note'] = $keyword_arr;
        //     }            
        // }

        if(in_array('product_id', $serach_field_arr)){
            $proIds = (new ProductModel)->getColumn(['name' => $keyword_arr], 'id'); 
            if($proIds){
                $map['product_id'] = ['in', $proIds];
            }           
        }

        if(in_array('buyer', $serach_field_arr)){
            $buyerIds = (new UserModel)->getColumn(['username' => $keyword_arr], 'id'); 
            if($buyerIds){
                $map['buyer'] = ['in', $buyerIds];
            }
        }
		$map['order_status'] = ['neq', '4'];
		unset($map[$search_field]);
//         pp($map);

        // 数据列表
        $data_list = OrderModel::where($map)->order('create_time desc')->field('id,order_sn,product_id,product_count,shipping_fee,order_price,buyer,buyer_address,buyer_address as buyer_mobile,buyer_address as buyer_detail_address,order_note,create_time,order_status')->paginate();
        // pp(model('common/Order')->upData(['buyer_address' => 495], ['order_sn' => '2017083010248515']));

        // 分页数据
        $page = $data_list->render();

        //按钮：导出订单
        $btn_export = [
            'title' => '导出订单',
            'icon' => 'fa fa-sign-out',
            'class' => 'btn btn-primary js-get confirm',
            // 'href' => url('export', ['ids' => '__id__', 'table' => 'Order']),
            'href' => url('export'),
            'target' => '_blank',
            // 'href' => 'javascript:alert("p");',
            'data-title' => '确定导出订单吗？',
            // 'data-tips' => '取消之后就无法恢复了',
        ];

        //按钮：取消订单
        $btn_cancel = [
            'title' => '取消订单',
            'icon' => 'fa fa-sign-out',
            'class' => 'btn btn-xs btn-default ajax-get confirm',
            'href' => url('cancel', ['ids' => '__id__', 'table' => 'Order']),
            'data-title' => '确定取消该订单吗？',
            'data-tips' => '取消之后就无法恢复了',
        ];

        // 使用ZBuilder快速创建数据表格
        return ZBuilder::make('table')
            ->setPageTitle('订单管理') // 设置页面标题
            ->setTableName('Order') // 设置数据表名
            ->addTimeFilter('create_time')
            ->setSearch(['order_sn' => '订单号', 'product_id' => '商品名称', 'buyer' => '会员']) // 设置搜索参数
            ->addOrder('id,order_sn') // 添加排序
            ->addFilter('id,order_sn') // 添加筛选
            ->addColumns([ // 批量添加列
                ['order_sn' , '订单号'],
                ['product_id', '商品名称', 'callback', 'get_product_value', 'name'],
                ['product_count', '商品数量'],
                ['shipping_fee', '运费'],
                ['order_price', '订单金额'],
                ['buyer', '会员', 'callback', 'get_user_value', 'username'],
                ['buyer_address', '收件人姓名', 'callback', 'get_user_address_value', 'username'],
                ['buyer_mobile', '收件人电话', 'callback', 'get_user_address_value', 'mobile'],
                ['buyer_detail_address', '收件人地址', 'callback', 'get_user_addresses'],
                // ['pay_status', '支付状态', 'status', '', config('order.pay_status')],
                // ['pay_type', '支付类型', 'status', '', config('order.pay_type')],
                ['order_note', '备注'],
                ['create_time', '下单时间'],
                // ['order_status', '订单状态', 'status', '', config('order.order_status')],
                ['order_status', '订单状态', 'status', '', config('order.order_status')],
                ['right_button', '操作', 'btn']
            ])
            // ->addValidate('Order', 'order_sn')
            ->addTopButton('custom', $btn_export) // 批量添加顶部按钮
            ->addRightButtons('edit') // 批量添加右侧按钮
            ->addRightButton('custom', $btn_cancel)
            // ->addRightButton('edit', ['href' => url('edit', ['id' => '__id__', 'group' => 'index'])])
            ->setRowList($data_list) // 设置表格数据
            ->setPages($page) // 设置分页数据
            ->fetch(); // 渲染页面
    }

    // /**
    //  * 新增
    //  * @author thinkphp
    //  * @return mixed
    //  */
    // public function add()
    // {
    //     // 保存数据
    //     if ($this->request->isPost()) {
    //         $data = $this->request->post();
    //         // 验证
    //         $result = $this->validate($data, 'Order');
    //         // 验证失败 输出错误信息
    //         if(true !== $result) return $this->error($result);

    //         if ($order = OrderModel::create($data)) {
    //             // 记录行为
    //             //action_log('order_add', 'admin_order', $order['id'], UID);
    //             return $this->success('新增成功', url('index'));
    //         } else {
    //             return $this->error('新增失败');
    //         }
    //     }

    //     // 使用ZBuilder快速创建表单
    //     return ZBuilder::make('form')
    //         ->setPageTitle('新增') // 设置页面标题
    //         ->addFormItems([ // 批量添加表单项
    //             ['text', 'order_sn', '订单号'],
    //             ['text', 'product_id', '商品'],
    //             ['text', 'order_price', '订单金额'],
    //             ['text', 'shipping_fee', '运费'],
    //             ['text', 'buyer', '收货人'],
    //             ['text', 'buyer_address', '收货地址'],
    //             ['radio', 'order_status', '状态', '', ['禁用', '启用'], 1]
    //         ])
    //         ->fetch();
    // }

    /**
     * 编辑
     * @param null $id 订单id
     * @author thinkphp
     * @return mixed
     */
    public function edit($id = null)
    {
        if ($id === null) return $this->error('参数错误');

        // 获取数据
        $info = OrderModel::where('id', $id)->field('password', true)->find();
        // pp($info['order_status']);
        if(!in_array($info['order_status'], [1,2]))return $this->error('参数错误');

        // 保存数据
        if ($this->request->isPost()) {
            $data = $this->request->post();

            // 验证
            $result = $this->validate($data, 'Order.shipping');
            // 验证失败 输出错误信息
            if(true !== $result) return $this->error($result);

            if ($order = OrderModel::update($data)) {
                // 记录行为
                // action_log('order_edit', 'admin_order', $order['id'], UID, get_nickname($order['id']));

                //更新订单状态
                $data['order_status'] = 2;
                $upOrderStatus = OrderModel::update($data);
                return $this->success('编辑成功', cookie('__forward__'));
            } else {
                return $this->error('编辑失败');
            }
        }

        if($info['order_status'] == 2){
            // 使用ZBuilder快速创建表单
            return ZBuilder::make('form')
                ->setPageTitle('编辑') // 设置页面标题
                ->addFormItems([ // 批量添加表单项
                    // ['hidden', 'id'],
                    ['static', 'order_sn', '订单号'],
                    // ['static', 'product_id', '商品'],
                    ['static', 'order_price', '订单金额'],
                    // ['text', 'shipping_fee', '运费'],
                    ['static', 'create_time', '下单时间'],
                    ['static', 'order_note', '备注'],
                    // ['static', 'buyer_address', '收货地址'],
                    // ['radio', 'order_status', '订单状态', '', config('order.order_status')]
                    // ['Bmap', '111','CAf9a5889147c3b2b9ca3e3cdad0ca2a']
                    ['static', 'shipping_name', '物流公司'],
                    ['static', 'shipping_num', '物流单号'],
                ])
                // ->setBtnTitle('submit', '确认发货')
                // ->submitConfirm()
                ->hideBtn('submit')
                ->setFormData($info) // 设置表单数据
                ->fetch();

        }elseif($info['order_status'] == 1){
            // 使用ZBuilder快速创建表单
            return ZBuilder::make('form')
                ->setPageTitle('编辑') // 设置页面标题
                ->addFormItems([ // 批量添加表单项
                    ['hidden', 'id'],
                    ['static', 'order_sn', '订单号'],
                    // ['static', 'product_id', '商品'],
                    ['static', 'order_price', '订单金额'],
                    ['static', 'order_note', '备注'],
                    // ['text', 'shipping_fee', '运费'],
                    // ['static', 'buyer', '收货人'],
                    // ['static', 'buyer_address', '收货地址'],
                    // ['radio', 'order_status', '订单状态', '', config('order.order_status')]
                    // ['Bmap', '111','CAf9a5889147c3b2b9ca3e3cdad0ca2a']
                    ['text', 'shipping_name', '物流公司'],
                    ['text', 'shipping_num', '物流单号'],
                ])
                ->setBtnTitle('submit', '确认发货')
                ->submitConfirm()
                ->setFormData($info) // 设置表单数据
                ->fetch();

        }
    }

    // /**
    //  * 撤销订单
    //  * @param array $record 行为日志
    //  * @author thinkphp
    //  * @return mixed
    //  */
    // public function cancel()
    // {
    //     // return input('');
    //     // $id   = $this->request->isPost() ? input('post.id/a') : input('param.id');
    //     // $table = input('param.table');
    //     // $pk = Db::name($table)->getPk(); // 主键名称
    //     // $map[$pk] = ['in', $id];
    //     // if(input('id') == null)$this->error('操作失败');
    //     // $data = ['id' => input('id'), 'order_satus' => 4];
    //     $result = (new OrderModel)->upData(['order_satus' => 4], ['order_sn' => input('order_sn')]);
    //     // $result = Db::name($table)->where($map)->setField('order_satus', 4);
    //     // return $result;
    //     return $result ? $this->success('操作成功') : $this->error('操作失败');
    // }

    /**
     * 删除订单
     * @param array $record 行为日志
     * @author thinkphp
     * @return mixed
     */
    public function export2($record = [])
    {
        return $this->setStatus('export');
    }

    /**
     * 删除订单
     * @param array $record 行为日志
     * @author thinkphp
     * @return mixed
     */
    public function cancel($record = [])
    {
        return $this->setStatus('cancel');
    }

    /**
     * 删除订单
     * @param array $record 行为日志
     * @author thinkphp
     * @return mixed
     */
    public function delete($record = [])
    {
        return $this->setStatus('delete');
    }

    /**
     * 启用订单
     * @param array $record 行为日志
     * @author thinkphp
     * @return mixed
     */
    public function enable($record = [])
    {
        return $this->setStatus('enable');
    }

    /**
     * 禁用订单
     * @param array $record 行为日志
     * @author thinkphp
     * @return mixed
     */
    public function disable($record = [])
    {
        return $this->setStatus('disable');
    }

    /**
     * 设置订单状态：删除、禁用、启用
     * @param string $type 类型：delete/enable/disable
     * @param array $record
     * @author thinkphp
     * @return mixed
     */
    public function setStatus($type = '', $record = [])
    {
        $ids        = $this->request->isPost() ? input('post.ids/a') : input('param.ids');
        // if ((is_array($ids) && in_array(UID, $ids)) || $ids == UID) {
        //     $this->error('禁止操作当前账号');
        // }
        $uid_delete = is_array($ids) ? '' : $ids;
        $ids        = array_map('get_nickname', (array)$ids);
        return parent::setStatus($type, ['order_'.$type, 'admin_order', $uid_delete, UID, implode('、', $ids)]);
    }

    /**
     * 快速编辑
     * @param array $record 行为日志
     * @author thinkphp
     * @return mixed
     */
    public function quickEdit($record = [])
    {
        $id      = input('post.pk', '');
        // $id      == UID && $this->error('禁止操作当前账号');
        $field   = input('post.name', '');
        $value   = input('post.value', '');
        $config  = OrderModel::where('id', $id)->value($field);
        $details = '字段(' . $field . ')，原值(' . $config . ')，新值：(' . $value . ')';
        return parent::quickEdit(['order_edit', 'admin_order', $id, UID, $details]);
    }
}
