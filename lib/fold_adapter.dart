
import 'fold_adapter_platform_interface.dart';

class FoldAdapter {
  Future<String?> getPlatformVersion() {
    return FoldAdapterPlatform.instance.getPlatformVersion();
  }
}
