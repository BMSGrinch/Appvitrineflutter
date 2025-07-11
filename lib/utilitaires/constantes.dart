import 'package:flutter/material.dart';

class AppConstants {
  // Les couleurs

  static const Color mainColor = Color(0xFF000000); //Font d'écran
  static const Color homeColor = Color(0xFFB10303); //Couleur du splashscreen
  static const Color textColor = Color(0xFFF6F6F6); // Couleur du texte
  static const Color productColor = Color(0xFFD1D1D1);

  //Nom des  applications
  static const String appName = "App Demo"; // Nom de l'application
  static const String appDescription =
      "Application de démonstration"; // Description de l'application

  // Chemins des images
  static const String logoPath =
      "assets/images/logo_base_bms.png"; // Chemin du logo

  static const String productImagePath =
      "assets/images/product.png"; // Chemin de l'image du produit

  // Autres constantes
  static const double defaultPadding = 16.0; // Espacement par défaut
  static const double borderRadius = 8.0; // Rayon de bordure par défaut

  // Les réseaux sociaux
  static const String instagramUrl =
      "https://www.instagram.com/yourprofile"; // Lien vers Instagram
  static const String facebookUrl = "https://www.facebook.com/nike";
  static const String twitterUrl =
      "https://www.twitter.com/yourprofile"; // Lien vers Twitter
  static const String whatsappUrl =
      "https://wa.me/2250102530519?text="; // Lien vers WhatsApp (remplacez par votre numéro)
  //static const String whatappUrlpanier =
  //" whatsapp://send?phone=2250102530519&text=Hello";

  static const String emailUrl = "mailto:huileenpoudre@gmail.com";
  static const String tiktokUrl = "https://www.tiktok.com/@lecompte"; //

  //Mes boutons

  static const List<IconData> icons = [
    Icons.home,
    Icons.shopping_cart_sharp, // ton icône d'armoire
    Icons.add,
    Icons.favorite_border,
    Icons.person_outline,
  ];
}
