// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_announcement.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAnnouncementAdapter extends TypeAdapter<UserAnnouncement> {
  @override
  final int typeId = 1;

  @override
  UserAnnouncement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAnnouncement(
      name: fields[0] as String,
      gameTime: fields[1] as String,
      availability: fields[2] as String,
      isCall: fields[3] as bool,
      discord: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserAnnouncement obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.gameTime)
      ..writeByte(2)
      ..write(obj.availability)
      ..writeByte(3)
      ..write(obj.isCall)
      ..writeByte(4)
      ..write(obj.discord);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAnnouncementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
