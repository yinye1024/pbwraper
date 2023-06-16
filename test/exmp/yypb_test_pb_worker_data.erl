%%%-------------------------------------------------------------------
%%% @author yinye
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. 四月 2021 19:45
%%%-------------------------------------------------------------------
-module(yypb_test_pb_worker_data).
-author("yinye").

-include_lib("yyutils/include/yyu_comm.hrl").


%% API functions defined
-export([new_pojo/0]).
-export([get_count/1,set_count/2]).
-export([get_tick/1,set_tick/2]).
%% ===================================================================================
%% API functions implements
%% ===================================================================================

%% =======================  WorkMod 相关方法 ============================================================
new_pojo()->
  #{
    count => 0,
    tick => 0
  }.


get_count(ItemMap) ->
  yyu_map:get_value(count, ItemMap).

set_count(Value, ItemMap) ->
  yyu_map:put_value(count, Value, ItemMap).


get_tick(ItemMap) ->
  yyu_map:get_value(tick, ItemMap).

set_tick(Value, ItemMap) ->
  yyu_map:put_value(tick, Value, ItemMap).


