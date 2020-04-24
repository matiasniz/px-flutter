import 'dart:async';

import 'package:flutter/services.dart';

class MercadoPagoMobileCheckout {
  static const MethodChannel _channel =
      const MethodChannel('mercado_pago_mobile_checkout');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<Map<String, dynamic>> startCheckout(
    String publicKey,
    String preferenceId,
  ) async {
    Map<String, dynamic> result = await _channel.invokeMapMethod(
      'startCheckout',
      {
        "publicKey": publicKey,
        "preferenceId": preferenceId,
      },
    );
    return result;
  }
}
