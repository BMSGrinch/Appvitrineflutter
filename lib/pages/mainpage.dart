import 'package:appdemo/app/components/categories_menu.dart';
import 'package:appdemo/utilitaires/navigation_wrapper.dart';
import 'package:appdemo/utilitaires/product_viewer.dart';
import 'package:appdemo/utilitaires/categories.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String selectedCategorie = CategoriesData.categories[0];

  @override
  Widget build(BuildContext context) {
    return NavigationWrapper(
      title: "Catalogue",
      selectedIndex: -1,
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
                selectedCategorie: selectedCategorie,
                produits: null,
                isFavorisPage: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
