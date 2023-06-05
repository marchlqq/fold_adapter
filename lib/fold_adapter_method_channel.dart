import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'fold_adapter_platform_interface.dart';

/// An implementation of [FoldAdapterPlatform] that uses method channels.
class MethodChannelFoldAdapter extends FoldAdapterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('fold_adapter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
