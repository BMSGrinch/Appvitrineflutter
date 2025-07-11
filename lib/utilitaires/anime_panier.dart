import 'package:appdemo/app/components/cartitem_tile.dart';
import 'package:appdemo/utilitaires/produit_adapter.dart';
import 'package:flutter/material.dart';

class AnimePanier extends StatefulWidget {
  final List<Produit> produits;
  final void Function(Produit produit) onDelete;

  const AnimePanier({
    super.key,
    required this.produits,
    required this.onDelete,
  });

  @override
  State<AnimePanier> createState() => _AnimePanierState();
}

class _AnimePanierState extends State<AnimePanier> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: widget.produits.length,
      itemBuilder: (context, index, animation) {
        final produit = widget.produits[index];
        return SizeTransition(
          sizeFactor: animation,
          child: CartItemTile(
            produit: produit,
            onDelete: () {
              _listKey.currentState!.removeItem(
                index,
                (context, animation) => SizeTransition(
                  sizeFactor: animation,
                  child: CartItemTile(produit: produit, onDelete: () {}),
                ),
              );
              widget.onDelete(produit);
            },
          ),
        );
      },
    );
  }
}
