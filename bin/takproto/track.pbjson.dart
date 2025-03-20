//
//  Generated code. Do not modify.
//  source: track.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use trackDescriptor instead')
const Track$json = {
  '1': 'Track',
  '2': [
    {'1': 'speed', '3': 1, '4': 1, '5': 1, '10': 'speed'},
    {'1': 'course', '3': 2, '4': 1, '5': 1, '10': 'course'},
  ],
};

/// Descriptor for `Track`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackDescriptor = $convert.base64Decode(
    'CgVUcmFjaxIUCgVzcGVlZBgBIAEoAVIFc3BlZWQSFgoGY291cnNlGAIgASgBUgZjb3Vyc2U=');

