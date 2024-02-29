// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteListAdapter extends TypeAdapter<FavoriteList> {
  @override
  final int typeId = 3;

  @override
  FavoriteList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteList(
      productList: (fields[0] as List).cast<ProductModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.productList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
