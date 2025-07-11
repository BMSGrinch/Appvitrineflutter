import 'package:appdemo/app/components/button_component.dart';
import 'package:appdemo/utilitaires/constantes.dart';
import 'package:appdemo/utilitaires/makefavorite.dart';
import 'package:appdemo/utilitaires/navigation_wrapper.dart';
import 'package:appdemo/utilitaires/panier.dart';
import 'package:appdemo/utilitaires/produit_adapter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final Produit? produit;

  const DetailPage({super.key, required this.produit});

  @override
  Widget build(BuildContext context) {
    final favorisProvider = Provider.of<FavorisProvider>(context);
    final isFavori = favorisProvider.isFavori(produit!);

    final panierProvider = Provider.of<PanierProvider>(context);

    return NavigationWrapper(
      title: produit?.nom ?? "Détails du Produit",
      selectedIndex: -1,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              produit?.image ?? AppConstants.productImagePath,
              width: double.infinity,
              height: 300,
            ),
            const SizedBox(height: 20),
            Text(
              produit?.nom ?? "Nom du Produit",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '${produit?.prix} FCFA',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              produit?.description ?? "Description du produit",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            ButtonComponent(
              label: "Ajouter au Panier",
              onPressed: () {
                panierProvider.ajouter(produit!);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${produit?.nom} ajouté au panier")),
                );
              },
            ),
            const SizedBox(height: 24),
            if (!isFavori)
              ButtonComponent(
                label: "Ajouter aux Favoris",
                onPressed: () {
                  favorisProvider.ajouter(produit!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${produit?.nom} ajouté aux favoris"),
                    ),
                  );
                },
              )
            else
              ButtonComponent(
                label: "Retirer aux Favoris",
                onPressed: () {
                  Provider.of<FavorisProvider>(
                    context,
                    listen: false,
                  ).retirer(produit!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${produit?.nom} retiré aux favoris"),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
