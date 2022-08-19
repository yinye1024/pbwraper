%%%-------------------------------------------------------------------
%%% @author yinye
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. 四月 2021 19:45
%%%-------------------------------------------------------------------
-module(gs_yypb_pb_worker_mgr).
-author("yinye").

-include_lib("yyutils/include/yyu_comm.hrl").


%% API functions defined
-export([ensure_sup_started/0,new_worker/1,call_fun/2]).

%% ===================================================================================
%% API functions implements
%% ===================================================================================
ensure_sup_started()->
  yypb_pb_worker_sup:ensure_sup_started(),
  ?OK.

new_worker(WorkAgent)->
  {?OK,Pid} = yypb_pb_worker_sup:new_child(WorkAgent),
  Pid.

call_fun(WorkerPid,{WorkFun,Param})->
  Result = yypb_pb_worker_gen:call_fun(WorkerPid,{WorkFun,Param}),
  Result.




