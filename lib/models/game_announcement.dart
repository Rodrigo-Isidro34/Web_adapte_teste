import 'package:web_adapte_teste/models/user_announcement.dart';

class GameAnnouncement {
  final String name;
  final String imagePath;
  final List<UserAnnouncement> userAnnouncements;
  GameAnnouncement({
    required this.name,
    required this.imagePath,
    required this.userAnnouncements,
  });
}
