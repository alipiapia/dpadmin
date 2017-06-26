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

/**
 * 菜单信息
 */
return [
    [
        'title'       => '订单',
        'icon'        => 'fa fa-fw fa-newspaper-o',
        'url_type'    => 'module',
        'url_value'   => 'order/index/index',
        'url_target'  => '_self',
        'online_hide' => 0,
        'sort'        => 100,
        'child'       => [
            [
                'title'       => '订单列表',
                'icon'        => 'fa fa-fw fa-folder-open-o',
                'url_type'    => 'module',
                'url_value'   => '',
                'url_target'  => '_self',
                'online_hide' => 0,
                'sort'        => 100,
                'child'       => [],
            ],
            [
                'title'       => '订单管理',
                'icon'        => 'fa fa-fw fa-th-list',
                'url_type'    => 'module',
                'url_value'   => '',
                'url_target'  => '_self',
                'online_hide' => 0,
                'sort'        => 100,
                'child'       => [],
            ],
        ],
    ],
];
