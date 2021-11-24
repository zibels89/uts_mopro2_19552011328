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
  void _pindahKeDashboard() {
    Navigator.of(context).pushReplacementNamed('dashboard');
  }

  Timer startTimer() {
    Duration _durasi = const Duration(seconds: 3);
    return Timer(_durasi, _pindahKeDashboard);
  }
}
