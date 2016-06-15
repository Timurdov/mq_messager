-module(mq_messager_app).


-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    apputils:ensure_started(mq),
    mq_messager_sup:start_link().

stop(_State) ->
    ok.
