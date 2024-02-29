// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryListAdapter extends TypeAdapter<HistoryList> {
  @override
  final int typeId = 2;

  @override
  HistoryList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryList(
      productList: (fields[0] as List).cast<ProductModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, HistoryList obj) {
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
      other is HistoryListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
