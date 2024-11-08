import 'package:clicker/clicker_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const ClickerApp());
}

