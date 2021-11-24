import 'package:flutter/material.dart';
import 'package:uts_mopro2_19552011328/splashscreen/provider_splash/splash_provider.dart';
import 'package:provider/provider.dart';

/**
@author Ahmad Fauzy Khamarullah - 19552011328 - TIF RM 19 CID
 */

/// ini adalah splash

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashProvider(context),
      child: Consumer<SplashProvider>(
        builder: (_, splashProvider, __) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'aset/img/logo_splash.png',
                        width: 250,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Made With ',
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        Text(' | 19552011328 - ©2021'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
