%%%-------------------------------------------------------------------
%%% @author yinye
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 六月 2021 19:07
%%%-------------------------------------------------------------------
-module(yypb_test).
-author("yinye").
-include_lib("yyutils/include/yyu_comm.hrl").
-include_lib("eunit/include/eunit.hrl").
-define(PoolId,test).

%% ===================================================================================
%% API functions implements
%% ===================================================================================
pb_test_() ->
  ?LOG_INFO({"client test ==================="}),

  {foreach,
  fun start/0,
  fun stop/1,
  [
    fun add_count/1]
  }.


start() ->
  ?LOG_INFO({"test start"}),
  yypb_exmp_poolboy_mgr:init(),
  PbPid = yypb_exmp_poolboy_mgr:new_pool(?PoolId,10),
  {PbPid}.

stop({PbPid}) ->
  ?LOG_INFO({"test end"}),
  yypb_exmp_poolboy_mgr:stop_pool(PbPid),
  ?OK.



add_count({_PbPid})->
  yypb_exmp_poolboy_mgr:add_count(?PoolId,2),
  [
    ?_assert(true)
  ].


