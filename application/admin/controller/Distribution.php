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
use app\admin\model\Config as ConfigModel;
use util\Tree;
use think\Db;

/**
 * 用户默认控制器
 * @package app\admin\controller
 */
class Distribution extends Admin
{
    /**
     * 用户首页
     * @return mixed
     */
    public function index()
    {
        // 保存数据
        if ($this->request->isPost()) {
            $data = $this->request->post();
            if($data['group_prize'] <= 0){
                $this->error("请输入大于零的数");
            }
            // pp($data);
            $data['value'] = $data['group_prize'];unset($data['name']);
            $res = ConfigModel::update($data);
            if ($res) {
                return $this->success('编辑成功');
            } else {
                return $this->error('编辑失败');
            }
        }

        // 获取数据
        // $info = config('order.group_prize');
        $info = ConfigModel::where('name', 'group_prize')->find();
        // pp($info);

        // 使用ZBuilder快速创建表单
        return ZBuilder::make('form')
            ->addFormItems([ // 批量添加表单项
                ['hidden', 'id'],
                ['number', 'group_prize', '团队奖励', '大于零的数', $info['value']],
            ])
            ->setFormData($info) // 设置表单数据
            ->fetch();
    }
}
