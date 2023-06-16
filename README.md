
# 对进程池 poolboy 的规范使用进行封装

### 添加依赖

rebar3 文件rebar.config添加依赖

    {deps, [
      {pbwraper, {git, "https://github.com/yinye1024/pbwraper", {tag, "<Latest tag>"}}}
       ]
    }

__Latest tag__ 是最新版本.


### 测试用例

跑用例，看console输出

>
> rebar3 eunit --module=yypb_test
>

### 如何使用

参考测试用例

1.yypb_test

      测试用例， yypb_test_poolboy_mgr:init() 启动进程池，
      然后 yypb_test_poolboy_mgr:add_count() 通过进程池实现 add_count 业务逻辑

2.yypb_test_poolboy_mgr

    使用进程池的主要逻辑。



规范使用 参考tpl

### 主要模块

1. yypb_poolboy_api

   外部调用此方法实现进程池的相关业务。
