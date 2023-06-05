import 'package:flutter_test/flutter_test.dart';
import 'package:fold_adapter/fold_adapter.dart';
import 'package:fold_adapter/fold_adapter_platform_interface.dart';
import 'package:fold_adapter/fold_adapter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFoldAdapterPlatform
    with MockPlatformInterfaceMixin
    implements FoldAdapterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FoldAdapterPlatform initialPlatform = FoldAdapterPlatform.instance;

  test('$MethodChannelFoldAdapter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFoldAdapter>());
  });

  test('getPlatformVersion', () async {
    FoldAdapter foldAdapterPlugin = FoldAdapter();
    MockFoldAdapterPlatform fakePlatform = MockFoldAdapterPlatform();
    FoldAdapterPlatform.instance = fakePlatform;

    expect(await foldAdapterPlugin.getPlatformVersion(), '42');
  });
}
