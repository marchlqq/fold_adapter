import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fold_adapter/fold_adapter_method_channel.dart';

void main() {
  MethodChannelFoldAdapter platform = MethodChannelFoldAdapter();
  const MethodChannel channel = MethodChannel('fold_adapter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
