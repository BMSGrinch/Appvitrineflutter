import 'package:appdemo/utilitaires/produit_adapter.dart';

String generateCommandeMessage(List<Produit> panier) {
  if (panier.isEmpty) return "Aucune commande pour le moment.";
  final buffer = StringBuffer("Bonjour , Je souhaite passer la commande:\n");

  for (var produit in panier) {
    buffer.writeln("-${produit.nom} x ${produit.quantite}");
  }

  buffer.write(
    "\nMerci de me confirmer la disponibilité et les modalités de livraison.",
  );
  return buffer.toString();
}
