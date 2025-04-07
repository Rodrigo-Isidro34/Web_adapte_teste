import 'package:flutter/material.dart';
import 'package:web_adapte_teste/pages/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Fundo.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(child: Image.asset("assets/images/Logo.png")),
      ),
    );
  }
}
