import 'package:appdemo/pages/favorispage.dart';
import 'package:appdemo/pages/home.dart';
import 'package:appdemo/pages/mainpage.dart';
import 'package:appdemo/pages/panierpage.dart';
import 'package:appdemo/utilitaires/makefavorite.dart';
import 'package:appdemo/utilitaires/panier.dart';
import 'package:appdemo/utilitaires/produits.dart';
import 'package:appdemo/utilitaires/produit_adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProduitAdapter());
  await Hive.openBox<Produit>('panierBox');
  runApp(const MyAppLoader());
}

class MyAppLoader extends StatelessWidget {
  const MyAppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final favorisProvider = FavorisProvider();
    final panierProvider = PanierProvider();
    final allProduits = ProduitsData.produits;

    return FutureBuilder(
      future: Future.wait([
        favorisProvider.loadFavoris(allProduits),
        panierProvider.loadPanier(allProduits),
      ]),

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<FavorisProvider>.value(
                value: favorisProvider,
              ),
              ChangeNotifierProvider<PanierProvider>.value(
                value: panierProvider,
              ),
            ],
            child: const MyApp(),
          );
        } else {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/accueil',
      routes: {
        '/accueil': (context) => const HomePage(),
        // Ajoute d'autres routes si nécessaire
        '/catalogue': (context) => const MainPage(),
        '/favoris': (context) => const FavorisPage(),
        '/panier': (context) => const PanierPage(),
      },

      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
    );
  }
}
