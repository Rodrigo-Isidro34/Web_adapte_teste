import 'package:flutter/material.dart';
import 'package:web_adapte_teste/components/game_announcement_tile.dart';
import 'package:web_adapte_teste/models/game_announcement.dart';
import 'package:web_adapte_teste/models/available_ads.dart';
import 'package:provider/provider.dart';
import 'package:web_adapte_teste/theme/app_colors.dart';

class HomeSmartphoneBody extends StatefulWidget {
  const HomeSmartphoneBody({super.key});

  @override
  State<HomeSmartphoneBody> createState() => _HomePageState();
}

class _HomePageState extends State<HomeSmartphoneBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AvailableAds>(
      builder:
          (context, value, child) => Scaffold(
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
                        const SizedBox(height: 120),
                        // Encontre seu duo!
                        const Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Text(
                            "Encontre seu duo!",
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              fontFamily: "Inter",
                            ),
                          ),
                        ),

                        // Selecione o game que deseja jogar...
                        const Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Text(
                            "Selecione o game que deseja jogar...",
                            style: TextStyle(
                              color: AppColors.textGray,
                              fontSize: 16,
                              fontFamily: "Inter",
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Lista ou Grid de Anuncios Disponiveis
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return SizedBox(
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
                            );
                          },
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
