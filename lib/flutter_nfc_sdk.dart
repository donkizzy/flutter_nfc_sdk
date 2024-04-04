
import 'flutter_nfc_sdk_platform_interface.dart';

class FlutterNfcSdk {
  Future<String?> getPlatformVersion() {
    return FlutterNfcSdkPlatform.instance.getPlatformVersion();
  }
}
