// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produit_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProduitAdapter extends TypeAdapter<Produit> {
  @override
  final int typeId = 0;

  @override
  Produit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Produit(
      id: fields[0] as String,
      nom: fields[1] as String,
      description: fields[2] as String,
      prix: fields[3] as double,
      image: fields[4] as String,
      categorie: fields[5] as String?,
      quantite: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Produit obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nom)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.prix)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.categorie)
      ..writeByte(6)
      ..write(obj.quantite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProduitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
