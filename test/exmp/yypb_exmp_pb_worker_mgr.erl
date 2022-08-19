%%%-------------------------------------------------------------------
%%% @author yinye
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. 四月 2021 19:45
%%%-------------------------------------------------------------------
-module(yypb_exmp_pb_worker_mgr).
-author("yinye").

-include_lib("yyutils/include/yyu_comm.hrl").


%% API functions defined
-export([init/0,new_worker/0,add_count/2]).

%% ===================================================================================
%% API functions implements
%% ===================================================================================

%% =======================  WorkMod 相关方法 ============================================================
%% yypb_exmp_pb_worker_mgr:init().
init()->
  gs_yypb_pb_worker_mgr:ensure_sup_started(),
  ?OK.

%% Pid = yypb_exmp_pb_worker_mgr:new_worker().
new_worker()->
  WorkerAgent = yypb_pb_worker_agent:new_pojo(yypb_exmp_pb_worker, yypb_exmp_pb_worker_data:new_pojo()),
  WorkPid = gs_yypb_pb_worker_mgr:new_worker(WorkerAgent),
  WorkPid.

%% yypb_exmp_pb_worker_mgr:add_count(Pid,10).
add_count(WorkPid,Param) when is_number(Param)->
  Fun = fun yypb_exmp_pb_worker:add_count/2,
  gs_yypb_pb_worker_mgr:call_fun(WorkPid,{Fun,Param}).






