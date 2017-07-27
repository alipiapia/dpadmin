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
 * 购物车验证器
 * @package app\common\validate
 * @author pp
 */
class Cart extends Validate
{
    //定义验证规则
    protected $rule = [
        'uid|用户id' => 'require',
        'product_id|商品id'   => 'require',
        'product_spec|商品规格' => 'require',
        'product_count|商品数量' => 'require|>:0',
    ];

    //定义验证提示
    protected $message = [
        //
    ];

    //定义验证场景
    protected $scene = [
        //
    ];
}
