import 'package:flutter/material.dart';
import 'package:web_adapte_teste/components/game_announcement_tile.dart';
import 'package:web_adapte_teste/models/game_announcement.dart';
import 'package:web_adapte_teste/models/available_ads.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AvailableAds>(
      builder:
          (context, value, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
            ),
            extendBodyBehindAppBar: true,
            // background
            body: SizedBox.expand(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Fundo.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        // Logo
                        Center(child: Image.asset("assets/images/Logo.png")),
                        const SizedBox(height: 50),
                        // Encontre seu duo!
                        const Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Text(
                            "Encontre seu duo!",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              fontFamily: "Inter",
                            ),
                          ),
                        ),

                        // Selecione o game que deseja jogar...
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            "Selecione o game que deseja jogar...",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 16,
                              fontFamily: "Inter",
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Lista de Anuncios Disponiveis
                        LayoutBuilder(
                          builder:
                              (context, constraints) => SizedBox(
                                // fazer com base no tamanho do dispositivo
                                height: constraints.maxHeight > 400 ? 370 : 180,
                                child: ListView.builder(
                                  itemCount: value.getAnnouncementList().length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    GameAnnouncement announcement =
                                        value.getAnnouncementList()[index];
                                    return GameAnnouncementTile(
                                      announcement: announcement,
                                    );
                                  },
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
