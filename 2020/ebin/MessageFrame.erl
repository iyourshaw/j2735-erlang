%% Generated by the Erlang ASN.1 PER (unaligned) compiler. Version: 5.3.1
%% Purpose: Encoding and decoding of the types in MessageFrame.

-module('MessageFrame').
-moduledoc false.
-compile(nowarn_unused_vars).
-dialyzer(no_improper_lists).
-dialyzer(no_match).
-include("MessageFrame.hrl").
-asn1_info([{vsn,'5.3.1'},
            {module,'MessageFrame'},
            {options,[{i,"./ebin"},uper,jer,verbose,{i,"./asn"},{outdir,"./ebin"},{i,"."}]}]).

-export([encoding_rule/0,maps/0,bit_string_format/0,
         legacy_erlang_types/0]).
-export(['dialyzer-suppressions'/1]).
-export([typeinfo/1]).
-export([
enc_MessageFrame/1,
enc_DSRCmsgID/1
]).

-export([
dec_MessageFrame/1,
dec_DSRCmsgID/1
]).

-export([
mapData/0,
signalPhaseAndTimingMessage/0,
basicSafetyMessage/0,
commonSafetyRequest/0,
emergencyVehicleAlert/0,
intersectionCollision/0,
nmeaCorrections/0,
probeDataManagement/0,
probeVehicleData/0,
roadSideAlert/0,
rtcmCorrections/0,
signalRequestMessage/0,
signalStatusMessage/0,
travelerInformation/0,
personalSafetyMessage/0,
testMessage00/0,
testMessage01/0,
testMessage02/0,
testMessage03/0,
testMessage04/0,
testMessage05/0,
testMessage06/0,
testMessage07/0,
testMessage08/0,
testMessage09/0,
testMessage10/0,
testMessage11/0,
testMessage12/0,
testMessage13/0,
testMessage14/0,
testMessage15/0
]).

-export([info/0]).

-export([encode/2,decode/2]).
-export([jer_encode/2,jer_decode/2]).

encoding_rule() -> uper.

maps() -> false.

bit_string_format() -> bitstring.

legacy_erlang_types() -> false.

encode(Type, Data) ->
try complete(encode_disp(Type, Data)) of
  Bytes ->
    {ok,Bytes}
  catch
    Class:Exception:Stk when Class =:= error; Class =:= exit ->
      case Exception of
        {error,{asn1,Reason}} ->
          {error,{asn1,{Reason,Stk}}};
        Reason ->
         {error,{asn1,{Reason,Stk}}}
      end
end.


jer_encode(Type, Data) ->
try encode_jer('MessageFrame', Type, Data) of
  Bytes ->
    {ok,Bytes}
  catch
    Class:Exception:Stk when Class =:= error; Class =:= exit ->
      case Exception of
        {error,{asn1,Reason}} ->
          {error,{asn1,{Reason,Stk}}};
        Reason ->
         {error,{asn1,{Reason,Stk}}}
      end
end.


decode(Type, Data) ->
try
   {Result,_Rest} = decode_disp(Type, Data),
   {ok,Result}
  catch
    Class:Exception:Stk when Class =:= error; Class =:= exit ->
      case Exception of
        {error,{asn1,Reason}} ->
          {error,{asn1,{Reason,Stk}}};
        Reason ->
         {error,{asn1,{Reason,Stk}}}
      end
end.

jer_decode(Type, Data) ->
try
   Result = decode_jer('MessageFrame', Type, json:decode(Data)),
   {ok,Result}
  catch
    Class:Exception:Stk when Class =:= error; Class =:= exit ->
      case Exception of
        {error,{asn1,Reason}} ->
          {error,{asn1,{Reason,Stk}}};
        Reason ->
         {error,{asn1,{Reason,Stk}}}
      end
end.

encode_disp('MessageFrame', Data) -> enc_MessageFrame(Data);
encode_disp('DSRCmsgID', Data) -> enc_DSRCmsgID(Data);
encode_disp(Type, _Data) -> exit({error,{asn1,{undefined_type,Type}}}).

decode_disp('MessageFrame', Data) -> dec_MessageFrame(Data);
decode_disp('DSRCmsgID', Data) -> dec_DSRCmsgID(Data);
decode_disp(Type, _Data) -> exit({error,{asn1,{undefined_type,Type}}}).

info() ->
   case ?MODULE:module_info(attributes) of
     Attributes when is_list(Attributes) ->
       case lists:keyfind(asn1_info, 1, Attributes) of
         {_,Info} when is_list(Info) ->
           Info;
         _ ->
           []
       end;
     _ ->
       []
   end.
enc_MessageFrame(Val) ->
Enc1@element = element(2, Val),
[begin
%% attribute messageId(1) with type INTEGER
Enc3@element = Enc1@element,
if Enc3@element bsr 15 =:= 0 ->
<<0:1,Enc3@element:15>>;
true ->
exit({error,{asn1,{illegal_integer,Enc3@element}}})
end
end|begin
%% attribute value(2) with type Type
Enc5@element = element(3, Val),
Enc6@output = enc_os_Type1(Enc5@element, Enc1@element),
Enc6@bin = complete(Enc6@output),
Enc6@len = byte_size(Enc6@bin),
if Enc6@len < 128 ->
[Enc6@len|Enc6@bin];
Enc6@len < 16384 ->
[<<2:2,Enc6@len:14>>|Enc6@bin];
true ->
encode_fragmented(Enc6@bin, 8)
end
end].


dec_MessageFrame(Bytes) ->
{Ext,Bytes1} = begin
<<V1@V0:1,V1@Buf1/bitstring>> = Bytes,
{V1@V0,V1@Buf1}
end,

%% attribute messageId(1) with type INTEGER
{Term1,Bytes2} = begin
<<V2@V0:15,V2@Buf1/bitstring>> = Bytes1,
{V2@V0,V2@Buf1}
end,

