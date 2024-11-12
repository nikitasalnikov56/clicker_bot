import 'dart:developer';

import 'package:clicker/clicker_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  try {
    if (TelegramWebApp.instance.isSupported) {
      TelegramWebApp.instance.ready();
      Future.delayed(
          const Duration(seconds: 1), TelegramWebApp.instance.expand);
    }else {
      log("Telegram Web App не поддерживается в этом окружении.");
    }
  } catch (e) {
    log("Error happened in Flutter while loading Telegram $e");
    await Future.delayed(const Duration(milliseconds: 200));
    main();
    return;
  }

  FlutterError.onError = (details) {
    log("Flutter error happened: $details");
  };
  // print(Uri.base);
  runApp(const ClickerApp());
}
