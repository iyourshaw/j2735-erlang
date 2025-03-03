#!/usr/bin/env escript

main([MessageType, FilePath]) ->
    Message = random_message(list_to_atom(MessageType)),
    erlang:display(Message),
    file:write_file(FilePath ++ ".src", io_lib:format("~p.~n", [Message])),
    Uper = get_uper(list_to_atom(MessageType), Message),
    erlang:display(Uper),
    file:write_file(FilePath ++ ".bin", Uper),
    Hex = binary:encode_hex(Uper),
    file:write_file(FilePath ++ ".hex", Hex),
    erlang:display(Hex);
main([MessageType]) ->
    Message = random_message(list_to_atom(MessageType)),
    erlang:display(Message);
main(_) ->
    usage().


usage() ->
    io:format("usage:\n from bash shell:\n\n./random_bsm.escript map 'filepath'\n\n"),
    halt(1).

    
random_message('MapData') ->
    {ok, Map} = asn1ct:value('MapData', 'MapData'),
    Map1 = strip_regional(map, Map),
    Map2 = setelement(6, Map1, fix('IntersectionGeometryList', element(6, Map1))),
    Map3 = strip_roadSegments(Map2),
    Map4 = strip_dataParameters(Map3),
    Map5 = strip_restrictionList(Map4),
    Map5;
random_message('IntersectionGeometryList') ->
    {ok, IGL} = asn1ct:value('MapData', 'IntersectionGeometryList'),
    fix('IntersectionGeometryList', IGL);
random_message('IntersectionGeometry') ->
    {ok, IG} = asn1ct:value('MapData', 'IntersectionGeometry'),
    IG1 = fix('IntersectionGeometry', IG),
    IG1;
random_message('LaneList') ->
    {ok, LL} = asn1ct:value('MapData', 'LaneList'),
    fix('LaneList', LL);
random_message('GenericLane') ->
    {ok, L} = asn1ct:value('MapData', 'GenericLane'),
    fix('GenericLane', L);
random_message('ComputedLane') ->
    {ok, CL} = asn1ct:value('Common', 'ComputedLane'),
    fix('ComputedLane', CL);
random_message('NodeListXY') ->
    {ok, NL} = asn1ct:value('Common', 'NodeListXY'),
    fix('NodeListXY', NL);
random_message('NodeSetXY') ->
    {ok, NS} = asn1ct:value('Common', 'NodeSetXY'),
    fix('NodeSetXY', NS);
    % NS = [],
    % ensure_2_nodes(NS);
random_message('ConnectsToList') ->
    {ok, CL} = asn1ct:value('MapData', 'ConnectsToList'),
    CL;
random_message('Connection') ->
    {ok, C} = asn1ct:value('MapData', 'Connection'),
    C;
random_message('NodeXY') ->
    {ok, N} = asn1ct:value('Common', 'NodeXY'),
    N;
random_message(_) ->
    io:format("Unknown message type").

strip_regional(map, Map) ->
    setelement(10, Map, asn1_NOVALUE);
strip_regional('IntersectionGeometry', IG) ->
    setelement(10, IG, asn1_NOVALUE);
strip_regional('Position3D', P) ->
    setelement(5, P, asn1_NOVALUE);
strip_regional('GenericLane', L) ->
    setelement(11, L, asn1_NOVALUE);
strip_regional('LaneAttributes', L) ->
    setelement(5, L, asn1_NOVALUE);
strip_regional('ComputedLane', CL) ->
    setelement(8, CL, asn1_NOVALUE);
strip_regional('NodeSetXY', NS) ->
    [N || N <- NS, element(1, element(2, N)) =/= regional];
strip_regional(_, _) ->
    io:format("get_uper: Unknown message type").

% fix/2
fix('LaneList', LL) ->
    [fix('GenericLane', L) || L <- LL];
fix('GenericLane', L) ->
    % Strip regional
    L0 = strip_regional('GenericLane', L),
    % Fix laneAttriutes
    L1 = setelement(6, L0, fix('LaneAttributes', element(6, L0))),
    % Fix nodeList
    L2 = setelement(8, L1, fix('NodeListXY', element(8, L1))),
    L2;
fix('LaneAttributes', L) ->
    strip_regional('LaneAttributes', L);
fix('IntersectionGeometryList', IGL) ->
    [fix('IntersectionGeometry', I) || I <- IGL];
fix('IntersectionGeometry',IG) ->
    % Remove regional
    IG1 = strip_regional('IntersectionGeometry', IG),
    % Fix Position3D
    P = element(5, IG1),
    PFixed = strip_regional('Position3D', P),
    IG2 = setelement(5, IG1, PFixed),
    % Remove speedLimits
    IG3 = setelement(7, IG2, asn1_NOVALUE),
    % Fix laneSet
    Lanes = element(8, IG3),
    FixedLanes = fix('LaneList', Lanes),
    IG4 = setelement(8, IG3, FixedLanes),
    % Remove preemptPriorityData/SignalControlZone -- only includes regional
    setelement(9, IG4, asn1_NOVALUE);
fix('ComputedLane', CL) ->
    strip_regional('ComputedLane', CL);
fix('NodeListXY', NL) ->
    fix('NodeListXY', element(1, NL), NL);
fix('NodeSetXY', NS) ->
    % Strip attributes
    % NS2 = [setelement(3, NS1, asn1_NOVALUE) || NS1 <- NS],
    NS2 = strip_attributes('NodeSetXY', NS),
    % Remove regional nodes
    % NS3 = [N || N <- NS2, element(1, element(2, N)) =/= regional],
    NS3 = strip_regional('NodeSetXY', NS2),
    % At leaset 2 nodes are required.  Add nodes if less.
    NS4 = ensure_2_nodes(NS3),
    NS4.

strip_attributes('NodeSetXY', NS) ->
    [setelement(3, NS1, asn1_NOVALUE) || NS1 <- NS].

ensure_2_nodes(NS) when length(NS) < 2 ->
    AddNode = [ random_message('NodeXY') | NS],
    Stripped = strip_attributes('NodeSetXY', strip_regional('NodeSetXY', AddNode)),
    ensure_2_nodes(Stripped);
ensure_2_nodes(NS) when length(NS) >= 2 ->
    NS.


% fix/3
fix('NodeListXY', nodes, NL) ->
    setelement(2, NL, fix('NodeSetXY', element(2, NL)));
fix('NodeListXY', computed, NL) ->
    setelement(2, NL, fix('ComputedLane', element(2, NL))).


% strip_intersections(Map) ->
%     setelement(6, Map, asn1_NOVALUE).

strip_roadSegments(Map) ->
    setelement(7, Map, asn1_NOVALUE).

strip_dataParameters(Map) ->
    setelement(8, Map, asn1_NOVALUE).

strip_restrictionList(Map) ->
    setelement(9, Map, asn1_NOVALUE).


get_uper('MapData', Map) ->
    {ok, Uper} = 'MapData':encode('MapData', Map),
    Uper;
get_uper('NodeSetXY', N) ->
    {ok, Uper} = 'Common':encode('NodeSetXY', N),
    Uper;
get_uper(_, _) ->
    io:format("get_uper: Unknown message type").