%% attribute value(2) with type Type
{Tmpterm1, Bytes3} = begin
{V3@V0,V3@Buf1} = case Bytes2 of
<<0:1,V3@V3:7,V3@V5:V3@V3/binary-unit:8,V3@Buf6/bitstring>> ->
{V3@V5,V3@Buf6};
<<1:1,0:1,V3@V4:14,V3@V6:V3@V4/binary-unit:8,V3@Buf7/bitstring>> ->
{V3@V6,V3@Buf7};
<<1:1,1:1,V3@V4:6,V3@Buf5/bitstring>> ->
{V3@V6,V3@Buf7}  = decode_fragmented(V3@V4, V3@Buf5, 8),
{V3@V6,V3@Buf7}
end,
{V3@V0,V3@Buf1}
end,

%% Extensions
{Extensions,Bytes4} = case Ext of
0 -> {<<>>,Bytes3};
1 ->
{V4@V0,V4@Buf1} = case Bytes3 of
<<0:1,V4@V3:6,V4@Buf4/bitstring>> ->
V4@Add5 = V4@V3 + 1,
{V4@Add5,V4@Buf4};
<<1:1,V4@Buf2/bitstring>> ->
{V4@V3,V4@Buf4} = case V4@Buf2 of
<<0:1,V4@V6:7,V4@Buf7/bitstring>> when V4@V6 =/= 0 ->
{V4@V6,V4@Buf7};
<<1:1,0:1,V4@V7:14,V4@Buf8/bitstring>> when V4@V7 =/= 0 ->
{V4@V7,V4@Buf8};
<<1:1,1:1,V4@V7:6,V4@Buf8/bitstring>> when V4@V7 =/= 0 ->
V4@Mul9 = V4@V7 * 16384,
{V4@Mul9,V4@Buf8}
end,
{V4@V3,V4@Buf4}
end,
<<V4@V10:V4@V0/bitstring-unit:1,V4@Buf11/bitstring>> = V4@Buf1,
{V4@V10,V4@Buf11}
end,
Bytes5= skipextensions(Bytes4, 1, Extensions),
Term2 = dec_os_Type2(Tmpterm1, Term1),
Res1 = {'MessageFrame',Term1,Term2},
{Res1,Bytes5}.

enc_DSRCmsgID(Val) ->
if Val bsr 15 =:= 0 ->
<<Val:15>>;
true ->
exit({error,{asn1,{illegal_integer,Val}}})
end.


dec_DSRCmsgID(Bytes) ->
begin
<<V1@V0:15,V1@Buf1/bitstring>> = Bytes,
{V1@V0,V1@Buf1}
end.

mapData() ->
18.

signalPhaseAndTimingMessage() ->
19.

basicSafetyMessage() ->
20.

commonSafetyRequest() ->
21.

emergencyVehicleAlert() ->
22.

intersectionCollision() ->
23.

nmeaCorrections() ->
24.

probeDataManagement() ->
25.

probeVehicleData() ->
26.

roadSideAlert() ->
27.

rtcmCorrections() ->
28.

signalRequestMessage() ->
29.

signalStatusMessage() ->
30.

travelerInformation() ->
31.

personalSafetyMessage() ->
32.

testMessage00() ->
240.

testMessage01() ->
241.

testMessage02() ->
242.

testMessage03() ->
243.

testMessage04() ->
244.

testMessage05() ->
245.

testMessage06() ->
246.

testMessage07() ->
247.

testMessage08() ->
248.

testMessage09() ->
249.

testMessage10() ->
250.

testMessage11() ->
251.

testMessage12() ->
252.

testMessage13() ->
253.

testMessage14() ->
254.

testMessage15() ->
255.

typeinfo('MessageFrame') ->
  {sequence,'MessageFrame',2,[{<<109,101,115,115,97,103,101,73,100>>,{'INTEGER',{0,32767}},mandatory},{<<118,97,108,117,101>>,{'ObjClassFieldType',{messageId,1},{componentrelation,{objectset,219,{'Externaltypereference',219,'MessageFrame','MessageTypes'}},[{innermost,[{'Externalvaluereference',219,'MessageFrame',messageId}]}]}},mandatory}]};
typeinfo('DSRCmsgID') ->
  {'INTEGER',{0,32767}};
typeinfo(Type) ->
  exit({error,{asn1,{undefined_type,Type}}}).


%%%
%%% Run-time functions.
%%%

'dialyzer-suppressions'(Arg) ->
    complete(element(1, Arg)),
    ok.

