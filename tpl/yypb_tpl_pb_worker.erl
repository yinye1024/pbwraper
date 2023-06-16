%%%-------------------------------------------------------------------
%%% @author yinye
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. 四月 2021 19:45
%%%-------------------------------------------------------------------
-module(yypb_tpl_pb_worker).
-author("yinye").

-include_lib("yyutils/include/yyu_comm.hrl").


%% API functions defined
-export([get_mod/0,init/1,get_tick_time_span/0,do_fun/2,loop_tick/1]).
-export([add_count/2]).

%% ===================================================================================
%% API functions implements
%% ===================================================================================

%% =======================  WorkMod 相关方法 ============================================================
get_mod()->?MODULE.

init(WorkData)->
  ?LOG_INFO({"do init"}),
  WorkData.

get_tick_time_span()->
  %% 30 检查一次，超过5次失败认为是服务down了，发起重连
  30*1000.

%% return NewWorkData
loop_tick(WorkData)->
  Tick = yypb_tpl_pb_worker_data:get_tick(WorkData),
  NewWorkData = yypb_tpl_pb_worker_data:set_tick(Tick,WorkData),
  ?LOG_INFO({"loop tick",[count, Tick]}),
  NewWorkData.


do_fun({Fun,Param},WorkData)->
  Result = erlang:apply(Fun,[Param,WorkData]),
  Result.

%% ================ call fun ===================================
add_count(Param,WorkData)->
  Count = yypb_tpl_pb_worker_data:get_tick(WorkData),
  Count+Param.




