%% Generated by the Erlang ASN.1 compiler. Version: 5.3.1
%% Purpose: Erlang record definitions for each named and unnamed
%% SEQUENCE and SET, and macro definitions for each value
%% definition in module PersonalSafetyMessage.

-ifndef(_PERSONALSAFETYMESSAGE_HRL_).
-define(_PERSONALSAFETYMESSAGE_HRL_, true).

-record('PersonalSafetyMessage', {
  basicType,
  secMark,
  msgCnt,
  id,
  position,
  accuracy,
  speed,
  heading,
  accelSet = asn1_NOVALUE,
  pathHistory = asn1_NOVALUE,
  pathPrediction = asn1_NOVALUE,
  propulsion = asn1_NOVALUE,
  useState = asn1_NOVALUE,
  crossRequest = asn1_NOVALUE,
  crossState = asn1_NOVALUE,
  clusterSize = asn1_NOVALUE,
  clusterRadius = asn1_NOVALUE,
  eventResponderType = asn1_NOVALUE,
  activityType = asn1_NOVALUE,
  activitySubType = asn1_NOVALUE,
  assistType = asn1_NOVALUE,
  sizing = asn1_NOVALUE,
  attachment = asn1_NOVALUE,
  attachmentRadius = asn1_NOVALUE,
  animalType = asn1_NOVALUE,
  regional = asn1_NOVALUE
  %% with extension mark
}).

-record('PersonalSafetyMessage_regional_SEQOF', {
  regionId,
  regExtValue
}).

-endif. %% _PERSONALSAFETYMESSAGE_HRL_
