# px-flutter

Mercado Pago's Unofficial Flutter checkout library

---
>Made with ❤️ by Ricardo Markiewicz // [@gazeria](https://twitter.com/gazeria).

## What is this?

Flutter implementation of [MercadoPago Mobile Checkout](https://www.mercadopago.com.ar/developers/es/guides/payments/mobile-checkout/introduction/)

## Before to start

This is a Work in progress project!, so please use with care and report the issues and feature request to our Github page. Thanks!

## Getting Started

* Create an account in MercadoPago, you may need to choose the country where you want to accept payments.
* Create an [Application](https://applications.mercadopago.com/)
* Go to the credentials page (the url may change depending the country, but looks like https://www.mercadopago.com/mla/account/credentials) and get the Public Key of the new app
** SECURITY WARNING: Do not use the Access Token, ClientID or Client Secret in your mobile application.
* Call your backend to create a Checkout Preference and get a PreferenceId
** TODO: Add more documentation about preferences
* In your Flutter code, call `MercadoPagoMobileCheckout.startCheckout()` to allow the user to pay
* Save the payment response into your database.

## Setup

### Android

Nothing special to do, just add the plugin and use it.

### iOS

At the moment we need to setup a UINavigationController manually because the one that Flutter provides do not work with MercadoPago px-ios.

You need to setup your root view controller as UINavigationController in your AppDelegate of the ios folder of your app:

```swift
// AppDelegate.swift

import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  var navigationController: UINavigationController?;

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Add this line before GeneratedPluginRegistrant
    let flutterViewController: FlutterViewController = window?.rootViewController as! FlutterViewController

    // This line is added by the Flutter App Generator
    GeneratedPluginRegistrant.register(with: self)

    // Add these lines after GeneratedPluginRegistrant
    self.navigationController = UINavigationController(rootViewController: flutterViewController);
    self.navigationController?.setNavigationBarHidden(true, animated: false);

    self.window = UIWindow(frame: UIScreen.main.bounds);
    self.window.rootViewController = self.navigationController;
    self.window.makeKeyAndVisible();
    // End of edit

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

## Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  mercado_pago_mobile_checkout: ^0.0.1
```

Add the following import to your Dart code:

```dart
import 'package:`mercado_pago_mobile_checkout`/mercado_pago_mobile_checkout.dart';
```

## F.A.Q.

TODO

## Need help?

Create an issue in https://github.com/Gazer/px-flutter