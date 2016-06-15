-module(mq_messager).


-export([
        start/0,
        stop/0,
        get_env/2,
        get_env/1]).

%% internal

%%--------------------------------------------------------------------
%% @doc start application
%%--------------------------------------------------------------------

start() ->
    ok =  application:start(mq_messager).

%%--------------------------------------------------------------------
%% @doc stop ds application
%%--------------------------------------------------------------------

stop() ->
    application:stop(mq_messager).

%%%===================================================================
%%% Internal functions
%%%===================================================================

%% @spec get_env(Opt) -> Val | undefined
%% @doc  Retrun application env value by Key (Opt)
get_env(Opt) when is_atom(Opt) ->
    get_env(Opt, undefined).

get_env(Opt, Default) ->
    case application:get_env(?MODULE, Opt) of
    {ok, Val} -> Val;
            _ -> Default
    end.

