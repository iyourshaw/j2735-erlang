%% Generated by the Erlang ASN.1 compiler. Version: 5.3.1
%% Purpose: Erlang record definitions for each named and unnamed
%% SEQUENCE and SET, and macro definitions for each value
%% definition in module SensorDataSharingMessage.

-ifndef(_SENSORDATASHARINGMESSAGE_HRL_).
-define(_SENSORDATASHARINGMESSAGE_HRL_, true).

-record('SensorDataSharingMessage', {
  msgCnt,
  sourceID,
  equipmentType,
  sDSMTimeStamp,
  refPos,
  refPosXYConf,
  refPosElConf = asn1_NOVALUE,
  objects
}).

-record('DetectedObjectData', {
  detObjCommon,
  detObjOptData = asn1_NOVALUE
}).

-record('DetectedObjectCommonData', {
  objType,
  objTypeCfd,
  objectID,
  measurementTime,
  timeConfidence,
  pos,
  posConfidence,
  speed,
  speedConfidence,
  speedZ = asn1_NOVALUE,
  speedConfidenceZ = asn1_NOVALUE,
  heading,
  headingConf,
  accel4way = asn1_NOVALUE,
  accCfdX = asn1_NOVALUE,
  accCfdY = asn1_NOVALUE,
  accCfdZ = asn1_NOVALUE,
  accCfdYaw = asn1_NOVALUE
  %% with extension mark
}).

-record('DetectedVehicleData', {
  lights = asn1_NOVALUE,
  vehAttitude = asn1_NOVALUE,
  vehAttitudeConfidence = asn1_NOVALUE,
  vehAngVel = asn1_NOVALUE,
  vehAngVelConfidence = asn1_NOVALUE,
  size = asn1_NOVALUE,
  height = asn1_NOVALUE,
  vehicleSizeConfidence = asn1_NOVALUE,
  vehicleClass = asn1_NOVALUE,
  classConf = asn1_NOVALUE
  %% with extension mark
}).

-record('DetectedVRUData', {
  basicType = asn1_NOVALUE,
  propulsion = asn1_NOVALUE,
  attachment = asn1_NOVALUE,
  radius = asn1_NOVALUE
}).

-record('DetectedObstacleData', {
  obstSize,
  obstSizeConfidence
}).

-record('PositionOffsetXYZ', {
  offsetX,
  offsetY,
  offsetZ = asn1_NOVALUE
}).

-record('Attitude', {
  pitch,
  roll,
  yaw
}).

-record('AttitudeConfidence', {
  pitchConfidence,
  rollConfidence,
  yawConfidence
}).

-record('AngularVelocity', {
  pitchRate,
  rollRate
}).

-record('AngularVelocityConfidence', {
  pitchRateConfidence = asn1_NOVALUE,
  rollRateConfidence = asn1_NOVALUE
}).

-record('VehicleSizeConfidence', {
  vehicleWidthConfidence,
  vehicleLengthConfidence,
  vehicleHeightConfidence = asn1_NOVALUE
}).

-record('ObstacleSize', {
  width,
  length,
  height = asn1_NOVALUE
}).

-record('ObstacleSizeConfidence', {
  widthConfidence,
  lengthConfidence,
  heightConfidence = asn1_NOVALUE
}).

-endif. %% _SENSORDATASHARINGMESSAGE_HRL_
