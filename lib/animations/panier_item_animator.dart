import 'package:flutter/material.dart';
import 'package:appdemo/utilitaires/produit_adapter.dart';
import 'package:appdemo/utilitaires/constantes.dart';
import 'package:appdemo/app/components/cartitem_tile.dart';
import 'package:provider/provider.dart';
import 'package:appdemo/utilitaires/panier.dart';

class PanierItemAnimator extends StatelessWidget {
  final Produit produit;
  final Animation<double> animation;
  final VoidCallback onRemove;

  const PanierItemAnimator({
    super.key,
    required this.produit,
    required this.animation,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: CartItemTile(
        produit: produit,
        onDelete: () async {
          final confirm = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Confirmer la suppression"),
              content: Text("Retirer \"${produit.nom}\" du panier ?"),
              actions: [
                TextButton(
                  child: const Text("Annuler"),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                TextButton(
                  child: const Text(
                    "Supprimer",
                    style: TextStyle(color: AppConstants.homeColor),
                  ),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            ),
          );
          if (confirm == true) {
            onRemove();
            // ignore: use_build_context_synchronously
            context.read<PanierProvider>().retirer(produit);
          }
        },
      ),
    );
  }
}
