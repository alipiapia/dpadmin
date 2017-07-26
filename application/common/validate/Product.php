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
 * 商品验证器
 * @package app\common\validate
 * @author pp
 */
class Product extends Validate
{
    //定义验证规则
    protected $rule = [
        'name|商品名称' => 'require|chsDash',
        'cate|分类' => 'require',
        'brand|品牌' => 'require',
        // 'spec|规格' => 'require',
        'desc|详情' => 'require',
        'market_price|市场价' => 'require|float',
        'cost_price|成本价' => 'require',
        'price|销售价' => 'require',
        'promotion_price|代理价' => 'require',
        // 'stock|库存' => 'require|number|min:1',
        'group_end_time|团购截止日期' => 'require',
    ];

    //定义验证提示
    protected $message = [
        //
    ];

    //定义验证场景
    protected $scene = [
        //添加
        'add'  =>  ['name' => 'require', 'desc' => 'require'],
        //更新
        'update'  =>  ['name' => 'require', 'desc' => 'require'],
    ];
}
