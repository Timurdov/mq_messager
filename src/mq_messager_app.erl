-module(mq_messager_app).


-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    logger:start(),
    apputils:ensure_started(crypto),
    apputils:ensure_started(inets),
    apputils:ensure_started(ranch),
    apputils:ensure_started(cowlib),
    apputils:ensure_started(cowboy),
    apputils:ensure_started(mq),
    mq_messager_sup:start_link().

stop(_State) ->
    ok.
