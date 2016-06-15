-module(mq_messager_sup).


-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).


%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    Acc = {mq_messager_first_gs,
           {mq_messager_first_gs, start_link, []},
           permanent, 5000, worker, [mq_messager_first_gs]},
    Acc1 = {mq_messager_second_gs,
        {mq_messager_second_gs, start_link, []},
        permanent, 5000, worker, [mq_messager_second_gs]},
    {ok, { {one_for_one, 5, 10}, [Acc, Acc1]}}.



