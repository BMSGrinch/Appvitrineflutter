import 'package:appdemo/app/components/button_component.dart';
import 'package:appdemo/app/components/categories_menu.dart';
import 'package:appdemo/helpers/message_generator.dart';
import 'package:appdemo/utilitaires/categories.dart';
import 'package:appdemo/utilitaires/constantes.dart';
import 'package:appdemo/utilitaires/navigation_wrapper.dart';
import 'package:appdemo/utilitaires/panier.dart';
import 'package:appdemo/utilitaires/panier_viewer.dart';
import 'package:appdemo/utilitaires/social_launcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanierPage extends StatefulWidget {
  const PanierPage({super.key});

  @override
  State<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  String selectedCategorie = CategoriesData.categories[0];

  @override
  Widget build(BuildContext context) {
    return NavigationWrapper(
      title: 'Mon Panier',
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
          Expanded(child: PanierViewer()),

          Consumer<PanierProvider>(
            builder: (context, panier, _) {
              if (panier.panier.isEmpty) return const SizedBox.shrink();

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ButtonComponent(
                  label: "Valider mon panier",
                  onPressed: () {
                    final message = Uri.encodeComponent(
                      generateCommandeMessage(panier.panier),
                    );
                    openSocialLink(context, AppConstants.whatsappUrl + message);
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
