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
use util\Tree;
use think\Db;

/**
 * 用户默认控制器
 * @package app\admin\controller
 */
class User extends Admin
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
        $data_list = UserModel::where($map)->order('sort,id desc')->paginate();

        // 分页数据
        $page = $data_list->render();

        // 使用ZBuilder快速创建数据表格
        return ZBuilder::make('table')
            ->setPageTitle('用户管理') // 设置页面标题
            ->setTableName('User') // 设置数据表名
            ->setSearch(['username' => '用户名', 'email' => '邮箱', 'mobile' => '手机号', 'ref_mobile' => '推荐人手机号', 'group_mobile' => '团队手机号']) // 设置搜索参数
            ->addColumns([ // 批量添加列
                ['username', '用户名'],
                ['nickname', '昵称'],
                ['email', '邮箱'],
                ['mobile', '手机号'],
                ['ref_mobile', '推荐人手机号'],
                ['group_mobile', '团队手机号'],
                ['pro_level', '代理等级'],
                ['balance', '余额', 'text.edit'],
                // ['score', '积分'],
                ['create_time', '注册时间'],
                ['status', '审核状态', 'switch'],
                ['right_button', '操作', 'btn']
            ])
            ->addTimeFilter('create_time')
            ->addTopButtons('enable,disable,delete') // 批量添加顶部按钮
            ->addRightButtons('delete') // 批量添加右侧按钮
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
    //         $result = $this->validate($data, 'User');
    //         // 验证失败 输出错误信息
    //         if(true !== $result) return $this->error($result);

    //         if ($user = UserModel::create($data)) {
    //             // 记录行为
    //             action_log('user_add', 'user', $user['id'], UID);
    //             return $this->success('新增成功', url('index'));
    //         } else {
    //             return $this->error('新增失败');
    //         }
    //     }

    //     // 使用ZBuilder快速创建表单
    //     return ZBuilder::make('form')
    //         ->setPageTitle('新增') // 设置页面标题
    //         ->addFormItems([ // 批量添加表单项
    //             ['text', 'username', '用户名', '必填，可由英文字母、数字组成'],
    //             ['text', 'nickname', '昵称', '可以是中文'],
    //             ['password', 'password', '密码', '必填，6-20位'],
    //             ['text', 'email', '邮箱', ''],
    //             ['text', 'mobile', '手机号'],
    //             ['text', 'ref_mobile', '推荐人手机号'],
    //             ['radio', 'status', '状态', '', ['禁用', '启用'], 1]
    //         ])
    //         ->fetch();
    // }

    // /**
    //  * 编辑
    //  * @param null $id 用户id
    //  * @author thinkphp
    //  * @return mixed
    //  */
    // public function edit($id = null)
    // {
    //     if ($id === null) return $this->error('缺少参数');

    //     // 保存数据
    //     if ($this->request->isPost()) {
    //         $data = $this->request->post();

    //         // 验证
    //         $result = $this->validate($data, 'User.update');
    //         // 验证失败 输出错误信息
    //         if(true !== $result) return $this->error($result);

    //         // 如果没有填写密码，则不更新密码
    //         if ($data['password'] == '') {
    //             unset($data['password']);
    //         }

    //         if ($user = UserModel::update($data)) {
    //             // 记录行为
    //             // action_log('user_edit', 'user', $user['id'], UID, get_nickname($user['id']));
    //             return $this->success('编辑成功', cookie('__forward__'));
    //         } else {
    //             return $this->error('编辑失败');
    //         }
    //     }

    //     // 获取数据
    //     $info = UserModel::where('id', $id)->field('password', true)->find();

    //     // 使用ZBuilder快速创建表单
    //     return ZBuilder::make('form')
    //         ->setPageTitle('编辑') // 设置页面标题
    //         ->addFormItems([ // 批量添加表单项
    //             ['hidden', 'id'],
    //             ['static', 'username', '用户名', '不可更改'],
    //             ['static', 'nickname', '昵称', '可以是中文'],
    //             // ['password', 'password', '密码', '必填，6-20位'],
    //             ['static', 'email', '邮箱', ''],
    //             ['static', 'mobile', '手机号'],
    //             ['static', 'ref_mobile', '推荐人手机号'],
    //             ['static', 'status', '状态', '', ['禁用', '启用']]
    //         ])
    //         ->hideBtn('submit')
    //         ->setFormData($info) // 设置表单数据
    //         ->fetch();
    // }

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
        return parent::setStatus($type, ['user_'.$type, 'user', $uid_delete, UID, implode('、', $ids)]);
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
        $config  = UserModel::where('id', $id)->value($field);
        $details = '字段(' . $field . ')，原值(' . $config . ')，新值：(' . $value . ')';
        // $this->error(floatval($value).'==');
        if($field == 'balance'){
            if(floatval($value) == 0){
                $this->error('请输入有效金额');
            }
            $new = floatval($config) + floatval($value);
            if($new < 0){
                $this->error('余额不足');
            }
            // $this->error($new.'==');

            //余额计算
            $details = '字段(' . $field . ')，原值(' . $config . ')，新值：(' . $new . ')';

            //添加管理员录款记录
            $configAccountType = config('order.account_type');
            $curAccountData = [
                'uid' => $id,
                'sign' => (floatval($value) < 0) ? 1 : 2,
                // 'sign' => 2,
                'count' => abs((floatval($value))),
                // 'count' => $abs,
                'type' => 1,
                'desc' => $configAccountType[1].' 金额： '. ((floatval($value) < 0) ? '-' : '+') . abs(floatval($value)).'元'
                // 'desc' => $configAccountType[1].' 金额： '. $abs.'元'
            ];
            $addCurUserAccount = add_user_account($curAccountData);
            // $this->error($details);
            $pk  = Db::name('User')->getPk();
            $res = Db::name('User')->where($pk, $id)->setField($field , $new);
            $msg = (floatval($value) > 0) ? '充值' : '扣款';
            return $res ? $this->success($msg.'成功') : $this->error($msg.'失败');
        }
        return parent::quickEdit(['user_edit', 'user', $id, UID, $details]);
    }
}
