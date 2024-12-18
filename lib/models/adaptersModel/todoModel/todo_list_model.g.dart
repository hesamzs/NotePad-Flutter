// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoListModelAdapter extends TypeAdapter<ToDoListModel> {
  @override
  final int typeId = 2;

  @override
  ToDoListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoListModel(
      title: fields[0] as String,
      isChecked: fields[1] as bool,
      date: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ToDoListModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.isChecked)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ToDoListModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