dec_os_Type2(Bytes, Id) when Id =:= 18 ->
{Term,_} = 'MapData':dec_MapData(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 19 ->
{Term,_} = 'SPAT':dec_SPAT(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 20 ->
{Term,_} = 'BasicSafetyMessage':dec_BasicSafetyMessage(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 21 ->
{Term,_} = 'CommonSafetyRequest':dec_CommonSafetyRequest(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 22 ->
{Term,_} = 'EmergencyVehicleAlert':dec_EmergencyVehicleAlert(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 23 ->
{Term,_} = 'IntersectionCollision':dec_IntersectionCollision(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 24 ->
{Term,_} = 'NMEAcorrections':dec_NMEAcorrections(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 25 ->
{Term,_} = 'ProbeDataManagement':dec_ProbeDataManagement(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 26 ->
{Term,_} = 'ProbeVehicleData':dec_ProbeVehicleData(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 27 ->
{Term,_} = 'RoadSideAlert':dec_RoadSideAlert(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 28 ->
{Term,_} = 'RTCMcorrections':dec_RTCMcorrections(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 29 ->
{Term,_} = 'SignalRequestMessage':dec_SignalRequestMessage(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 30 ->
{Term,_} = 'SignalStatusMessage':dec_SignalStatusMessage(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 31 ->
{Term,_} = 'TravelerInformation':dec_TravelerInformation(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 32 ->
{Term,_} = 'PersonalSafetyMessage':dec_PersonalSafetyMessage(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 240 ->
{Term,_} = 'TestMessage00':dec_TestMessage00(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 241 ->
{Term,_} = 'TestMessage01':dec_TestMessage01(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 242 ->
{Term,_} = 'TestMessage02':dec_TestMessage02(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 243 ->
{Term,_} = 'TestMessage03':dec_TestMessage03(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 244 ->
{Term,_} = 'TestMessage04':dec_TestMessage04(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 245 ->
{Term,_} = 'TestMessage05':dec_TestMessage05(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 246 ->
{Term,_} = 'TestMessage06':dec_TestMessage06(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 247 ->
{Term,_} = 'TestMessage07':dec_TestMessage07(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 248 ->
{Term,_} = 'TestMessage08':dec_TestMessage08(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 249 ->
{Term,_} = 'TestMessage09':dec_TestMessage09(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 250 ->
{Term,_} = 'TestMessage10':dec_TestMessage10(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 251 ->
{Term,_} = 'TestMessage11':dec_TestMessage11(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 252 ->
{Term,_} = 'TestMessage12':dec_TestMessage12(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 253 ->
{Term,_} = 'TestMessage13':dec_TestMessage13(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 254 ->
{Term,_} = 'TestMessage14':dec_TestMessage14(Bytes),
Term;
dec_os_Type2(Bytes, Id) when Id =:= 255 ->
{Term,_} = 'TestMessage15':dec_TestMessage15(Bytes),
Term;
dec_os_Type2(Bytes, Id) ->
{asn1_OPENTYPE,Bytes}.


enc_os_Type1(Val, Id) ->
if Id =:= 18 ->
'MapData':enc_MapData(Val);
Id =:= 19 ->
'SPAT':enc_SPAT(Val);
Id =:= 20 ->
'BasicSafetyMessage':enc_BasicSafetyMessage(Val);
Id =:= 21 ->
'CommonSafetyRequest':enc_CommonSafetyRequest(Val);
Id =:= 22 ->
'EmergencyVehicleAlert':enc_EmergencyVehicleAlert(Val);
Id =:= 23 ->
'IntersectionCollision':enc_IntersectionCollision(Val);
Id =:= 24 ->
'NMEAcorrections':enc_NMEAcorrections(Val);
Id =:= 25 ->
'ProbeDataManagement':enc_ProbeDataManagement(Val);
Id =:= 26 ->
'ProbeVehicleData':enc_ProbeVehicleData(Val);
Id =:= 27 ->
'RoadSideAlert':enc_RoadSideAlert(Val);
Id =:= 28 ->
'RTCMcorrections':enc_RTCMcorrections(Val);
Id =:= 29 ->
'SignalRequestMessage':enc_SignalRequestMessage(Val);
Id =:= 30 ->
'SignalStatusMessage':enc_SignalStatusMessage(Val);
Id =:= 31 ->
'TravelerInformation':enc_TravelerInformation(Val);
Id =:= 32 ->
'PersonalSafetyMessage':enc_PersonalSafetyMessage(Val);
Id =:= 240 ->
'TestMessage00':enc_TestMessage00(Val);
Id =:= 241 ->
'TestMessage01':enc_TestMessage01(Val);
Id =:= 242 ->
'TestMessage02':enc_TestMessage02(Val);
Id =:= 243 ->
'TestMessage03':enc_TestMessage03(Val);
Id =:= 244 ->
'TestMessage04':enc_TestMessage04(Val);
Id =:= 245 ->
'TestMessage05':enc_TestMessage05(Val);
Id =:= 246 ->
'TestMessage06':enc_TestMessage06(Val);
Id =:= 247 ->
'TestMessage07':enc_TestMessage07(Val);
Id =:= 248 ->
'TestMessage08':enc_TestMessage08(Val);
Id =:= 249 ->
'TestMessage09':enc_TestMessage09(Val);
Id =:= 250 ->
'TestMessage10':enc_TestMessage10(Val);
Id =:= 251 ->
'TestMessage11':enc_TestMessage11(Val);
Id =:= 252 ->
'TestMessage12':enc_TestMessage12(Val);
Id =:= 253 ->
'TestMessage13':enc_TestMessage13(Val);
Id =:= 254 ->
'TestMessage14':enc_TestMessage14(Val);
Id =:= 255 ->
'TestMessage15':enc_TestMessage15(Val);
true ->
open_type_to_binary(Val)
end.

bitstring2json(BitStr) when is_binary(BitStr) ->
    octetstring2json(binary_to_list(BitStr));
bitstring2json(BitStr) ->
    Pad = 8 - bit_size(BitStr) rem 8,
    NewStr = <<BitStr/bitstring,0:Pad>>,
    octetstring2json(binary_to_list(NewStr)).

complete(InList) when is_list(InList) ->
    case list_to_bitstring(InList) of
        <<>> ->
            <<0>>;
        Res ->
            Sz = bit_size(Res),
            case Sz band 7 of
                0 ->
                    Res;
                Bits ->
                    <<Res:Sz/bitstring,0:(8 - Bits)>>
            end
    end;
complete(Bin) when is_binary(Bin) ->
    case Bin of
        <<>> ->
            <<0>>;
        _ ->
            Bin
    end;
complete(InList) when is_bitstring(InList) ->
    Sz = bit_size(InList),
    PadLen = 8 - Sz band 7,
    <<InList:Sz/bitstring,0:PadLen>>.

decode_fragmented(SegSz0, Buf0, Unit) ->
    SegSz = SegSz0 * Unit * 16384,
    <<Res:SegSz/bitstring,Buf/bitstring>> = Buf0,
    decode_fragmented_1(Buf, Unit, Res).

decode_fragmented_1(<<0:1,N:7,Buf0/bitstring>>, Unit, Res) ->
    Sz = N * Unit,
    <<S:Sz/bitstring,Buf/bitstring>> = Buf0,
    {<<Res/bitstring,S/bitstring>>, Buf};
decode_fragmented_1(<<1:1,0:1,N:14,Buf0/bitstring>>, Unit, Res) ->
    Sz = N * Unit,
    <<S:Sz/bitstring,Buf/bitstring>> = Buf0,
    {<<Res/bitstring,S/bitstring>>, Buf};
decode_fragmented_1(<<1:1,1:1,SegSz0:6,Buf0/bitstring>>, Unit, Res0) ->
    SegSz = SegSz0 * Unit * 16384,
    <<Frag:SegSz/bitstring,Buf/bitstring>> = Buf0,
    Res = <<Res0/bitstring,Frag/bitstring>>,
    decode_fragmented_1(Buf, Unit, Res).

decode_jer(Module, Type, Val) ->
    TypeInfo = Module:typeinfo(Type),
    decode_jer(TypeInfo, Val).

decode_jer({'ENUMERATED', _EnumList}, Val) when is_binary(Val) ->
    binary_to_existing_atom(Val, utf8);
decode_jer({'ENUMERATED', _EnumList}, Val) when is_boolean(Val) ->
    Val;
decode_jer({'ENUMERATED', _EnumList}, null) ->
    null;
decode_jer({Type = {'ENUMERATED', _EnumList}, _Constr}, Val) ->
    decode_jer(Type, Val);
decode_jer({'ENUMERATED_EXT', EnumList}, Val) ->
    decode_jer({'ENUMERATED', EnumList}, Val);
decode_jer({Type = {'ENUMERATED_EXT', _EnumList}, _Constr}, Val) ->
    decode_jer(Type, Val);
decode_jer({typeinfo, {Module, Type}}, Val) ->
    TypeInfo = Module:typeinfo(Type),
    decode_jer(TypeInfo, Val);
decode_jer({sequence, Sname, _Arity, CompInfos}, Value)
    when is_map(Value) ->
    DecodedComps = decode_jer_component(CompInfos, Value, []),
    list_to_tuple([Sname | DecodedComps]);
decode_jer({sequence_map, _Sname, _Arity, CompInfos}, Value)
    when is_map(Value) ->
    decode_jer_component_map(CompInfos, Value, []);
decode_jer(string, Str) when is_binary(Str) ->
    binary_to_list(Str);
decode_jer({string, _Prop}, Str) when is_binary(Str) ->
    binary_to_list(Str);
decode_jer('INTEGER', Int) when is_integer(Int) ->
    Int;
decode_jer({'INTEGER', {Min, Max}}, Int)
    when is_integer(Int), Max >= Int, Int >= Min ->
    Int;
decode_jer({Type = {'INTEGER_NNL', _NNList}, _}, Int) ->
    decode_jer(Type, Int);
decode_jer({'INTEGER_NNL', NNList}, Int) ->
    case lists:keyfind(Int, 2, NNList) of
        {NewName, _} ->
            NewName;
        _ ->
            Int
    end;
decode_jer('BOOLEAN', Bool) when is_boolean(Bool) ->
    Bool;
decode_jer({'BOOLEAN', _Prop}, Bool) when is_boolean(Bool) ->
    Bool;
decode_jer('NULL', null) ->
    'NULL';
decode_jer(legacy_octet_string, Str) when is_binary(Str) ->
    json2octetstring2string(binary_to_list(Str));
decode_jer(octet_string, Str) when is_binary(Str) ->
    json2octetstring2binary(binary_to_list(Str));
decode_jer({sof, Type}, Vals) when is_list(Vals) ->
    [ 
     decode_jer(Type, Val) ||
         Val <- Vals
    ];
decode_jer({choice, ChoiceTypes}, ChoiceVal) ->
    [{Alt, Val}] = maps:to_list(ChoiceVal),
    case ChoiceTypes of
        #{Alt := Type} ->
            Type = maps:get(Alt, ChoiceTypes),
            {binary_to_atom(Alt, utf8), decode_jer(Type, Val)};
        _ ->
            exit({error,
                  {asn1, {invalid_choice, Alt, maps:keys(ChoiceTypes)}}})
    end;
decode_jer(bit_string, #{<<"value">> := Str, <<"length">> := Length}) ->
    json2bitstring(binary_to_list(Str), Length);
decode_jer({bit_string, FixedLength}, Str) when is_binary(Str) ->
    json2bitstring(binary_to_list(Str), FixedLength);
decode_jer({bit_string_nnl, NNL},
           #{<<"value">> := Str, <<"length">> := Length}) ->
    BitStr = json2bitstring(binary_to_list(Str), Length),
    jer_bitstr2names(BitStr, NNL);
decode_jer({{bit_string_nnl, NNL}, FixedLength}, Str)
    when is_binary(Str) ->
    BitStr = json2bitstring(binary_to_list(Str), FixedLength),
    jer_bitstr2names(BitStr, NNL);
decode_jer({compact_bit_string_nnl, NNL}, Value) ->
    decode_jer({bit_string_nnl, NNL}, Value);
decode_jer({{compact_bit_string_nnl, NNL}, FixedLength}, Value) ->
    decode_jer({{bit_string_nnl, NNL}, FixedLength}, Value);
decode_jer(compact_bit_string,
           #{<<"value">> := Str, <<"length">> := Length}) ->
    BitStr = json2bitstring(binary_to_list(Str), Length),
    jer_bitstr2compact(BitStr);
decode_jer({compact_bit_string, FixedLength}, Str) ->
    BitStr = json2bitstring(binary_to_list(Str), FixedLength),
    Unused = (8 - FixedLength rem 8) band 7,
    {Unused, <<BitStr/bitstring,0:Unused>>};
decode_jer('OBJECT IDENTIFIER', OidBin) when is_binary(OidBin) ->
    json2oid(OidBin);
decode_jer('RELATIVE-OID', OidBin) when is_binary(OidBin) ->
    json2oid(OidBin);
decode_jer({'ObjClassFieldType', _, _}, Bin) when is_binary(Bin) ->
    Bin;
decode_jer('ASN1_OPEN_TYPE', Bin) when is_binary(Bin) ->
    Bin;
decode_jer({container, Type, _Containing}, Val) ->
    decode_jer(Type, Val);
decode_jer(Type, Val) ->
    exit({error, {asn1, {{decode, Type}, Val}}}).

decode_jer_component([{Name, Type, _OptOrDefault} | CompInfos],
                     VMap, Acc)
    when is_map_key(Name, VMap) ->
    Value = maps:get(Name, VMap),
    Dec = decode_jer(Type, Value),
    decode_jer_component(CompInfos, VMap, [Dec | Acc]);
decode_jer_component([{_Name, _Type, 'OPTIONAL'} | CompInfos],
                     VMap, Acc) ->
    decode_jer_component(CompInfos, VMap, [asn1_NOVALUE | Acc]);
decode_jer_component([{_Name, _Type, {'DEFAULT', Dvalue}} | CompInfos],
                     VMap, Acc) ->
    decode_jer_component(CompInfos, VMap, [Dvalue | Acc]);
decode_jer_component([{Name, _Type, _OptOrDefault} | _CompInfos],
                     VMap, _Acc) ->
    exit({error,
          {asn1, {{decode, {mandatory_component_missing, Name}}, VMap}}});
decode_jer_component([], _, Acc) ->
    lists:reverse(Acc).

decode_jer_component_map([{Name, AtomName, Type, _OptOrDefault} |
                          CompInfos],
                         VMap, Acc)
    when is_map_key(Name, VMap) ->
    Value = maps:get(Name, VMap),
    Dec = decode_jer(Type, Value),
    decode_jer_component_map(CompInfos, VMap, [{AtomName, Dec} | Acc]);
decode_jer_component_map([{_Name, _AtomName, _Type, 'OPTIONAL'} |
                          CompInfos],
                         VMap, Acc) ->
    decode_jer_component_map(CompInfos, VMap, Acc);
decode_jer_component_map([{_Name, AtomName, _Type, {'DEFAULT', Dvalue}} |
                          CompInfos],
                         VMap, Acc) ->
    decode_jer_component_map(CompInfos, VMap,
                             [{AtomName, Dvalue} | Acc]);
decode_jer_component_map([{Name, _AtomName, _Type, _OptOrDefault} |
                          _CompInfos],
                         VMap, _Acc) ->
    exit({error,
          {asn1, {{decode, {mandatory_component_missing, Name}}, VMap}}});
decode_jer_component_map([], _, Acc) ->
    maps:from_list(Acc).

decode_length(<<0:1,Oct:7,Rest/bitstring>>) ->
    {Oct, Rest};
decode_length(<<2:2,Val:14,Rest/bitstring>>) ->
    {Val, Rest};
decode_length(<<3:2,_:14,_Rest/bitstring>>) ->
    exit({error, {asn1, {decode_length, {nyi, above_16k}}}}).

encode_fragmented(Bin, Unit) ->
    encode_fragmented_1(Bin, Unit, 4).

encode_fragmented_1(Bin, Unit, N) ->
    SegSz = Unit * N * 16384,
    case Bin of
        <<B:SegSz/bitstring,T/bitstring>> ->
            [<<3:2,N:6>>, B | encode_fragmented_1(T, Unit, N)];
        _ when N > 1 ->
            encode_fragmented_1(Bin, Unit, N - 1);
        _ ->
            case bit_size(Bin) div Unit of
                Len when Len < 128 ->
                    [Len, Bin];
                Len when Len < 16384 ->
                    [<<2:2,Len:14>>, Bin]
            end
    end.

encode_jer(Module, Type, Val) ->
    Info = Module:typeinfo(Type),
    Enc = encode_jer(Info, Val),
    EncFun =
        fun({'KV_LIST', Value}, Encode) ->
               json:encode_key_value_list(Value, Encode);
           (Other, Encode) ->
               json:encode_value(Other, Encode)
        end,
    iolist_to_binary(json:encode(Enc, EncFun)).

encode_jer({sequence_tab, Simple, Sname, Arity, CompInfos}, Value)
    when tuple_size(Value) == Arity + 1 ->
    [Sname | Clist] = tuple_to_list(Value),
    encode_jer_component_tab(CompInfos, Clist, Simple, #{});
encode_jer({sequence_map, _Sname, _Arity, CompInfos}, Value)
    when is_map(Value) ->
    encode_jer_component_map(CompInfos, Value, []);
encode_jer({sequence, Sname, Arity, CompInfos}, Value)
    when tuple_size(Value) == Arity + 1 ->
    [Sname | Clist] = tuple_to_list(Value),
    encode_jer_component(CompInfos, Clist, []);
encode_jer(string, Str) when is_list(Str) ->
    list_to_binary(Str);
encode_jer({string, _Prop}, Str) when is_list(Str) ->
    list_to_binary(Str);
encode_jer(string, Str) when is_binary(Str) ->
    Str;
encode_jer({string, _Prop}, Str) when is_binary(Str) ->
    Str;
encode_jer('INTEGER', Int) when is_integer(Int) ->
    Int;
encode_jer({'INTEGER', {Min, Max}}, Int)
    when is_integer(Int), Max >= Int, Int >= Min ->
    Int;
encode_jer({'INTEGER_NNL', _NNL}, Int) when is_integer(Int) ->
    Int;
encode_jer(Type = {'INTEGER_NNL', NNList}, Int) when is_atom(Int) ->
    case lists:keyfind(Int, 1, NNList) of
        {_, NewVal} ->
            NewVal;
        _ ->
            exit({error, {asn1, {Type, Int}}})
    end;
encode_jer({Type = {'INTEGER_NNL', _NNList}, _Constraint}, Int)
    when is_atom(Int) ->
    encode_jer(Type, Int);
encode_jer({{'INTEGER_NNL', _NNList}, Constraint}, Int)
    when is_integer(Int) ->
    encode_jer({'INTEGER', Constraint}, Int);
encode_jer('BOOLEAN', Bool) when is_boolean(Bool) ->
    Bool;
encode_jer({'BOOLEAN', _Prop}, Bool) when is_boolean(Bool) ->
    Bool;
encode_jer('NULL', _) ->
    null;
encode_jer(legacy_octet_string, Value) when is_list(Value) ->
    bitstring2json(list_to_binary(Value));
encode_jer({legacy_octet_string, _Prop}, Value) when is_list(Value) ->
    bitstring2json(list_to_binary(Value));
encode_jer(octet_string, Value) when is_binary(Value) ->
    encode_jer({octet_string, []}, Value);
encode_jer({octet_string, _Prop}, Value) when is_binary(Value) ->
    bitstring2json(Value);
encode_jer({'ENUMERATED', EnumMap}, Val) when is_map_key(Val, EnumMap) ->
    Val;
encode_jer({Type = {'ENUMERATED', _EnumList}, _Constr}, Val) ->
    encode_jer(Type, Val);
encode_jer({'ENUMERATED_EXT', _EnumMap}, Val) when is_atom(Val) ->
    Val;
encode_jer({Type = {'ENUMERATED_EXT', _EnumList}, _Constr}, Val) ->
    encode_jer(Type, Val);
encode_jer({typeinfo, {Module, Type}}, Val) ->
    TypeInfo = Module:typeinfo(Type),
    encode_jer(TypeInfo, Val);
encode_jer({sof, Type}, Vals) when is_list(Vals) ->
    [ 
     encode_jer(Type, Val) ||
         Val <- Vals
    ];
encode_jer({choice, Choices}, {Alt, Value}) ->
    case is_map_key(AltBin = atom_to_binary(Alt, utf8), Choices) of
        true ->
            EncodedVal = encode_jer(maps:get(AltBin, Choices), Value),
            #{AltBin => EncodedVal};
        false ->
            exit({error, {asn1, {invalid_choice, Alt, Choices}}})
    end;
encode_jer(bit_string, Value) ->
    Str = bitstring2json(Value),
    #{value => Str, length => bit_size(Value)};
encode_jer({bit_string, FixedLength}, Value)
    when is_bitstring(Value), is_integer(FixedLength) ->
    Value2 = jer_padbitstr(Value, FixedLength),
    bitstring2json(Value2);
encode_jer(compact_bit_string, Compact) ->
    BitStr = jer_compact2bitstr(Compact),
    encode_jer(bit_string, BitStr);
encode_jer({compact_bit_string, FixedLength},
           Compact = {_Unused, Binary})
    when is_binary(Binary) ->
    BitStr = jer_compact2bitstr(Compact),
    encode_jer({bit_string, FixedLength}, BitStr);
encode_jer({bit_string_nnl, NNL}, Value) ->
    Value1 = jer_bit_str2bitstr(Value, NNL),
    encode_jer(bit_string, Value1);
encode_jer({{bit_string_nnl, NNL}, FixedLength}, Value) ->
    Value1 = jer_bit_str2bitstr(Value, NNL),
    encode_jer({bit_string, FixedLength}, Value1);
encode_jer({compact_bit_string_nnl, NNL}, Value) ->
    Value1 = jer_bit_str2bitstr(Value, NNL),
    encode_jer(bit_string, Value1);
encode_jer({{compact_bit_string_nnl, NNL}, FixedLength}, Value) ->
    Value1 = jer_bit_str2bitstr(Value, NNL),
    encode_jer({bit_string, FixedLength}, Value1);
encode_jer('OBJECT IDENTIFIER', Oid) when is_tuple(Oid) ->
    oid2json(Oid);
encode_jer('RELATIVE-OID', Oid) when is_tuple(Oid) ->
    oid2json(Oid);
encode_jer({'ObjClassFieldType', _, _}, Val) when is_binary(Val) ->
    Val;
encode_jer('ASN1_OPEN_TYPE', Val) when is_binary(Val) ->
    Val;
encode_jer({container, Type, _Containing}, Val) ->
    encode_jer(Type, Val);
encode_jer(Type, Val) ->
    exit({error, {asn1, {{encode, Type}, Val}}}).

encode_jer_component([{_Name, _Type, 'OPTIONAL'} | CompInfos],
                     [asn1_NOVALUE | Rest],
                     Acc) ->
    encode_jer_component(CompInfos, Rest, Acc);
encode_jer_component([{_Name, _Type, {'DEFAULT', _}} | CompInfos],
                     [asn1_DEFAULT | Rest],
                     Acc) ->
    encode_jer_component(CompInfos, Rest, Acc);
encode_jer_component([{Name, Type, _OptOrDefault} | CompInfos],
                     [Value | Rest],
                     Acc) ->
    Enc = encode_jer(Type, Value),
    encode_jer_component(CompInfos, Rest, [{Name, Enc} | Acc]);
encode_jer_component([], _, Acc) ->
    {'KV_LIST', lists:reverse(Acc)}.

encode_jer_component_map([{Name, AName, Type, _OptOrDefault} |
                          CompInfos],
                         MapVal, Acc)
    when is_map_key(AName, MapVal) ->
    Value = maps:get(AName, MapVal),
    Enc = encode_jer(Type, Value),
    encode_jer_component_map(CompInfos, MapVal, [{Name, Enc} | Acc]);
encode_jer_component_map([{_Name, _AName, _Type, 'OPTIONAL'} |
                          CompInfos],
                         MapVal, Acc) ->
    encode_jer_component_map(CompInfos, MapVal, Acc);
encode_jer_component_map([{_Name, _AName, _Type, {'DEFAULT', _}} |
                          CompInfos],
                         MapVal, Acc) ->
    encode_jer_component_map(CompInfos, MapVal, Acc);
encode_jer_component_map([], MapVal, Acc)
    when map_size(MapVal) =:= length(Acc) ->
    {'KV_LIST', lists:reverse(Acc)};
encode_jer_component_map(_, MapVal, Acc) ->
    ErroneousKeys =
        maps:keys(MapVal)
        --
        [ 
         K ||
             {K, _V} <- Acc
        ],
    exit({error,
          {asn1,
           {{encode, 'SEQUENCE'}, {erroneous_keys, ErroneousKeys}}}}).

encode_jer_component_tab([{_Name, _Type, 'OPTIONAL'} | CompInfos],
                         [asn1_NOVALUE | Rest],
                         Simple, MapAcc) ->
    encode_jer_component_tab(CompInfos, Rest, Simple, MapAcc);
encode_jer_component_tab([{_Name, _Type, {'DEFAULT', _}} | CompInfos],
                         [asn1_DEFAULT | Rest],
                         Simple, MapAcc) ->
    encode_jer_component_tab(CompInfos, Rest, Simple, MapAcc);
encode_jer_component_tab([{Name, Type, _OptOrDefault} | CompInfos],
                         [Value | Rest],
                         Simple, MapAcc) ->
    Enc = encode_jer(Type, Value),
    encode_jer_component_tab(CompInfos, Rest, Simple,
                             MapAcc#{Name => Enc});
encode_jer_component_tab([], _, _Simple, MapAcc) ->
    MapAcc.

jer_bit_str2bitstr(Compact = {_Unused, _Binary}, _NamedBitList) ->
    jer_compact2bitstr(Compact);
jer_bit_str2bitstr(Int, _NamedBitList) when is_integer(Int) ->
    jer_compact2bitstr(Int);
jer_bit_str2bitstr(BitList = [Bit | _], _NamedBitList)
    when Bit == 1; Bit == 0 ->
    Int =
        list_to_integer([ 
                         case B of
                             0 ->
                                 $0;
                             1 ->
                                 $1
                         end ||
                             B <- BitList
                        ],
                        2),
    Len = length(BitList),
    <<Int:Len>>;
jer_bit_str2bitstr([H | _] = Bits, NamedBitList) when is_atom(H) ->
    jer_do_encode_named_bit_string(Bits, NamedBitList);
jer_bit_str2bitstr([{bit, _} | _] = Bits, NamedBitList) ->
    jer_do_encode_named_bit_string(Bits, NamedBitList);
jer_bit_str2bitstr([], _NamedBitList) ->
    <<>>;
jer_bit_str2bitstr(BitStr, _NamedBitList) when is_bitstring(BitStr) ->
    BitStr.

jer_bitstr2compact(BitStr) ->
    Size = bit_size(BitStr),
    Unused = (8 - Size rem 8) band 7,
    {Unused, <<BitStr/bitstring,0:Unused>>}.

jer_bitstr2names(<<1:1,BitStr/bitstring>>,
                 [{Name, Pos} | Rest],
                 Pos, Acc) ->
    jer_bitstr2names(BitStr, Rest, Pos + 1, [Name | Acc]);
jer_bitstr2names(<<1:1,BitStr/bitstring>>, NNL, Num, Acc) ->
    jer_bitstr2names(BitStr, NNL, Num + 1, [{bit, Num} | Acc]);
jer_bitstr2names(<<0:1,BitStr/bitstring>>, [{_, Num} | Rest], Num, Acc) ->
    jer_bitstr2names(BitStr, Rest, Num + 1, Acc);
jer_bitstr2names(<<0:1,BitStr/bitstring>>, NNL, Num, Acc) ->
    jer_bitstr2names(BitStr, NNL, Num + 1, Acc);
jer_bitstr2names(<<>>, _, _, Acc) ->
    lists:reverse(Acc).

jer_bitstr2names(BitStr, []) ->
    BitStr;
jer_bitstr2names(BitStr, NNL) ->
    SortedList = lists:keysort(2, NNL),
    jer_bitstr2names(BitStr, SortedList, 0, []).

jer_compact2bitstr({Unused, Binary}) ->
    Size = bit_size(Binary) - Unused,
    <<BitStr:Size/bitstring,_/bitstring>> = Binary,
    BitStr;
jer_compact2bitstr(Int) when is_integer(Int) ->
    jer_int2bitstr(Int);
jer_compact2bitstr(BitList = [Bit | _]) when Bit == 1; Bit == 0 ->
    IntStr = jer_skip_trailing_zeroes(BitList, []),
    Int = list_to_integer(IntStr, 2),
    Len = length(IntStr),
    <<Int:Len>>.

jer_do_encode_named_bit_string([FirstVal | RestVal], NamedBitList) ->
    ToSetPos =
        jer_get_all_bitposes([FirstVal | RestVal], NamedBitList, []),
    Size = lists:max(ToSetPos) + 1,
    BitList = jer_make_and_set_list(Size, ToSetPos, 0),
    jer_encode_bitstring(BitList).

jer_encode_bitstring([B8, B7, B6, B5, B4, B3, B2, B1 | Rest]) ->
    Val =
        B8 bsl 7 bor (B7 bsl 6) bor (B6 bsl 5) bor (B5 bsl 4)
        bor
        (B4 bsl 3)
        bor
        (B3 bsl 2)
        bor
        (B2 bsl 1)
        bor
        B1,
    jer_encode_bitstring(Rest, <<Val>>);
jer_encode_bitstring(Val) ->
    jer_unused_bitlist(Val, <<>>).

jer_encode_bitstring([B8, B7, B6, B5, B4, B3, B2, B1 | Rest], Acc) ->
    Val =
        B8 bsl 7 bor (B7 bsl 6) bor (B6 bsl 5) bor (B5 bsl 4)
        bor
        (B4 bsl 3)
        bor
        (B3 bsl 2)
        bor
        (B2 bsl 1)
        bor
        B1,
    jer_encode_bitstring(Rest, [Acc, Val]);
jer_encode_bitstring([], Acc) ->
    Acc;
jer_encode_bitstring(Rest, Acc) ->
    jer_unused_bitlist(Rest, Acc).

jer_get_all_bitposes([{bit, ValPos} | Rest], NamedBitList, Ack) ->
    jer_get_all_bitposes(Rest, NamedBitList, [ValPos | Ack]);
jer_get_all_bitposes([Val | Rest], NamedBitList, Ack) when is_atom(Val) ->
    case lists:keyfind(Val, 1, NamedBitList) of
        {_ValName, ValPos} ->
            jer_get_all_bitposes(Rest, NamedBitList, [ValPos | Ack]);
        _ ->
            exit({error, {asn1, {bitstring_namedbit, Val}}})
    end;
jer_get_all_bitposes([], _NamedBitList, Ack) ->
    lists:sort(Ack).

jer_int2bitstr(0, Acc) ->
    Acc;
jer_int2bitstr(Int, Acc) ->
    Bit = Int band 1,
    jer_int2bitstr(Int bsr 1, <<Acc/bitstring,Bit:1>>).

jer_int2bitstr(Int) when is_integer(Int), Int >= 0 ->
    jer_int2bitstr(Int, <<>>).

jer_make_and_set_list(0, [], _) ->
    [];
jer_make_and_set_list(0, _, _) ->
    exit({error, {asn1, bitstring_sizeconstraint}});
jer_make_and_set_list(Len, [XPos | SetPos], XPos) ->
    [1 | jer_make_and_set_list(Len - 1, SetPos, XPos + 1)];
jer_make_and_set_list(Len, [Pos | SetPos], XPos) ->
    [0 | jer_make_and_set_list(Len - 1, [Pos | SetPos], XPos + 1)];
jer_make_and_set_list(Len, [], XPos) ->
    [0 | jer_make_and_set_list(Len - 1, [], XPos + 1)].

jer_padbitstr(BitStr, FixedLength) when bit_size(BitStr) == FixedLength ->
    BitStr;
jer_padbitstr(BitStr, FixedLength) when bit_size(BitStr) < FixedLength ->
    Len = bit_size(BitStr),
    PadLen = FixedLength - Len,
    <<BitStr/bitstring,0:PadLen>>.

jer_skip_trailing_zeroes([1 | Rest], Acc) ->
    jer_skip_trailing_zeroes(Rest, [$1 | Acc]);
jer_skip_trailing_zeroes([0 | Rest], Acc) ->
    jer_skip_trailing_zeroes(Rest, [$0 | Acc]);
jer_skip_trailing_zeroes([], [$0 | Acc]) ->
    jer_skip_trailing_zeroes([], Acc);
jer_skip_trailing_zeroes([], Acc) ->
    lists:reverse(Acc).

jer_unused_bitlist([], Acc) ->
    Acc;
jer_unused_bitlist([Bit | Rest], Acc) ->
    jer_unused_bitlist(Rest, <<Acc/bitstring,Bit:1>>).

json2bitstring(Value, Length) ->
    json2bitstring(Value, Length, []).

json2bitstring([A1, A2], Length, Acc) ->
    Int = list_to_integer([A1, A2], 16) bsr (8 - Length),
    Bin = list_to_binary(lists:reverse(Acc)),
    <<Bin/binary,Int:Length>>;
json2bitstring([A1, A2 | Rest], Length, Acc) ->
    Int = list_to_integer([A1, A2], 16),
    json2bitstring(Rest, Length - 8, [Int | Acc]);
json2bitstring([], 0, Acc) ->
    Bin = list_to_binary(lists:reverse(Acc)),
    Bin.

json2octetstring([A1, A2 | Rest], Acc) ->
    Int = list_to_integer([A1, A2], 16),
    json2octetstring(Rest, [Int | Acc]);
json2octetstring([], Acc) ->
    lists:reverse(Acc).

json2octetstring2binary(Value) ->
    list_to_binary(json2octetstring(Value, [])).

json2octetstring2string(Value) ->
    json2octetstring(Value, []).

json2oid(OidStr) when is_binary(OidStr) ->
    OidList = binary:split(OidStr, [<<".">>], [global]),
    OidNumList =
        [ 
         binary_to_integer(Num) ||
             Num <- OidList
        ],
    list_to_tuple(OidNumList).

octetstring2json(List) when is_list(List) ->
    list_to_binary([ 
                    begin
                        Num = integer_to_list(X, 16),
                        if
                            length(Num) == 1 ->
                                "0" ++ Num;
                            true ->
                                Num
                        end
                    end ||
                        X <- List
                   ]).

oid2json(Oid) when is_tuple(Oid) ->
    OidList = tuple_to_list(Oid),
    OidNumberStr =
        [ 
         integer_to_list(V) ||
             V <- OidList
        ],
    oid2json(OidNumberStr, []).

oid2json([Num | T], []) ->
    oid2json(T, [Num]);
oid2json([Num | T], Acc) ->
    oid2json(T, [Num, $. | Acc]);
oid2json([], Acc) ->
    list_to_binary(lists:reverse(Acc)).

open_type_to_binary({asn1_OPENTYPE, Bin}) when is_binary(Bin) ->
    Bin.

skipextensions(Bytes0, Nr, ExtensionBitstr)
    when is_bitstring(ExtensionBitstr) ->
    Prev = Nr - 1,
    case ExtensionBitstr of
        <<_:Prev,1:1,_/bitstring>> ->
            {Len, Bytes1} = decode_length(Bytes0),
            <<_:Len/binary,Bytes2/bitstring>> = Bytes1,
            skipextensions(Bytes2, Nr + 1, ExtensionBitstr);
        <<_:Prev,0:1,_/bitstring>> ->
            skipextensions(Bytes0, Nr + 1, ExtensionBitstr);
        _ ->
            Bytes0
    end.
