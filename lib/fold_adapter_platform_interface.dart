import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fold_adapter_method_channel.dart';

abstract class FoldAdapterPlatform extends PlatformInterface {
  /// Constructs a FoldAdapterPlatform.
  FoldAdapterPlatform() : super(token: _token);

  static final Object _token = Object();

  static FoldAdapterPlatform _instance = MethodChannelFoldAdapter();

  /// The default instance of [FoldAdapterPlatform] to use.
  ///
  /// Defaults to [MethodChannelFoldAdapter].
  static FoldAdapterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FoldAdapterPlatform] when
  /// they register themselves.
  static set instance(FoldAdapterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
