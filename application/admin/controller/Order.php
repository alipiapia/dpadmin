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

/**
 * 订单控制器
 * @package app\order\admin
 */
class Order extends Admin
{
    /**
     * 订单首页
     * @return mixed
     */
    public function index()
    {
        cookie('__forward__', $_SERVER['REQUEST_URI']);

        // 获取查询条件
        // $map = $this->getMap();

        $search_field = input('search_field');
        $keyword = input('keyword');
        $keyword_arr = ['like', '%'.$keyword.'%'];
        $serach_field_arr = explode('|', $search_field);
        $map = [];
        if(in_array('order_sn', $serach_field_arr)){
            $ordIds = (new OrderModel)->getColumn(['order_sn' => $keyword_arr], 'id'); 
            if($ordIds){
                $map['order_sn'] = $keyword_arr;
            }            
        }
        if(in_array('order_note', $serach_field_arr)){
            $ordIds = (new OrderModel)->getColumn(['order_note' => $keyword_arr], 'id'); 
            if($ordIds){
                $map['order_note'] = $keyword_arr;
            }            
        }

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
        // pp($map);

        // 数据列表
        $data_list = OrderModel::where($map)->order('create_time desc')->paginate();

        // 分页数据
        $page = $data_list->render();

        $btn_access = [
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
            ->setSearch(['order_sn' => '订单号', 'product_id' => '商品名称', 'buyer' => '买家', 'order_note']) // 设置搜索参数
            ->addOrder('id,order_sn') // 添加排序
            ->addFilter('id,order_sn') // 添加筛选
            ->addColumns([ // 批量添加列
                ['order_sn' , '订单号'],
                ['product_id', '商品名称', 'callback', 'get_product_value', 'name'],
                ['product_count', '商品数量'],
                ['shipping_fee', '运费'],
                ['order_price', '订单金额'],
                ['buyer', '买家', 'callback', 'get_user_value', 'username'],
                // ['buyer_address', '收货地址'],
                // ['pay_status', '支付状态', 'status', '', config('order.pay_status')],
                // ['pay_type', '支付类型', 'status', '', config('order.pay_type')],
                ['order_note', '备注'],
                ['create_time', '下单时间'],
                // ['order_status', '订单状态', 'status', '', config('order.order_status')],
                ['order_status', '订单状态', 'status', '', config('order.order_status')],
                ['right_button', '操作', 'btn']
            ])
            // ->addValidate('Order', 'order_sn')
            // ->addTopButtons('custom', $btn_access) // 批量添加顶部按钮
            ->addRightButtons('edit') // 批量添加右侧按钮
            ->addRightButton('custom', $btn_access)
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
