//
//  Generated code. Do not modify.
//  source: takcontrol.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// TAK Protocol control message
/// This specifies to a recipient what versions
/// of protocol elements this sender supports during
/// decoding.
class TakControl extends $pb.GeneratedMessage {
  factory TakControl({
    $core.int? minProtoVersion,
    $core.int? maxProtoVersion,
    $core.String? contactUid,
  }) {
    final $result = create();
    if (minProtoVersion != null) {
      $result.minProtoVersion = minProtoVersion;
    }
    if (maxProtoVersion != null) {
      $result.maxProtoVersion = maxProtoVersion;
    }
    if (contactUid != null) {
      $result.contactUid = contactUid;
    }
    return $result;
  }
  TakControl._() : super();
  factory TakControl.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TakControl.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TakControl', package: const $pb.PackageName(_omitMessageNames ? '' : 'atakmap.commoncommo.protobuf.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'minProtoVersion', $pb.PbFieldType.OU3, protoName: 'minProtoVersion')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'maxProtoVersion', $pb.PbFieldType.OU3, protoName: 'maxProtoVersion')
    ..aOS(3, _omitFieldNames ? '' : 'contactUid', protoName: 'contactUid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TakControl clone() => TakControl()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TakControl copyWith(void Function(TakControl) updates) => super.copyWith((message) => updates(message as TakControl)) as TakControl;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TakControl create() => TakControl._();
  TakControl createEmptyInstance() => create();
  static $pb.PbList<TakControl> createRepeated() => $pb.PbList<TakControl>();
  @$core.pragma('dart2js:noInline')
  static TakControl getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TakControl>(create);
  static TakControl? _defaultInstance;

  /// Lowest TAK protocol version supported
  /// If not filled in (reads as 0), version 1 is assumed
  @$pb.TagNumber(1)
  $core.int get minProtoVersion => $_getIZ(0);
  @$pb.TagNumber(1)
  set minProtoVersion($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMinProtoVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinProtoVersion() => clearField(1);

  /// Highest TAK protocol version supported
  /// If not filled in (reads as 0), version 1 is assumed
  @$pb.TagNumber(2)
  $core.int get maxProtoVersion => $_getIZ(1);
  @$pb.TagNumber(2)
  set maxProtoVersion($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaxProtoVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxProtoVersion() => clearField(2);

  /// UID of the sending contact. May be omitted if
  /// this message is paired in a TakMessage with a CotEvent
  /// and the CotEvent contains this information
  @$pb.TagNumber(3)
  $core.String get contactUid => $_getSZ(2);
  @$pb.TagNumber(3)
  set contactUid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContactUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearContactUid() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
