import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_nfc_sdk/flutter_nfc_sdk.dart';
import 'package:flutter_nfc_sdk/flutter_nfc_sdk_platform_interface.dart';
import 'package:flutter_nfc_sdk/flutter_nfc_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterNfcSdkPlatform
    with MockPlatformInterfaceMixin
    implements FlutterNfcSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterNfcSdkPlatform initialPlatform = FlutterNfcSdkPlatform.instance;

  test('$MethodChannelFlutterNfcSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterNfcSdk>());
  });

  test('getPlatformVersion', () async {
    FlutterNfcSdk flutterNfcSdkPlugin = FlutterNfcSdk();
    MockFlutterNfcSdkPlatform fakePlatform = MockFlutterNfcSdkPlatform();
    FlutterNfcSdkPlatform.instance = fakePlatform;

    expect(await flutterNfcSdkPlugin.getPlatformVersion(), '42');
  });
}
