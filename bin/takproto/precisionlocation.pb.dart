//
//  Generated code. Do not modify.
//  source: precisionlocation.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// All items are required unless otherwise noted!
/// "required" means if they are missing on send, the conversion
/// to the message format will be rejected and fall back to opaque
/// XML representation
class PrecisionLocation extends $pb.GeneratedMessage {
  factory PrecisionLocation({
    $core.String? geopointsrc,
    $core.String? altsrc,
  }) {
    final $result = create();
    if (geopointsrc != null) {
      $result.geopointsrc = geopointsrc;
    }
    if (altsrc != null) {
      $result.altsrc = altsrc;
    }
    return $result;
  }
  PrecisionLocation._() : super();
  factory PrecisionLocation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PrecisionLocation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PrecisionLocation', package: const $pb.PackageName(_omitMessageNames ? '' : 'atakmap.commoncommo.protobuf.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'geopointsrc')
    ..aOS(2, _omitFieldNames ? '' : 'altsrc')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PrecisionLocation clone() => PrecisionLocation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PrecisionLocation copyWith(void Function(PrecisionLocation) updates) => super.copyWith((message) => updates(message as PrecisionLocation)) as PrecisionLocation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrecisionLocation create() => PrecisionLocation._();
  PrecisionLocation createEmptyInstance() => create();
  static $pb.PbList<PrecisionLocation> createRepeated() => $pb.PbList<PrecisionLocation>();
  @$core.pragma('dart2js:noInline')
  static PrecisionLocation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PrecisionLocation>(create);
  static PrecisionLocation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get geopointsrc => $_getSZ(0);
  @$pb.TagNumber(1)
  set geopointsrc($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGeopointsrc() => $_has(0);
  @$pb.TagNumber(1)
  void clearGeopointsrc() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get altsrc => $_getSZ(1);
  @$pb.TagNumber(2)
  set altsrc($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAltsrc() => $_has(1);
  @$pb.TagNumber(2)
  void clearAltsrc() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
