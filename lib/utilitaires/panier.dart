import 'package:appdemo/utilitaires/constantes.dart';
import 'package:appdemo/utilitaires/produit_adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class PanierProvider extends ChangeNotifier {
  List<Produit> _panier = [];

  List<Produit> get panier => _panier;

  Future<void> _savePanier() async {
    final box = Hive.box<Produit>('panierBox');
    await box.clear(); // overwrite
    for (var produit in _panier) {
      await box.add(produit);
    }
  }

  Future<void> loadPanier(List<Produit> allProduits) async {
    final box = Hive.box<Produit>('panierBox');
    _panier = box.values.toList();
    notifyListeners();
  }

  bool isDansPanier(Produit produit) {
    return _panier.any((p) => p.id == produit.id);
  }

  void ajouter(Produit produit) {
    final index = _panier.indexWhere((p) => p.id == produit.id);
    if (index != -1) {
      _panier[index].quantite += 1;
    } else {
      _panier.add(produit);
    }
    _savePanier();
    notifyListeners();
  }

  void retirer(Produit produit) {
    _panier.removeWhere((p) => p.id == produit.id);
    _savePanier();
    notifyListeners();
  }

  void vider() {
    _panier.clear();
    _savePanier();
    notifyListeners();
  }

  void augmenterQuantite(Produit produit) {
    final index = _panier.indexWhere((p) => p.id == produit.id);
    if (index != -1) {
      _panier[index].quantite += 1;
      _savePanier();
      notifyListeners();
    }
  }

  void diminuerQuantite(Produit produit) {
    final index = _panier.indexWhere((p) => p.id == produit.id);
    if (index != -1 && _panier[index].quantite > 1) {
      _panier[index].quantite -= 1;
    } else {
      _panier.removeAt(index);
    }
    _savePanier();
    notifyListeners();
  }
}

Future<bool?> showDeleteConfirmation(BuildContext context, String nomProduit) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Confirmer la suppression"),
      content: Text("Retirer \"$nomProduit\" du panier ?"),
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
}
