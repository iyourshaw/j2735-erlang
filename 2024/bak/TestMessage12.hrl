%% Generated by the Erlang ASN.1 compiler. Version: 5.3.1
%% Purpose: Erlang record definitions for each named and unnamed
%% SEQUENCE and SET, and macro definitions for each value
%% definition in module TestMessage12.

-ifndef(_TESTMESSAGE12_HRL_).
-define(_TESTMESSAGE12_HRL_, true).

-record('TestMessage12', {
  header = asn1_NOVALUE,
  regional = asn1_NOVALUE
  %% with extension mark
}).

-record('TestMessage12_regional', {
  regionId,
  regExtValue
}).

-endif. %% _TESTMESSAGE12_HRL_
