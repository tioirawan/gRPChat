///
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chat.pb.dart' as $0;
export 'chat.pb.dart';

class ChatClient extends $grpc.Client {
  static final _$sendMessage =
      $grpc.ClientMethod<$0.MessageRequest, $0.Message>(
          '/Chat/SendMessage',
          ($0.MessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Message.fromBuffer(value));
  static final _$streamMessages =
      $grpc.ClientMethod<$0.StreamMessageRequest, $0.Message>(
          '/Chat/StreamMessages',
          ($0.StreamMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Message.fromBuffer(value));

  ChatClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Message> sendMessage($0.MessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMessage, request, options: options);
  }

  $grpc.ResponseStream<$0.Message> streamMessages(
      $0.StreamMessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamMessages, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'Chat';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.MessageRequest, $0.Message>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MessageRequest.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StreamMessageRequest, $0.Message>(
        'StreamMessages',
        streamMessages_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.StreamMessageRequest.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
  }

  $async.Future<$0.Message> sendMessage_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MessageRequest> request) async {
    return sendMessage(call, await request);
  }

  $async.Stream<$0.Message> streamMessages_Pre($grpc.ServiceCall call,
      $async.Future<$0.StreamMessageRequest> request) async* {
    yield* streamMessages(call, await request);
  }

  $async.Future<$0.Message> sendMessage(
      $grpc.ServiceCall call, $0.MessageRequest request);
  $async.Stream<$0.Message> streamMessages(
      $grpc.ServiceCall call, $0.StreamMessageRequest request);
}
