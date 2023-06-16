%%%-------------------------------------------------------------------
%%% @author yinye
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. 四月 2021 19:45
%%%-------------------------------------------------------------------
-module(yypb_tpl_poolboy_mgr).
-author("yinye").

-include_lib("yyutils/include/yyu_comm.hrl").

%% API functions defined
-export([init/0, new_pool/2,add_count/2,stop_pool/1]).

%% ===================================================================================
%% API functions implements
%% ===================================================================================

%% =======================  WorkMod 相关方法 ============================================================
%% yypb_tpl_poolboy_mgr:init().
init()->
  yypb_poolboy_api:ensure_sup_started(),
  ?OK.

%% yypb_exmp_poolboy_mgr:new_pool(tpl,10).
new_pool(PoolId,PoolSize)->
  WorkerAgent = yypb_pb_worker_agent:new_pojo(yypb_tpl_pb_worker:get_mod(), yypb_tpl_pb_worker_data:new_pojo()),
  WorkPid = yypb_poolboy_api:new_pool(PoolId,PoolSize,WorkerAgent),
  WorkPid.

%% yypb_exmp_poolboy_mgr:add_count(tpl,10).
add_count(PoolId,Param) when is_number(Param)->
  WorkFun = fun yypb_tpl_pb_worker:add_count/2,
  Result = yypb_poolboy_api:do_work(PoolId,{WorkFun,Param}),
  {?OK,Result}.

stop_pool(PbPid)->
  yypb_poolboy_api:stop_pool(PbPid),
  ?OK.






