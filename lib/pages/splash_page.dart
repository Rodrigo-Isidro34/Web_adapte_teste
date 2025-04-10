import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:web_adapte_teste/data/database.dart';
import 'package:web_adapte_teste/models/available_ads.dart';
import 'package:web_adapte_teste/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _myBox = Hive.box("appBox");

  DataBase db = DataBase();

  @override
  void initState() {
    super.initState();

    final adsProvider = Provider.of<AvailableAds>(context, listen: false);

    if (_myBox.get("GAMEANNOUNCEMENTS") == null) {
      adsProvider.initiateFistData();
    } else {
      adsProvider.loadData();
    }

    // Espera 1 segundo e navega para a HomePage
    Future.delayed(const Duration(seconds: 1), () {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Fundo_tablet.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(child: Image.asset("assets/images/Logo.png")),
    );
  }
}
