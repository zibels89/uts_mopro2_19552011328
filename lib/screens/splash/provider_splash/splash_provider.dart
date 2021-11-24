import 'dart:async';
import 'package:flutter/material.dart';

/**
@author Ahmad Fauzy Khamarullah - 19552011328 - TIF RM 19 CID
 */

///for doc comments

class SplashProvider with ChangeNotifier {
  final BuildContext context;

  SplashProvider(this.context) {
    startTimer();
  }
  void _pindahKeMenu() {
    Navigator.of(context).pushReplacementNamed('menu');
  }

  Timer startTimer() {
    Duration _durasi = const Duration(seconds: 3);
    return Timer(_durasi, _pindahKeMenu);
  }
}
