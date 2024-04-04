import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_nfc_sdk_platform_interface.dart';

/// An implementation of [FlutterNfcSdkPlatform] that uses method channels.
class MethodChannelFlutterNfcSdk extends FlutterNfcSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_nfc_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
