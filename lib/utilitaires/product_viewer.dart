import 'package:appdemo/app/components/myproductcart.dart';
import 'package:appdemo/utilitaires/constantes.dart';
import 'package:appdemo/utilitaires/produit_adapter.dart';
import 'package:appdemo/utilitaires/produits.dart';
import 'package:flutter/material.dart';

class ProductViewer extends StatelessWidget {
  final String selectedCategorie;
  final List<Produit>? produits;
  final bool isFavorisPage;

  const ProductViewer({
    super.key,
    required this.selectedCategorie,
    required this.produits,
    required this.isFavorisPage,
  });

  @override
  Widget build(BuildContext context) {
    final allProduits = produits ?? ProduitsData.produits;
    final filteredProduits = allProduits
        .where(
          (produit) =>
              selectedCategorie == "Tous" ||
              produit.categorie == selectedCategorie,
        )
        .toList();
    return Container(
      color: AppConstants.textColor,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            selectedCategorie,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredProduits.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.60,
            ),
            itemBuilder: (context, index) {
              final produit = filteredProduits[index];
              return MyProductCart(
                produit: produit,
                showRemoveFavorite: isFavorisPage,
              );
            },
          ),
        ],
      ),
    );
  }
}
