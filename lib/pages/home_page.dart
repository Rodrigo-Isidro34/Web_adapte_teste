import 'package:flutter/material.dart';
import 'package:web_adapte_teste/responsive/home_smartphone_body.dart';
import 'package:web_adapte_teste/responsive/home_tablet_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Verificando se é um tablet
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 1000;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      extendBodyBehindAppBar: true,
      body: isTablet ? HomeTabletBody() : const HomeSmartphoneBody(),
    );
  }
}
