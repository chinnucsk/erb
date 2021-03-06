%% -------------------------------------------------------------------
%% @author Will Boyce <mail@willboyce.com> [http://willboyce.com]
%% @copyright 2008 Will Boyce
%% @doc Erb Application
%% -------------------------------------------------------------------
-module(erb_application).
-author("Will Boyce").
-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================
%% -------------------------------------------------------------------
%% @spec start(Type, StartArgs) -> {ok, Pid} |
%%                          {ok, Pid, State} |
%%                          {error, Reason}
%% @doc This function is called whenever an application
%% is started using application:start/1,2, and should start the processes
%% of the application. If the application is structured according to the
%% OTP design principles as a supervision tree, this means starting the
%% top supervisor of the tree.
%% -------------------------------------------------------------------
start(_Type, _StartArgs) ->
    case erb_supervisor:start_link() of
        {ok, Pid} ->
            {ok, Pid};
        Error ->
            Error
    end.

%% -------------------------------------------------------------------
%% @spec stop(State) -> void()
%% @doc This function is called whenever an application
%% has stopped. It is intended to be the opposite of Module:start/2 and
%% should do any necessary cleaning up. The return value is ignored.
%% -------------------------------------------------------------------
stop(_State) ->
    exit(whereis(erb_supervisor), shutdown).

%% ===================================================================
%% Internal functions
%% ===================================================================
