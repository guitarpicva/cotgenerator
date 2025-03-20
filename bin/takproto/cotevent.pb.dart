//
//  Generated code. Do not modify.
//  source: cotevent.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'detail.pb.dart' as $6;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

///  A note about timestamps:
///  Uses "timeMs" units, which is number of milliseconds since
///  1970-01-01 00:00:00 UTC
///
///  All items are required unless otherwise noted!
///  "required" means if they are missing in the XML during outbound
///  conversion to protobuf, the message will be
///  rejected
class CotEvent extends $pb.GeneratedMessage {
  factory CotEvent({
    $core.String? type,
    $core.String? access,
    $core.String? qos,
    $core.String? opex,
    $core.String? uid,
    $fixnum.Int64? sendTime,
    $fixnum.Int64? startTime,
    $fixnum.Int64? staleTime,
    $core.String? how,
    $core.double? lat,
    $core.double? lon,
    $core.double? hae,
    $core.double? ce,
    $core.double? le,
    $6.Detail? detail,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (access != null) {
      $result.access = access;
    }
    if (qos != null) {
      $result.qos = qos;
    }
    if (opex != null) {
      $result.opex = opex;
    }
    if (uid != null) {
      $result.uid = uid;
    }
    if (sendTime != null) {
      $result.sendTime = sendTime;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (staleTime != null) {
      $result.staleTime = staleTime;
    }
    if (how != null) {
      $result.how = how;
    }
    if (lat != null) {
      $result.lat = lat;
    }
    if (lon != null) {
      $result.lon = lon;
    }
    if (hae != null) {
      $result.hae = hae;
    }
    if (ce != null) {
      $result.ce = ce;
    }
    if (le != null) {
      $result.le = le;
    }
    if (detail != null) {
      $result.detail = detail;
    }
    return $result;
  }
  CotEvent._() : super();
  factory CotEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CotEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CotEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'atakmap.commoncommo.protobuf.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'type')
    ..aOS(2, _omitFieldNames ? '' : 'access')
    ..aOS(3, _omitFieldNames ? '' : 'qos')
    ..aOS(4, _omitFieldNames ? '' : 'opex')
    ..aOS(5, _omitFieldNames ? '' : 'uid')
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'sendTime', $pb.PbFieldType.OU6, protoName: 'sendTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'startTime', $pb.PbFieldType.OU6, protoName: 'startTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'staleTime', $pb.PbFieldType.OU6, protoName: 'staleTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(9, _omitFieldNames ? '' : 'how')
    ..a<$core.double>(10, _omitFieldNames ? '' : 'lat', $pb.PbFieldType.OD)
    ..a<$core.double>(11, _omitFieldNames ? '' : 'lon', $pb.PbFieldType.OD)
    ..a<$core.double>(12, _omitFieldNames ? '' : 'hae', $pb.PbFieldType.OD)
    ..a<$core.double>(13, _omitFieldNames ? '' : 'ce', $pb.PbFieldType.OD)
    ..a<$core.double>(14, _omitFieldNames ? '' : 'le', $pb.PbFieldType.OD)
    ..aOM<$6.Detail>(15, _omitFieldNames ? '' : 'detail', subBuilder: $6.Detail.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CotEvent clone() => CotEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CotEvent copyWith(void Function(CotEvent) updates) => super.copyWith((message) => updates(message as CotEvent)) as CotEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CotEvent create() => CotEvent._();
  CotEvent createEmptyInstance() => create();
  static $pb.PbList<CotEvent> createRepeated() => $pb.PbList<CotEvent>();
  @$core.pragma('dart2js:noInline')
  static CotEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CotEvent>(create);
  static CotEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get access => $_getSZ(1);
  @$pb.TagNumber(2)
  set access($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccess() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get qos => $_getSZ(2);
  @$pb.TagNumber(3)
  set qos($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasQos() => $_has(2);
  @$pb.TagNumber(3)
  void clearQos() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get opex => $_getSZ(3);
  @$pb.TagNumber(4)
  set opex($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOpex() => $_has(3);
  @$pb.TagNumber(4)
  void clearOpex() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get uid => $_getSZ(4);
  @$pb.TagNumber(5)
  set uid($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearUid() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get sendTime => $_getI64(5);
  @$pb.TagNumber(6)
  set sendTime($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSendTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearSendTime() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get startTime => $_getI64(6);
  @$pb.TagNumber(7)
  set startTime($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStartTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearStartTime() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get staleTime => $_getI64(7);
  @$pb.TagNumber(8)
  set staleTime($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStaleTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearStaleTime() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get how => $_getSZ(8);
  @$pb.TagNumber(9)
  set how($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasHow() => $_has(8);
  @$pb.TagNumber(9)
  void clearHow() => clearField(9);

  /// `<point>`
  @$pb.TagNumber(10)
  $core.double get lat => $_getN(9);
  @$pb.TagNumber(10)
  set lat($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLat() => $_has(9);
  @$pb.TagNumber(10)
  void clearLat() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get lon => $_getN(10);
  @$pb.TagNumber(11)
  set lon($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasLon() => $_has(10);
  @$pb.TagNumber(11)
  void clearLon() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get hae => $_getN(11);
  @$pb.TagNumber(12)
  set hae($core.double v) { $_setDouble(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasHae() => $_has(11);
  @$pb.TagNumber(12)
  void clearHae() => clearField(12);

  @$pb.TagNumber(13)
  $core.double get ce => $_getN(12);
  @$pb.TagNumber(13)
  set ce($core.double v) { $_setDouble(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasCe() => $_has(12);
  @$pb.TagNumber(13)
  void clearCe() => clearField(13);

  @$pb.TagNumber(14)
  $core.double get le => $_getN(13);
  @$pb.TagNumber(14)
  set le($core.double v) { $_setDouble(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasLe() => $_has(13);
  @$pb.TagNumber(14)
  void clearLe() => clearField(14);

  /// comprises children of `<detail>`
  /// This is optional - if omitted, then the cot message
  /// had no data under `<detail>`
  @$pb.TagNumber(15)
  $6.Detail get detail => $_getN(14);
  @$pb.TagNumber(15)
  set detail($6.Detail v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasDetail() => $_has(14);
  @$pb.TagNumber(15)
  void clearDetail() => clearField(15);
  @$pb.TagNumber(15)
  $6.Detail ensureDetail() => $_ensure(14);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
