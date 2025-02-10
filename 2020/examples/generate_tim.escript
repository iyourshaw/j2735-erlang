#!/usr/bin/env escript

main([Filename]) ->

    % Set code location (but doesn't work)
    true = code:add_patha("../erl"),

    % Generate a random TIM
    {ok, Tim} = asn1ct:value('TravelerInformation', 'TravelerInformation'),

    % Put it in a MessageFrame
    TimMessageFrame = {'MessageFrame',31,Tim},

    % Save to a file
    file:write_file(Filename, io_lib:format("~p.~n", [TimMessageFrame])).


