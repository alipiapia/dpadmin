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
use app\common\model\Product as ProductModel;
use app\common\model\Cate as CateModel;
use app\common\model\Brand as BrandModel;
use app\common\model\Spec as SpecModel;
use util\Tree;
use think\Db;

/**
 * 商品控制器
 * @package app\admin\controller
 */
class Product extends Admin
{
    /**
     * 用户首页
     * @return mixed
     */
    public function index()
    {
        cookie('__forward__', $_SERVER['REQUEST_URI']);

        // 获取查询条件
        $map = $this->getMap();

        // 数据列表
        $data_list = ProductModel::where($map)->order('sort,id desc')->paginate();

        // 分页数据
        $page = $data_list->render();

        $cate = (new CateModel())->getColumn('', 'id,name');//分类
        $brand = (new BrandModel())->getColumn('', 'id,name');//品牌
        $spec = (new SpecModel())->getColumn('', 'id,name');//规格
        // pp($cate);

        // 使用ZBuilder快速创建数据表格
        return ZBuilder::make('table')
            ->setPageTitle('商品管理') // 设置页面标题
            ->setTableName('Product') // 设置数据表名
            ->setSearch(['id' => 'ID', 'name' => '商品名称']) // 设置搜索参数
            ->addOrder('id,name,create_time') // 添加排序
            ->addFilter('name,cate,brand,spec') // 添加筛选
            ->addColumns([ // 批量添加列
                ['id', 'ID'],
                ['name', '名称', 'text.edit'],
                ['picture', '封面', 'picture'],
                ['cate', '分类', 'select', $cate],
                ['brand', '品牌', 'select', $brand],
                // ['spec', '规格', 'select', $spec],
                ['create_time', '创建时间', 'datetime'],
                ['status', '状态', 'switch'],
                ['right_button', '操作', 'btn']
            ])
            ->addTimeFilter('created_at')
            ->addTopButtons('add,enable,disable,delete') // 批量添加顶部按钮
            ->addRightButtons('edit,delete') // 批量添加右侧按钮
            ->setRowList($data_list) // 设置表格数据
            ->setPages($page) // 设置分页数据
            ->fetch(); // 渲染页面
    }

    /**
     * 新增
     * @author thinkphp
     * @return mixed
     */
    public function add()
    {
        // 保存数据
        if ($this->request->isPost()) {
            $data = $this->request->post();
            // $data['spec'] = implode(',', $data['spec']);
            $data['spec'] = input('post.spec/a');
            // pp($data);
            
            // 验证
            $result = $this->validate($data, 'Product');
            // 验证失败 输出错误信息
            if(true !== $result) return $this->error($result);

            if ($product = ProductModel::create($data)) {
                // 记录行为
                // action_log('product_add', 'product', $product['id'], UID);
                return $this->success('新增成功', url('index'));
            } else {
                return $this->error('新增失败');
            }
        }


        $cate = (new CateModel())->getColumn('', 'id,name');//分类
        $brand = (new BrandModel())->getColumn('', 'id,name');//品牌
        $spec = (new SpecModel())->getColumn('', 'id,name');//规格

        // 使用ZBuilder快速创建表单
        return ZBuilder::make('form')
            ->setPageTitle('新增商品') // 设置页面标题
            ->addFormItems([ // 批量添加表单项
                ['text', 'name', '商品名称', '必填'],
                ['select', 'cate', '分类', '', $cate],
                ['select', 'brand', '品牌', '', $brand],
                ['select', 'spec', '规格', '', $spec, '', 'multiple'],
                ['image', 'picture', '商品封面'],
                ['images', 'pictures', '商品图片', '详情多图'],
                ['textarea', 'desc', '详情'],
                ['text', 'market_price', '市场价'],
                ['text', 'cost_price', '成本价'],
                ['text', 'price', '销售价'],
                ['text', 'promotion_price', '代理价'],
                ['text', 'stock', '商品库存'],
                ['text', 'group_days', '团购天数'],
                ['radio', 'status', '状态', '', ['禁用', '启用'], 1]
            ])
            ->fetch();
    }

    /**
     * 编辑
     * @param null $id 用户id
     * @author thinkphp
     * @return mixed
     */
    public function edit($id = null)
    {
        if ($id === null) return $this->error('缺少参数');

        // 保存数据
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $data['spec'] = input('post.spec/a');
            // $data['spec'] = implode(',', $data['spec']);
            // pp($data);

            // 验证
            $result = $this->validate($data, 'Product');
            // 验证失败 输出错误信息
            if(true !== $result) return $this->error($result);

            if ($product = ProductModel::update($data)) {
                // 记录行为
                // action_log('product_edit', 'product', $product['id'], UID, get_nickname($product['id']));
                return $this->success('编辑成功', cookie('__forward__'));
            } else {
                return $this->error('编辑失败');
            }
        }


        $cate = (new CateModel())->getColumn('', 'id,name');//分类
        $brand = (new BrandModel())->getColumn('', 'id,name');//品牌
        $spec = (new SpecModel())->getColumn('', 'id,name');//规格

        // 获取数据
        $info = ProductModel::where('id', $id)->find();

        // 使用ZBuilder快速创建表单
        return ZBuilder::make('form')
            ->setPageTitle('编辑') // 设置页面标题
            ->addFormItems([ // 批量添加表单项
                ['hidden', 'id'],
                ['text', 'name', '商品名称', '必填'],
                ['select', 'cate', '分类', '', $cate],
                ['select', 'brand', '品牌', '', $brand],
                ['select', 'spec', '规格', '', $spec, '', 'multiple'],
                ['image', 'picture', '商品封面'],
                ['images', 'pictures', '商品图片', '详情多图'],
                ['textarea', 'desc', '详情'],
                ['text', 'market_price', '市场价'],
                ['text', 'cost_price', '成本价'],
                ['text', 'price', '销售价'],
                ['text', 'promotion_price', '代理价'],
                ['text', 'stock', '商品库存'],
                ['text', 'group_days', '团购天数'],
                ['radio', 'status', '状态', '', ['禁用', '启用']]
            ])
            // ->addSelect('spec', '规格', '提示', $spec, '', 'multiple')
            ->setFormData($info) // 设置表单数据
            // ->submitConfirm()
            ->fetch();
    }

    /**
     * 删除用户
     * @param array $record 行为日志
     * @author thinkphp
     * @return mixed
     */
    public function delete($record = [])
    {
        return $this->setStatus('delete');
    }

    /**
     * 启用用户
     * @param array $record 行为日志
     * @author thinkphp
     * @return mixed
     */
    public function enable($record = [])
    {
        return $this->setStatus('enable');
    }

    /**
     * 禁用用户
     * @param array $record 行为日志
     * @author thinkphp
     * @return mixed
     */
    public function disable($record = [])
    {
        return $this->setStatus('disable');
    }

    /**
     * 设置用户状态：删除、禁用、启用
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
        return parent::setStatus($type, ['product_'.$type, 'product', $uid_delete, UID, implode('、', $ids)]);
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
        $config  = ProductModel::where('id', $id)->value($field);
        $details = '字段(' . $field . ')，原值(' . $config . ')，新值：(' . $value . ')';
        return parent::quickEdit(['product_edit', 'product', $id, UID, $details]);
    }
}
