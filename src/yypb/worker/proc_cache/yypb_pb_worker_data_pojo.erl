%%%-------------------------------------------------------------------
%%% @author yinye
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. 四月 2021 19:45
%%%-------------------------------------------------------------------
-module(yypb_pb_worker_data_pojo).
-author("yinye").

-include_lib("yyutils/include/yyu_comm.hrl").

%% API functions defined
-export([new_pojo/2,get_id/1, get_work_agent/1, set_work_agent/2]).

%% ===================================================================================
%% API functions implements
%% ===================================================================================
new_pojo(DataId, WorkData)->
  #{
    id => DataId,
    work_agent => WorkData
  }.

get_id(ItemMap) ->
  yyu_map:get_value(id, ItemMap).

get_work_agent(ItemMap) ->
  yyu_map:get_value(work_agent, ItemMap).

set_work_agent(Value, ItemMap) ->
  yyu_map:put_value(work_agent, Value, ItemMap).

