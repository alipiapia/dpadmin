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

namespace app\common\validate;

use think\Validate;

/**
 * 订单验证器
 * @package app\common\validate
 * @author pp
 */
class Order extends Validate
{
    //定义验证规则
    protected $rule = [
        'order_sn|订单号' => 'require|unique:Order',
        'product_id|商品' => 'require',
        'order_price|订单金额' => 'require',
        'shipping_fee|运费' => 'require|float',
        'buyer|收货人' => 'require',
        'buyer_address|收货地址' => 'require',
    ];

    //定义验证提示
    protected $message = [
        'order_sn.unique'     => '该订单号已存在',
    ];

    //定义验证场景
    protected $scene = [
        'order_sn' => ['order_sn'],
        //添加
        'add'  =>  ['order_sn' => 'require', 'desc' => 'require'],
        //更新
        'update'  =>  ['order_sn' => 'require', 'desc' => 'require'],
    ];
}
