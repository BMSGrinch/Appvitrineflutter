import 'package:appdemo/pages/detailpage.dart';
import 'package:appdemo/utilitaires/constantes.dart';
import 'package:appdemo/utilitaires/produit_adapter.dart';
import 'package:flutter/material.dart';

class MyProductCart extends StatelessWidget {
  final Produit produit;
  final bool showRemoveFavorite;
  const MyProductCart({
    super.key,
    required this.produit,
    this.showRemoveFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(produit: produit)),
        );
      },

      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: AppConstants.productColor,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                produit.image,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),
              Text(
                produit.nom,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                '${produit.prix} FCFA',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
