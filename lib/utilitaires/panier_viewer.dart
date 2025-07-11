import 'package:appdemo/animations/panier_item_animator.dart';
import 'package:appdemo/utilitaires/panier.dart';
import 'package:appdemo/utilitaires/produit_adapter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanierViewer extends StatefulWidget {
  final List<Produit>? produitsFiltres;
  const PanierViewer({super.key, this.produitsFiltres});

  @override
  State<PanierViewer> createState() => _PanierViewerState();
}

class _PanierViewerState extends State<PanierViewer> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late List<Produit> _produits;

  @override
  void initState() {
    super.initState();
    _produits = List.from(
      widget.produitsFiltres ?? context.read<PanierProvider>().panier,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final panierActuel =
        widget.produitsFiltres ?? context.watch<PanierProvider>().panier;

    if (panierActuel.length < _produits.length) {
      final index = _produits.indexWhere((p) => !panierActuel.contains(p));
      final removedItem = _produits.removeAt(index);
      _listKey.currentState?.removeItem(
        index,
        (context, animation) => _buildItem(removedItem, animation),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_produits.isEmpty) {
      return const Center(child: Text("Votre panier est vide"));
    }

    return AnimatedList(
      key: _listKey,
      initialItemCount: _produits.length,
      itemBuilder: (context, index, animation) {
        return _buildItem(_produits[index], animation);
      },
    );
  }

  Widget _buildItem(Produit produit, Animation<double> animation) {
    return PanierItemAnimator(
      produit: produit,
      animation: animation,
      onRemove: () {
        final index = _produits.indexOf(produit);
        setState(() {
          _produits.removeAt(index);
        });
        _listKey.currentState?.removeItem(
          index,
          (context, animation) => _buildItem(produit, animation),
        );
      },
    );
  }
}
