///
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use messageDescriptor instead')
const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'name', '3': 1, '4': 2, '5': 9, '10': 'name'},
    const {'1': 'id', '3': 2, '4': 2, '5': 5, '10': 'id'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode('CgdNZXNzYWdlEhIKBG5hbWUYASACKAlSBG5hbWUSDgoCaWQYAiACKAVSAmlkEhQKBWVtYWlsGAMgASgJUgVlbWFpbA==');
@$core.Deprecated('Use roomDescriptor instead')
const Room$json = const {
  '1': 'Room',
  '2': const [
    const {'1': 'id', '3': 2, '4': 2, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `Room`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomDescriptor = $convert.base64Decode('CgRSb29tEg4KAmlkGAIgAigFUgJpZA==');
@$core.Deprecated('Use messageRequestDescriptor instead')
const MessageRequest$json = const {
  '1': 'MessageRequest',
  '2': const [
    const {'1': 'room', '3': 1, '4': 2, '5': 11, '6': '.Room', '10': 'room'},
    const {'1': 'message', '3': 2, '4': 2, '5': 11, '6': '.Message', '10': 'message'},
  ],
};

/// Descriptor for `MessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageRequestDescriptor = $convert.base64Decode('Cg5NZXNzYWdlUmVxdWVzdBIZCgRyb29tGAEgAigLMgUuUm9vbVIEcm9vbRIiCgdtZXNzYWdlGAIgAigLMgguTWVzc2FnZVIHbWVzc2FnZQ==');
@$core.Deprecated('Use streamMessageRequestDescriptor instead')
const StreamMessageRequest$json = const {
  '1': 'StreamMessageRequest',
  '2': const [
    const {'1': 'room', '3': 1, '4': 2, '5': 11, '6': '.Room', '10': 'room'},
  ],
};

/// Descriptor for `StreamMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamMessageRequestDescriptor = $convert.base64Decode('ChRTdHJlYW1NZXNzYWdlUmVxdWVzdBIZCgRyb29tGAEgAigLMgUuUm9vbVIEcm9vbQ==');
