import 'package:appdemo/app/components/homevideo_intro.dart';
import 'package:appdemo/utilitaires/constantes.dart';
import 'package:appdemo/app/components/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [],
        fontsColor: AppConstants.mainColor,
        textColor: AppConstants.textColor,
        title: AppConstants.appName,
        logoPath: AppConstants.logoPath,
      ),
      body: const HomevideoIntro(),
    );
  }
}
