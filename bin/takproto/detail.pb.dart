//
//  Generated code. Do not modify.
//  source: detail.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'contact.pb.dart' as $0;
import 'group.pb.dart' as $1;
import 'precisionlocation.pb.dart' as $2;
import 'status.pb.dart' as $3;
import 'takv.pb.dart' as $4;
import 'track.pb.dart' as $5;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Detail extends $pb.GeneratedMessage {
  factory Detail({
    $core.String? xmlDetail,
    $0.Contact? contact,
    $1.Group? group,
    $2.PrecisionLocation? precisionLocation,
    $3.Status? status,
    $4.Takv? takv,
    $5.Track? track,
  }) {
    final $result = create();
    if (xmlDetail != null) {
      $result.xmlDetail = xmlDetail;
    }
    if (contact != null) {
      $result.contact = contact;
    }
    if (group != null) {
      $result.group = group;
    }
    if (precisionLocation != null) {
      $result.precisionLocation = precisionLocation;
    }
    if (status != null) {
      $result.status = status;
    }
    if (takv != null) {
      $result.takv = takv;
    }
    if (track != null) {
      $result.track = track;
    }
    return $result;
  }
  Detail._() : super();
  factory Detail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Detail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Detail', package: const $pb.PackageName(_omitMessageNames ? '' : 'atakmap.commoncommo.protobuf.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'xmlDetail', protoName: 'xmlDetail')
    ..aOM<$0.Contact>(2, _omitFieldNames ? '' : 'contact', subBuilder: $0.Contact.create)
    ..aOM<$1.Group>(3, _omitFieldNames ? '' : 'group', subBuilder: $1.Group.create)
    ..aOM<$2.PrecisionLocation>(4, _omitFieldNames ? '' : 'precisionLocation', protoName: 'precisionLocation', subBuilder: $2.PrecisionLocation.create)
    ..aOM<$3.Status>(5, _omitFieldNames ? '' : 'status', subBuilder: $3.Status.create)
    ..aOM<$4.Takv>(6, _omitFieldNames ? '' : 'takv', subBuilder: $4.Takv.create)
    ..aOM<$5.Track>(7, _omitFieldNames ? '' : 'track', subBuilder: $5.Track.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Detail clone() => Detail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Detail copyWith(void Function(Detail) updates) => super.copyWith((message) => updates(message as Detail)) as Detail;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Detail create() => Detail._();
  Detail createEmptyInstance() => create();
  static $pb.PbList<Detail> createRepeated() => $pb.PbList<Detail>();
  @$core.pragma('dart2js:noInline')
  static Detail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Detail>(create);
  static Detail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get xmlDetail => $_getSZ(0);
  @$pb.TagNumber(1)
  set xmlDetail($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasXmlDetail() => $_has(0);
  @$pb.TagNumber(1)
  void clearXmlDetail() => clearField(1);

  /// `<contact>`
  @$pb.TagNumber(2)
  $0.Contact get contact => $_getN(1);
  @$pb.TagNumber(2)
  set contact($0.Contact v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContact() => $_has(1);
  @$pb.TagNumber(2)
  void clearContact() => clearField(2);
  @$pb.TagNumber(2)
  $0.Contact ensureContact() => $_ensure(1);

  /// <__group>
  @$pb.TagNumber(3)
  $1.Group get group => $_getN(2);
  @$pb.TagNumber(3)
  set group($1.Group v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasGroup() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroup() => clearField(3);
  @$pb.TagNumber(3)
  $1.Group ensureGroup() => $_ensure(2);

  /// `<precisionlocation>`
  @$pb.TagNumber(4)
  $2.PrecisionLocation get precisionLocation => $_getN(3);
  @$pb.TagNumber(4)
  set precisionLocation($2.PrecisionLocation v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPrecisionLocation() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrecisionLocation() => clearField(4);
  @$pb.TagNumber(4)
  $2.PrecisionLocation ensurePrecisionLocation() => $_ensure(3);

  /// `<status>`
  @$pb.TagNumber(5)
  $3.Status get status => $_getN(4);
  @$pb.TagNumber(5)
  set status($3.Status v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);
  @$pb.TagNumber(5)
  $3.Status ensureStatus() => $_ensure(4);

  /// `<takv>`
  @$pb.TagNumber(6)
  $4.Takv get takv => $_getN(5);
  @$pb.TagNumber(6)
  set takv($4.Takv v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasTakv() => $_has(5);
  @$pb.TagNumber(6)
  void clearTakv() => clearField(6);
  @$pb.TagNumber(6)
  $4.Takv ensureTakv() => $_ensure(5);

  /// <track>
  @$pb.TagNumber(7)
  $5.Track get track => $_getN(6);
  @$pb.TagNumber(7)
  set track($5.Track v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasTrack() => $_has(6);
  @$pb.TagNumber(7)
  void clearTrack() => clearField(7);
  @$pb.TagNumber(7)
  $5.Track ensureTrack() => $_ensure(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
