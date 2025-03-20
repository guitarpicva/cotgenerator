//
//  Generated code. Do not modify.
//  source: cotevent.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use cotEventDescriptor instead')
const CotEvent$json = {
  '1': 'CotEvent',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    {'1': 'access', '3': 2, '4': 1, '5': 9, '10': 'access'},
    {'1': 'qos', '3': 3, '4': 1, '5': 9, '10': 'qos'},
    {'1': 'opex', '3': 4, '4': 1, '5': 9, '10': 'opex'},
    {'1': 'uid', '3': 5, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'sendTime', '3': 6, '4': 1, '5': 4, '10': 'sendTime'},
    {'1': 'startTime', '3': 7, '4': 1, '5': 4, '10': 'startTime'},
    {'1': 'staleTime', '3': 8, '4': 1, '5': 4, '10': 'staleTime'},
    {'1': 'how', '3': 9, '4': 1, '5': 9, '10': 'how'},
    {'1': 'lat', '3': 10, '4': 1, '5': 1, '10': 'lat'},
    {'1': 'lon', '3': 11, '4': 1, '5': 1, '10': 'lon'},
    {'1': 'hae', '3': 12, '4': 1, '5': 1, '10': 'hae'},
    {'1': 'ce', '3': 13, '4': 1, '5': 1, '10': 'ce'},
    {'1': 'le', '3': 14, '4': 1, '5': 1, '10': 'le'},
    {'1': 'detail', '3': 15, '4': 1, '5': 11, '6': '.atakmap.commoncommo.protobuf.v1.Detail', '10': 'detail'},
  ],
};

/// Descriptor for `CotEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cotEventDescriptor = $convert.base64Decode(
    'CghDb3RFdmVudBISCgR0eXBlGAEgASgJUgR0eXBlEhYKBmFjY2VzcxgCIAEoCVIGYWNjZXNzEh'
    'AKA3FvcxgDIAEoCVIDcW9zEhIKBG9wZXgYBCABKAlSBG9wZXgSEAoDdWlkGAUgASgJUgN1aWQS'
    'GgoIc2VuZFRpbWUYBiABKARSCHNlbmRUaW1lEhwKCXN0YXJ0VGltZRgHIAEoBFIJc3RhcnRUaW'
    '1lEhwKCXN0YWxlVGltZRgIIAEoBFIJc3RhbGVUaW1lEhAKA2hvdxgJIAEoCVIDaG93EhAKA2xh'
    'dBgKIAEoAVIDbGF0EhAKA2xvbhgLIAEoAVIDbG9uEhAKA2hhZRgMIAEoAVIDaGFlEg4KAmNlGA'
    '0gASgBUgJjZRIOCgJsZRgOIAEoAVICbGUSPwoGZGV0YWlsGA8gASgLMicuYXRha21hcC5jb21t'
    'b25jb21tby5wcm90b2J1Zi52MS5EZXRhaWxSBmRldGFpbA==');

