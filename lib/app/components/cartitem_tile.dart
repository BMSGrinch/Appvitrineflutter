import 'package:appdemo/utilitaires/constantes.dart';
import 'package:appdemo/utilitaires/panier.dart';
import 'package:appdemo/utilitaires/produit_adapter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemTile extends StatelessWidget {
  final Produit produit;
  final VoidCallback onDelete;

  const CartItemTile({
    super.key,
    required this.produit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppConstants.textColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(produit.image, width: 60, height: 60, fit: BoxFit.cover),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  produit.nom,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${(produit.prix * produit.quantite).toStringAsFixed(2)} FCFA",
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        context.read<PanierProvider>().diminuerQuantite(
                          produit,
                        );
                      },
                    ),
                    Text(
                      '${produit.quantite}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () {
                        context.read<PanierProvider>().augmenterQuantite(
                          produit,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: AppConstants.homeColor),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
