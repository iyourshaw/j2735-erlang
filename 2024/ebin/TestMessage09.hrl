%% Generated by the Erlang ASN.1 compiler. Version: 5.3.1
%% Purpose: Erlang record definitions for each named and unnamed
%% SEQUENCE and SET, and macro definitions for each value
%% definition in module TestMessage09.

-ifndef(_TESTMESSAGE09_HRL_).
-define(_TESTMESSAGE09_HRL_, true).

-record('TestMessage09', {
  header = asn1_NOVALUE,
  regional = asn1_NOVALUE
  %% with extension mark
}).

-record('TestMessage09_regional', {
  regionId,
  regExtValue
}).

-endif. %% _TESTMESSAGE09_HRL_
