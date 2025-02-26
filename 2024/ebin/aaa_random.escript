#!/usr/bin/env escript

main([MessageType, FilePath]) ->
    Message = random_message(list_to_atom(MessageType)),
    erlang:display(Message),
    file:write_file(FilePath ++ ".src", io_lib:format("~p.~n", [Message])),
    Uper = get_uper(bsm, Message),
    file:write_file(FilePath ++ ".bin", Uper),
    Hex = binary:encode_hex(Uper),
    file:write_file(FilePath ++ ".hex", Hex);
main([MessageType]) ->
    Message = random_message(list_to_atom(MessageType)),
    erlang:display(Message);
main(_) ->
    usage().

usage() ->
    io:format("usage: ./aaa_random.escript bsm 'filepath'\n"),
    halt(1).

random_message(bsm) ->
    %Part2id = rand:uniform(3) - 1,
    % Part2id = 2,
    {ok, Bsm} = asn1ct:value('BasicSafetyMessage', 'BasicSafetyMessage'),
    
    % One Part II
    % Part2value = create_part2(Part2id),
    % Part2 = [{'PartIIcontent', Part2id, Part2value}],

    % Several Part IIs
    Part2value_0 = create_part2(0),
    Part2value_1 = create_part2(1),
    Part2value_2 = create_part2(2),
    Part2 = [{'PartIIcontent', 0, Part2value_0},
            {'PartIIcontent', 1, Part2value_1},
            {'PartIIcontent', 2, Part2value_2}],

    % Uncomment for no Part II
    % Part2 = asn1_NOVALUE,

    BsmWithPart2 = setelement(3, Bsm, Part2),
    BsmFixed = strip_regional(bsm, BsmWithPart2),
    BsmFixed;
random_message(_) ->
    io:format("Unknown message type").


create_part2(0) ->
    {ok, VSE} = asn1ct:value('Common', 'VehicleSafetyExtensions'),
    VSE;
create_part2(1) ->
    {ok, SVE} = asn1ct:value('BasicSafetyMessage', 'SpecialVehicleExtensions'),
    strip_regional('SpecialVehicleExtensions', SVE);
create_part2(2) ->
    {ok, SVE} = asn1ct:value('BasicSafetyMessage', 'SupplementalVehicleExtensions'),
    strip_regional('SupplementalVehicleExtensions', SVE).


strip_regional(bsm, Bsm) ->
    setelement(4, Bsm, asn1_NOVALUE);
strip_regional('SupplementalVehicleExtensions', SVE) ->
    SVE1 = setelement(11, SVE, asn1_NOVALUE),
    VC = element(3, SVE),
    VCStripped = strip_regional('VehicleClassification', VC),
    SVE2 = setelement(3, SVE1, VCStripped),
    SVE2;
strip_regional('SpecialVehicleExtensions', SVE) ->
    ED = element(3, SVE),
    EDStripped = strip_regional('EventDescription', ED),
    setelement(3, SVE, EDStripped);
strip_regional('VehicleClassification', VC) when is_tuple(VC) ->
    setelement(10, VC, asn1_NOVALUE);
strip_regional('EventDescription', ED) when is_tuple(ED) ->
    setelement(7, ED, asn1_NOVALUE).



get_uper(bsm, Bsm) ->
    {ok, Uper} = 'BasicSafetyMessage':encode('BasicSafetyMessage', Bsm),
    Uper;
get_uper(_, _) ->
    io:format("get_uper: Unknown message type").


% get_jer(bsm, Bsm) ->
%     {ok, Jer} = 'BasicSafetyMessage':jer_encode('BasicSafetyMessage', Bsm),
%     Jer;
% get_jer(_, _) ->
%     io:format("get_jer: Unknown message type").