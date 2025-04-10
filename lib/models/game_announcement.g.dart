// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_announcement.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameAnnouncementAdapter extends TypeAdapter<GameAnnouncement> {
  @override
  final int typeId = 0;

  @override
  GameAnnouncement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameAnnouncement(
      name: fields[0] as String,
      imagePath: fields[1] as String,
      userAnnouncements: (fields[2] as List).cast<UserAnnouncement>(),
    );
  }

  @override
  void write(BinaryWriter writer, GameAnnouncement obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imagePath)
      ..writeByte(2)
      ..write(obj.userAnnouncements);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameAnnouncementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
