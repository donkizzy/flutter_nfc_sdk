import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_nfc_sdk_platform_interface.dart';

/// An implementation of [FlutterNfcSdkPlatform] that uses method channels.
class MethodChannelFlutterNfcSdk extends FlutterNfcSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_nfc_sdk');

  Future<void> initNFCFunction(String ndefMessage) async {
    try {
      await methodChannel.invokeMethod('initNFCFunction', {'ndefMessage': ndefMessage});
    } catch (e) {
      print('Failed to initialize NFC function: $e');
    }
  }

  Future<bool> supportNfcHceFeature() async {
    try {
      final bool isSupported = await methodChannel.invokeMethod('supportNfcHceFeature');
      return isSupported;
    } catch (e) {
      print('Failed to check NFC HCE feature support: $e');
      return false;
    }
  }

  Future<bool> checkNFCEnable() async {
    try {
      final bool isEnabled = await methodChannel.invokeMethod('checkNFCEnable');
      return isEnabled;
    } catch (e) {
      print('Failed to check if NFC is enabled: $e');
      return false;
    }
  }
}
