import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:web_adapte_teste/models/available_ads.dart';
import 'package:web_adapte_teste/models/game_announcement.dart';
import 'package:web_adapte_teste/models/user_announcement.dart';
import 'package:web_adapte_teste/pages/splash_page.dart';

void main() async {
  // inicializar o hive
  await Hive.initFlutter();

  // Registrar os Adapters que foram gerados automaticamente pelo hive
  Hive.registerAdapter(GameAnnouncementAdapter());
  Hive.registerAdapter(UserAnnouncementAdapter());

  // Abrir uma "Box"
  await Hive.openBox('appBox');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // inicializar com um provider
    return ChangeNotifierProvider(
      create: (context) => AvailableAds(),
      builder:
          (context, child) => const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashPage(),
          ),
    );
  }
}
