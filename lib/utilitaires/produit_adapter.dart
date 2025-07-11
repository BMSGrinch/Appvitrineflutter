import 'package:hive/hive.dart';
part 'produit_adapter.g.dart';

@HiveType(typeId: 0)
class Produit extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String nom;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final double prix;

  @HiveField(4)
  final String image;

  @HiveField(5)
  final String? categorie;

  @HiveField(6)
  int quantite;

  Produit({
    required this.id,
    required this.nom,
    required this.description,
    required this.prix,
    required this.image,
    required this.categorie,
    required this.quantite,
  });
}
