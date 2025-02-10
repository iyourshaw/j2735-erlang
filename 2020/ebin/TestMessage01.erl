%% Generated by the Erlang ASN.1 PER (unaligned) compiler. Version: 5.3.1
%% Purpose: Encoding and decoding of the types in TestMessage01.

-module('TestMessage01').
-moduledoc false.
-compile(nowarn_unused_vars).
-dialyzer(no_improper_lists).
-dialyzer(no_match).
-include("TestMessage01.hrl").
-asn1_info([{vsn,'5.3.1'},
            {module,'TestMessage01'},
            {options,[{i,"./ebin"},uper,jer,verbose,{i,"./asn"},{outdir,"./ebin"},{i,"."}]}]).

-export([encoding_rule/0,maps/0,bit_string_format/0,
         legacy_erlang_types/0]).
-export(['dialyzer-suppressions'/1]).
-export([typeinfo/1]).
-export([
enc_TestMessage01/1
]).

-export([
dec_TestMessage01/1
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
try encode_jer('TestMessage01', Type, Data) of
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
   Result = decode_jer('TestMessage01', Type, json:decode(Data)),
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

encode_disp('TestMessage01', Data) -> enc_TestMessage01(Data);
encode_disp(Type, _Data) -> exit({error,{asn1,{undefined_type,Type}}}).

decode_disp('TestMessage01', Data) -> dec_TestMessage01(Data);
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
enc_TestMessage01(Val) ->
[begin
Enc1@element = element(2, Val),
Enc2@element = element(3, Val),
if Enc1@element =:= asn1_NOVALUE ->
if Enc2@element =:= asn1_NOVALUE ->
<<0:1,0:1,0:1>>;
true ->
<<0:1,0:1,1:1>>
end;
true ->
if Enc2@element =:= asn1_NOVALUE ->
<<0:1,1:1,0:1>>;
true ->
<<0:1,1:1,1:1>>
end
end
end,
begin
%% attribute header(1) with type Header
Enc4@element = element(2, Val),
if Enc4@element =:= asn1_NOVALUE ->
[];
true ->
'Common':enc_Header(Enc4@element)
end
end|begin
%% attribute regional(2) with type SEQUENCE
Enc6@element = element(3, Val),
if Enc6@element =:= asn1_NOVALUE ->
[];
true ->
enc_TestMessage01_regional(Enc6@element)
end
end].
enc_TestMessage01_regional(Val) ->
Enc1@element = element(2, Val),
[begin
%% attribute regionId(1) with type INTEGER
Enc2@element = Enc1@element,
if Enc2@element bsr 8 =:= 0 ->
Enc2@element;
true ->
exit({error,{asn1,{illegal_integer,Enc2@element}}})
end
end|begin
%% attribute regExtValue(2) with type Type
Enc4@element = element(3, Val),
Enc5@output = enc_os_Type1(Enc4@element, Enc1@element),
Enc5@bin = complete(Enc5@output),
Enc5@len = byte_size(Enc5@bin),
if Enc5@len < 128 ->
[Enc5@len|Enc5@bin];
Enc5@len < 16384 ->
[<<2:2,Enc5@len:14>>|Enc5@bin];
true ->
encode_fragmented(Enc5@bin, 8)
end
end].


dec_TestMessage01(Bytes) ->
{Ext,Bytes1} = begin
<<V1@V0:1,V1@Buf1/bitstring>> = Bytes,
{V1@V0,V1@Buf1}
end,
{Opt,Bytes2} = begin
<<V2@V0:2,V2@Buf1/bitstring>> = Bytes1,
{V2@V0,V2@Buf1}
end,

%% attribute header(1) with type Header
{Term1,Bytes3} = case (Opt bsr 1) band 1 of
1 ->
'Common':dec_Header(Bytes2);
0 ->
{asn1_NOVALUE,Bytes2}
end,

%% attribute regional(2) with type SEQUENCE
{Term2,Bytes4} = case Opt band 1 of
1 ->
dec_TestMessage01_regional(Bytes3);
0 ->
{asn1_NOVALUE,Bytes3}
end,

%% Extensions
{Extensions,Bytes5} = case Ext of
0 -> {<<>>,Bytes4};
1 ->
{V3@V0,V3@Buf1} = case Bytes4 of
<<0:1,V3@V3:6,V3@Buf4/bitstring>> ->
V3@Add5 = V3@V3 + 1,
{V3@Add5,V3@Buf4};
<<1:1,V3@Buf2/bitstring>> ->
{V3@V3,V3@Buf4} = case V3@Buf2 of
<<0:1,V3@V6:7,V3@Buf7/bitstring>> when V3@V6 =/= 0 ->
{V3@V6,V3@Buf7};
<<1:1,0:1,V3@V7:14,V3@Buf8/bitstring>> when V3@V7 =/= 0 ->
{V3@V7,V3@Buf8};
<<1:1,1:1,V3@V7:6,V3@Buf8/bitstring>> when V3@V7 =/= 0 ->
V3@Mul9 = V3@V7 * 16384,
{V3@Mul9,V3@Buf8}
end,
{V3@V3,V3@Buf4}
end,
<<V3@V10:V3@V0/bitstring-unit:1,V3@Buf11/bitstring>> = V3@Buf1,
{V3@V10,V3@Buf11}
end,
Bytes6= skipextensions(Bytes5, 1, Extensions),
Res1 = {'TestMessage01',Term1,Term2},
{Res1,Bytes6}.


dec_TestMessage01_regional(Bytes) ->

%% attribute regionId(1) with type INTEGER
{Term1,Bytes1} = begin
<<V1@V0:8,V1@Buf1/bitstring>> = Bytes,
{V1@V0,V1@Buf1}
end,

%% attribute regExtValue(2) with type Type
{Tmpterm1, Bytes2} = begin
{V2@V0,V2@Buf1} = case Bytes1 of
<<0:1,V2@V3:7,V2@V5:V2@V3/binary-unit:8,V2@Buf6/bitstring>> ->
{V2@V5,V2@Buf6};
<<1:1,0:1,V2@V4:14,V2@V6:V2@V4/binary-unit:8,V2@Buf7/bitstring>> ->
{V2@V6,V2@Buf7};
<<1:1,1:1,V2@V4:6,V2@Buf5/bitstring>> ->
{V2@V6,V2@Buf7}  = decode_fragmented(V2@V4, V2@Buf5, 8),
{V2@V6,V2@Buf7}
end,
{V2@V0,V2@Buf1}
end,
Term2 = dec_os_Type2(Tmpterm1, Term1),
Res1 = {'TestMessage01_regional',Term1,Term2},
{Res1,Bytes2}.

typeinfo('TestMessage01') ->
  {sequence,'TestMessage01',2,[{<<104,101,97,100,101,114>>,{typeinfo,{'Common','Header'}},'OPTIONAL'},{<<114,101,103,105,111,110,97,108>>,{sequence,'TestMessage01_regional',2,[{<<114,101,103,105,111,110,73,100>>,{'INTEGER',{0,255}},mandatory},{<<114,101,103,69,120,116,86,97,108,117,101>>,{'ObjClassFieldType',{regionId,1},{componentrelation,{objectset,121,{'Externaltypereference',undefined,'TestMessage01',internal_object_set_argument_1}},[{outermost,[{'Externalvaluereference',121,'Common',regionId}]}]}},mandatory}]},'OPTIONAL'}]};
typeinfo(Type) ->
  exit({error,{asn1,{undefined_type,Type}}}).


%%%
%%% Run-time functions.
%%%

'dialyzer-suppressions'(Arg) ->
    complete(element(1, Arg)),
    ok.

dec_os_Type2(Bytes, Id) ->
{asn1_OPENTYPE,Bytes}.


enc_os_Type1(Val, Id) ->
open_type_to_binary(Val).

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
