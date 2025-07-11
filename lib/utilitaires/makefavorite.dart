import 'package:appdemo/utilitaires/produit_adapter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavorisProvider extends ChangeNotifier {
  final List<Produit> _favoris = [];

  List<Produit> get favoris => List.unmodifiable(_favoris);

  Future<void> _saveFavoris() async {
    final prefs = await SharedPreferences.getInstance();
    final ids = _favoris.map((p) => p.id.toString()).toList();
    await prefs.setStringList('favoris', ids);
  }

  Future<void> loadFavoris(List<Produit> allProduits) async {
    final prefs = await SharedPreferences.getInstance();
    final ids = prefs.getStringList('favoris') ?? [];
    _favoris
      ..clear()
      ..addAll(allProduits.where((p) => ids.contains(p.id.toString())));
    notifyListeners();
  }

  bool isFavori(Produit produit) {
    return _favoris.any((p) => p.id == produit.id);
  }

  void ajouter(Produit produit) {
    if (!isFavori(produit)) {
      _favoris.add(produit);
      _saveFavoris();
      notifyListeners();
    }
  }

  void retirer(Produit produit) {
    _favoris.removeWhere((p) => p.id == produit.id);
    _saveFavoris();
    notifyListeners();
  }

  void toggle(Produit produit) {
    isFavori(produit) ? ajouter(produit) : retirer(produit);
  }
}
