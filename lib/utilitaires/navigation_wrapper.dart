import 'package:appdemo/animations/animation_page.dart';
import 'package:appdemo/app/components/custom_appbar.dart';
import 'package:appdemo/app/components/mybottom_navbar.dart';
import 'package:appdemo/pages/favorispage.dart';
import 'package:appdemo/pages/home.dart';
import 'package:appdemo/pages/mainpage.dart';
import 'package:appdemo/pages/panierpage.dart';
import 'package:appdemo/utilitaires/constantes.dart';
import 'package:appdemo/utilitaires/social_launcher.dart';
import 'package:flutter/material.dart';

class NavigationWrapper extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final String title;

  const NavigationWrapper({
    super.key,
    required this.title,
    required this.selectedIndex,
    required this.body,
  });

  //fonction d'intégration

  void _onNavBarTapped(BuildContext context, int index) {
    if (index == selectedIndex) return;
    // Si l'index sélectionné est déjà actif, on ne fait rien
    Widget? targetPage;
    switch (index) {
      case 0:
        targetPage = const HomePage();
        break;
      case 1:
        targetPage = const MainPage();
        break;
      case 3:
        targetPage = const FavorisPage();
    }
    if (targetPage != null) {
      Navigator.of(context).push(SlideFadeRoute(page: targetPage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        logoPath: AppConstants.logoPath,
        fontsColor: AppConstants.mainColor,
        textColor: AppConstants.textColor,
        actions: [
          IconButton(
            icon: Image.asset("assets/icons/bag.png"),
            onPressed: () {
              Navigator.of(context).push(SlideFadeRoute(page: PanierPage()));
            },
          ),
        ],
      ),
      body: body,
      bottomNavigationBar: MyBottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: (index) {
          if (index == 2) {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              builder: (context) => Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        openSocialLink(context, AppConstants.whatsappUrl);
                      },
                      icon: Image.asset(
                        "assets/icons/whatsapp.png",
                        width: 36,
                        height: 36,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        openSocialLink(context, AppConstants.instagramUrl);
                      },
                      icon: Image.asset(
                        "assets/icons/instagram.png",
                        width: 36,
                        height: 36,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        openSocialLink(context, AppConstants.facebookUrl);
                      },
                      icon: Image.asset(
                        "assets/icons/facebook.png",
                        width: 36,
                        height: 36,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        openSocialLink(context, AppConstants.emailUrl);
                      },
                      icon: Image.asset(
                        "assets/icons/mail.png",
                        width: 36,
                        height: 36,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            _onNavBarTapped(context, index);
          }
        },
      ),
    );
  }
}
