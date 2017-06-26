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
 * 模块信息
 */
return [
  'name' => 'product',
  'title' => '商品',
  'identifier' => 'product.pp.module',
  'version' => '1.0.0',
  'description' => '商品模块',
  'author' => 'pp',
  'author_url' => 'http://www.thinkphp.cn',
  'need_module' => [
    [
      'admin',
      'admin.dolphinphp.module',
      '1.0.0',
    ],
  ],
  'need_plugin' => [],
  'tables' => [],
  'database_prefix' => 'dp_',
  'config' => [
    [
      'text',
      'summary',
      '默认摘要字数',
      '发布文章时，如果没有填写摘要，则自动获取文档内容为摘要。如果此处不填写或填写0，则不提取摘要。',
      0,
    ],
    [
      'ckeditor',
      'contact',
      '联系方式',
      '',
      '<div class="font-s13 push"><strong>河源市卓锐科技有限公司</strong><br /></div>',
    ],
    [
      'textarea',
      'meta_head',
      '顶部代码',
      '代码会放在 <code>&lt;/head&gt;</code> 标签以上',
      '',
    ],
    [
      'textarea',
      'meta_foot',
      '底部代码',
      '代码会放在 <code>&lt;/body&gt;</code> 标签以上',
      '',
    ],
    [
      'radio',
      'support_status',
      '在线客服',
      '',
      [
        '禁用',
        '启用',
      ],
      1,
    ],
    [
      'colorpicker',
      'support_color',
      '在线客服配色',
      '',
      'rgba(0,158,232,1]',
    ],
    [
      'image',
      'support_wx',
      '在线客服微信二维码',
      '在线客服微信二维码',
      '',
    ],
    [
      'ckeditor',
      'support_extra',
      '在线客服额外内容',
      '在线客服额外内容，可填写电话或其他说明',
      '',
    ],
  ],
  'access' => [
    'group' => [
      'tab_title' => '商品',
      'table_name' => 'product',
      'primary_key' => 'id',
      'parent_id' => 'pid',
      'node_name' => 'name',
    ],
  ],
];
