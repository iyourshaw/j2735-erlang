%% Generated by the Erlang ASN.1 compiler. Version: 5.3.1
%% Purpose: Erlang record definitions for each named and unnamed
%% SEQUENCE and SET, and macro definitions for each value
%% definition in module TestMessage14.

-ifndef(_TESTMESSAGE14_HRL_).
-define(_TESTMESSAGE14_HRL_, true).

-record('TestMessage14', {
  header = asn1_NOVALUE,
  regional = asn1_NOVALUE
  %% with extension mark
}).

-record('TestMessage14_regional', {
  regionId,
  regExtValue
}).

-endif. %% _TESTMESSAGE14_HRL_
