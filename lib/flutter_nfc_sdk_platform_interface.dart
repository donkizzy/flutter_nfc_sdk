import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_nfc_sdk_method_channel.dart';

abstract class FlutterNfcSdkPlatform extends PlatformInterface {
  /// Constructs a FlutterNfcSdkPlatform.
  FlutterNfcSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterNfcSdkPlatform _instance = MethodChannelFlutterNfcSdk();

  /// The default instance of [FlutterNfcSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterNfcSdk].
  static FlutterNfcSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterNfcSdkPlatform] when
  /// they register themselves.
  static set instance(FlutterNfcSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
