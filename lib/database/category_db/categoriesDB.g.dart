// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoriesDB.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryDBAdapter extends TypeAdapter<CategoryDB> {
  @override
  final int typeId = 1;

  @override
  CategoryDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryDB(
      categoryTitle: (fields[0] as Map).cast<dynamic, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoryDB obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.categoryTitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
