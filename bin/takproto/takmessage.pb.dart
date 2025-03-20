//
//  Generated code. Do not modify.
//  source: takmessage.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'cotevent.pb.dart' as $8;
import 'takcontrol.pb.dart' as $7;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Top level message sent for TAK Messaging Protocol Version 1.
class TakMessage extends $pb.GeneratedMessage {
  factory TakMessage({
    $7.TakControl? takControl,
    $8.CotEvent? cotEvent,
  }) {
    final $result = create();
    if (takControl != null) {
      $result.takControl = takControl;
    }
    if (cotEvent != null) {
      $result.cotEvent = cotEvent;
    }
    return $result;
  }
  TakMessage._() : super();
  factory TakMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TakMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TakMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'atakmap.commoncommo.protobuf.v1'), createEmptyInstance: create)
    ..aOM<$7.TakControl>(1, _omitFieldNames ? '' : 'takControl', protoName: 'takControl', subBuilder: $7.TakControl.create)
    ..aOM<$8.CotEvent>(2, _omitFieldNames ? '' : 'cotEvent', protoName: 'cotEvent', subBuilder: $8.CotEvent.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TakMessage clone() => TakMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TakMessage copyWith(void Function(TakMessage) updates) => super.copyWith((message) => updates(message as TakMessage)) as TakMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TakMessage create() => TakMessage._();
  TakMessage createEmptyInstance() => create();
  static $pb.PbList<TakMessage> createRepeated() => $pb.PbList<TakMessage>();
  @$core.pragma('dart2js:noInline')
  static TakMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TakMessage>(create);
  static TakMessage? _defaultInstance;

  /// Optional - if omitted, continue using last reported control
  /// information
  @$pb.TagNumber(1)
  $7.TakControl get takControl => $_getN(0);
  @$pb.TagNumber(1)
  set takControl($7.TakControl v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTakControl() => $_has(0);
  @$pb.TagNumber(1)
  void clearTakControl() => clearField(1);
  @$pb.TagNumber(1)
  $7.TakControl ensureTakControl() => $_ensure(0);

  /// Optional - if omitted, no event data in this message
  @$pb.TagNumber(2)
  $8.CotEvent get cotEvent => $_getN(1);
  @$pb.TagNumber(2)
  set cotEvent($8.CotEvent v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCotEvent() => $_has(1);
  @$pb.TagNumber(2)
  void clearCotEvent() => clearField(2);
  @$pb.TagNumber(2)
  $8.CotEvent ensureCotEvent() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
