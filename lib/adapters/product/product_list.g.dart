// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductListAdapter extends TypeAdapter<ProductList> {
  @override
  final int typeId = 1;

  @override
  ProductList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductList(
      productList: (fields[0] as List).cast<ProductModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductList obj) {
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
      other is ProductListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
