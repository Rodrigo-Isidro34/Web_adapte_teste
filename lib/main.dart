import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_adapte_teste/models/available_ads.dart';
import 'package:web_adapte_teste/pages/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
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
