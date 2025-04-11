import 'package:hive/hive.dart';
// para gerar arquivo do hive
part 'user_announcement.g.dart'; 

@HiveType(typeId: 1)
class UserAnnouncement extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String gameTime;

  @HiveField(2)
  String availability;

  @HiveField(3)
  bool isCall;

  @HiveField(4)
  String discord;

  UserAnnouncement({
    required this.name,
    required this.gameTime,
    required this.availability,
    required this.isCall,
    required this.discord,
  });
}
