%% Generated by the Erlang ASN.1 compiler. Version: 5.3.1
%% Purpose: Erlang record definitions for each named and unnamed
%% SEQUENCE and SET, and macro definitions for each value
%% definition in module BasicSafetyMessage.

-ifndef(_BASICSAFETYMESSAGE_HRL_).
-define(_BASICSAFETYMESSAGE_HRL_, true).

-record('PartIIcontent', {
  'partII-Id',
  'partII-Value'
}).

-record('BasicSafetyMessage', {
  coreData,
  partII = asn1_NOVALUE,
  regional = asn1_NOVALUE
  %% with extension mark
}).

-record('BasicSafetyMessage_partII_SEQOF', {
  'partII-Id',
  'partII-Value'
}).

-record('BasicSafetyMessage_regional_SEQOF', {
  regionId,
  regExtValue
}).

-record('DisabledVehicle', {
  statusDetails,
  locationDetails = asn1_NOVALUE
  %% with extension mark
}).

-record('EventDescription', {
  typeEvent,
  description = asn1_NOVALUE,
  priority = asn1_NOVALUE,
  heading = asn1_NOVALUE,
  extent = asn1_NOVALUE,
  regional = asn1_NOVALUE
  %% with extension mark
}).

-record('EventDescription_regional_SEQOF', {
  regionId,
  regExtValue
}).

-record('ObstacleDetection', {
  obDist,
  obDirect,
  description = asn1_NOVALUE,
  locationDetails = asn1_NOVALUE,
  dateTime,
  vertEvent = asn1_NOVALUE
  %% with extension mark
}).

-record('PivotPointDescription', {
  pivotOffset,
  pivotAngle,
  pivots
  %% with extension mark
}).

-record('RTCMPackage', {
  rtcmHeader = asn1_NOVALUE,
  msgs
  %% with extension mark
}).

-record('SpecialVehicleExtensions', {
  vehicleAlerts = asn1_NOVALUE,
  description = asn1_NOVALUE,
  doNotUse = asn1_NOVALUE
  %% with extension mark
}).

-record('SpeedProfile', {
  speedReports
  %% with extension mark
}).

-record('SupplementalVehicleExtensions', {
  classification = asn1_NOVALUE,
  classDetails = asn1_NOVALUE,
  vehicleData = asn1_NOVALUE,
  doNotUse1 = asn1_NOVALUE,
  doNotUse2 = asn1_NOVALUE,
  doNotUse3 = asn1_NOVALUE,
  status = asn1_NOVALUE,
  doNotUse4 = asn1_NOVALUE,
  doNotUse5 = asn1_NOVALUE,
  regional = asn1_NOVALUE,
  %% with extensions
  fhwaVehicleClass,
  trailers = asn1_NOVALUE,
  schoolBus = asn1_NOVALUE
}).

-record('SupplementalVehicleExtensions_regional_SEQOF', {
  regionId,
  regExtValue
}).

-record('TrailerData', {
  doNotUse,
  connection,
  units
  %% with extension mark
}).

-record('TrailerHistoryPoint', {
  pivotAngle,
  timeOffset,
  positionOffset,
  elevationOffset = asn1_NOVALUE,
  heading = asn1_NOVALUE
  %% with extension mark
}).

-record('TrailerUnitDescription', {
  isDolly,
  width,
  length,
  height = asn1_NOVALUE,
  mass = asn1_NOVALUE,
  bumperHeights = asn1_NOVALUE,
  centerOfGravity = asn1_NOVALUE,
  frontPivot,
  rearPivot = asn1_NOVALUE,
  rearWheelOffset = asn1_NOVALUE,
  positionOffset,
  elevationOffset = asn1_NOVALUE,
  crumbData = asn1_NOVALUE
  %% with extension mark
}).

-record('VehicleData', {
  height = asn1_NOVALUE,
  bumpers = asn1_NOVALUE,
  mass = asn1_NOVALUE,
  doNotUse = asn1_NOVALUE,
  %% with extensions
  trailerPresent = asn1_NOVALUE,
  pivotPoint = asn1_NOVALUE,
  axles = asn1_NOVALUE,
  leanAngle = asn1_NOVALUE
}).

-record('WeatherProbe', {
  airTemp = asn1_NOVALUE,
  airPressure = asn1_NOVALUE,
  rainRates = asn1_NOVALUE
  %% with extension mark
}).

-record('WeatherReport', {
  isRaining,
  rainRate = asn1_NOVALUE,
  precipSituation = asn1_NOVALUE,
  solarRadiation = asn1_NOVALUE,
  friction = asn1_NOVALUE,
  roadFriction = asn1_NOVALUE
  %% with extension mark
}).

-define('vehicleSafetyExt', 0).
-define('specialVehicleExt', 1).
-define('supplementalVehicleExt', 2).
-endif. %% _BASICSAFETYMESSAGE_HRL_
