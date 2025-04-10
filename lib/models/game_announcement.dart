import 'package:hive/hive.dart';
import 'user_announcement.dart';

part 'game_announcement.g.dart'; 

@HiveType(typeId: 0)
class GameAnnouncement extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String imagePath;

  @HiveField(2)
  List<UserAnnouncement> userAnnouncements;

  GameAnnouncement({
    required this.name,
    required this.imagePath,
    required this.userAnnouncements,
  });
}
