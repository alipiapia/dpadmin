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
 * 规格验证器
 * @package app\common\validate
 * @author pp
 */
class Spec extends Validate
{
    //定义验证规则
    protected $rule = [
        'product_id|商品' => 'require',
        'name|规格名称' => 'require|chsDash',
        'desc|详情' => 'require',
        'stock|库存' => 'require|>:0',
    ];

    //定义验证提示
    protected $message = [
        //
    ];

    //定义验证场景
    protected $scene = [
        //添加
        'add'  =>  ['product_id' => 'require', 'name' => 'require', 'desc' => 'require', 'stock' => 'require'],
        //更新
        'update'  =>  ['product_id' => 'require', 'name' => 'require', 'desc' => 'require', 'stock' => 'require'],
    ];
}
