%%%-------------------------------------------------------------------
%%% @author yinye
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. 四月 2021 19:45
%%%-------------------------------------------------------------------
-module(yypb_poolboy_api).
-author("yinye").

-include_lib("yyutils/include/yyu_comm.hrl").


%% API functions defined
-export([ensure_sup_started/0,new_pool/3,stop_pool/1,do_work/2]).

%% ===================================================================================
%% API functions implements
%% ===================================================================================
ensure_sup_started()->
  ?OK = yypb_poolboy_sup:ensure_sup_started(),
  ?OK = gs_yypb_pb_worker_mgr:ensure_sup_started(),
  ?OK.

new_pool(PoolId,PoolSize,WorkerAgent)->
  {?OK,PbPid} = yypb_poolboy_sup:start_pool(PoolId,PoolSize,WorkerAgent),
  PbPid.

stop_pool(PbPid) when is_pid(PbPid) ->
  yypb_poolboy_sup:stop_pool(PbPid),
  ?OK.

do_work(PoolId,{WorkFun,Param})->
  poolboy:transaction(PoolId,
    fun(WorkerPid)->
      gs_yypb_pb_worker_mgr:call_fun(WorkerPid,{WorkFun,Param})
    end).

