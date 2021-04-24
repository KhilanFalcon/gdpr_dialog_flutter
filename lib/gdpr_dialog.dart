import 'package:flutter/services.dart';

class GdprDialog {
  static const MethodChannel _channel = const MethodChannel('gdpr_dialog');

  // Create singltone class
  GdprDialog._();
  static final GdprDialog instance = GdprDialog._();

  // Show dialog with asking for get users info for add
  Future<bool> showDialog(String publisherId, String privacyUrl,
      {bool isForTest = false, String testDeviceId = ''}) async {
    return await _channel.invokeMethod('gdpr.activate', <String, dynamic>{
          'publisherId': publisherId,
          'privacyUrl': privacyUrl,
          'isForTest': isForTest,
          'testDeviceId': testDeviceId,
        }) ??
        false;
  }

  // Set consent status to UNKNOWN
  Future<bool> setConsentToUnknown() async {
    return await _channel.invokeMethod('gdpr.setUnknown', []) ?? false;
  }

  // Set consent status to NON PERSONAL
  Future<bool> setConsentToNonPersonal() async {
    return await _channel.invokeMethod('gdpr.setConsentToNonPersonal', []) ?? false;
  }

  // Set consent status to PERSONAL
  Future<bool> setConsentToPersonal() async {
    return await _channel.invokeMethod('gdpr.setConsentToPersonal', []) ?? false;
  }

  // Get consent status
  Future<String> getConsentStatus() async {
    final String result = await _channel.invokeMethod('gdpr.getConsentStatus', []) ?? '';
    return result;
  }

  // Is user inEEA
  Future<bool> isRequestLocationInEea(String publisherId) async {
    return await _channel.invokeMethod('gdpr.requestLocation', <String, dynamic>{'publisherId': publisherId}) ?? false;
  }
}
