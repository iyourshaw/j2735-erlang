%% Generated by the Erlang ASN.1 compiler. Version: 5.3.1
%% Purpose: Erlang record definitions for each named and unnamed
%% SEQUENCE and SET, and macro definitions for each value
%% definition in module ProbeDataManagement.

-ifndef(_PROBEDATAMANAGEMENT_HRL_).
-define(_PROBEDATAMANAGEMENT_HRL_, true).

-record('ProbeDataManagement', {
  timeStamp = asn1_NOVALUE,
  sample,
  directions,
  term,
  snapshot,
  txInterval,
  dataElements = asn1_NOVALUE,
  regional = asn1_NOVALUE
  %% with extension mark
}).

-record('ProbeDataManagement_regional_SEQOF', {
  regionId,
  regExtValue
}).

-record('Sample', {
  sampleStart,
  sampleEnd
}).

-record('SnapshotDistance', {
  distance1,
  speed1,
  distance2,
  speed2
}).

-record('SnapshotTime', {
  speed1,
  time1,
  speed2,
  time2
}).

-record('VehicleStatusRequest', {
  dataType,
  subType = asn1_NOVALUE,
  sendOnLessThenValue = asn1_NOVALUE,
  sendOnMoreThenValue = asn1_NOVALUE,
  sendAll = asn1_NOVALUE
  %% with extension mark
}).

-endif. %% _PROBEDATAMANAGEMENT_HRL_
