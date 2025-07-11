import 'package:appdemo/app/components/categories_menu.dart';
import 'package:appdemo/utilitaires/categories.dart';
import 'package:appdemo/utilitaires/makefavorite.dart';
import 'package:appdemo/utilitaires/navigation_wrapper.dart';
import 'package:appdemo/utilitaires/product_viewer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavorisPage extends StatefulWidget {
  const FavorisPage({super.key});

  @override
  State<FavorisPage> createState() => _FavorisPageState();
}

class _FavorisPageState extends State<FavorisPage> {
  String selectedCategorie = CategoriesData.categories[0];

  @override
  Widget build(BuildContext context) {
    final favoris = context
        .watch<FavorisProvider>()
        .favoris
        .where(
          (produit) =>
              selectedCategorie == "Tous" ||
              produit.categorie == selectedCategorie,
        )
        .toList();

    return NavigationWrapper(
      title: "Favoris",
      selectedIndex: 3,
      body: Column(
        children: [
          CategoryMenu(
            categories: CategoriesData.categories,
            selectedCategorie: selectedCategorie,
            onCategorySelected: (String categorie) {
              setState(() {
                selectedCategorie = categorie;
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ProductViewer(
                produits: favoris,
                selectedCategorie: selectedCategorie,
                isFavorisPage: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
