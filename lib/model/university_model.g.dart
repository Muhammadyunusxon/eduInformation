// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UniverResponseAdapter extends TypeAdapter<UniverResponse> {
  @override
  final int typeId = 0;

  @override
  UniverResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UniverResponse(
      univers: (fields[1] as List).cast<University>(),
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UniverResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.univers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniverResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UniversityAdapter extends TypeAdapter<University> {
  @override
  final int typeId = 1;

  @override
  University read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return University(
      domains: (fields[0] as List?)?.cast<String>(),
      country: fields[1] as String?,
      alphaTwoCode: fields[2] as String?,
      webPages: (fields[3] as List?)?.cast<String>(),
      stateProvince: fields[4] as dynamic,
      name: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, University obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.domains)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.alphaTwoCode)
      ..writeByte(3)
      ..write(obj.webPages)
      ..writeByte(4)
      ..write(obj.stateProvince)
      ..writeByte(5)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniversityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
