%%%-------------------------------------------------------------------
%%% @author yinye
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. 四月 2021 19:45
%%%-------------------------------------------------------------------
-module(yypb_pb_worker_data_mgr).
-author("yinye").

-include_lib("yyutils/include/yyu_comm.hrl").


%% API functions defined
-export([init/1, get_work_agent/0, put_work_agent/1]).

%% ===================================================================================
%% API functions implements
%% ===================================================================================
init(WorkAgent)->
  yypb_pb_worker_data_dao:init(WorkAgent),
  ?OK.

get_work_agent()->
  Data = yypb_pb_worker_data_dao:get_data(),
  WorkData = yypb_pb_worker_data_pojo:get_work_agent(Data),
  WorkData.

put_work_agent(WorkData)->
  Data = yypb_pb_worker_data_dao:get_data(),
  NewData = yypb_pb_worker_data_pojo:set_work_agent(WorkData,Data),
  yypb_pb_worker_data_dao:put_data(NewData),
  ?OK.

