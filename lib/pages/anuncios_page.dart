import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_adapte_teste/components/user_announcement_tile.dart';
import 'package:web_adapte_teste/models/available_ads.dart';
import 'package:web_adapte_teste/models/game_announcement.dart';
import 'package:web_adapte_teste/models/user_announcement.dart';
import 'package:web_adapte_teste/theme/app_colors.dart';

class AnunciosPage extends StatelessWidget {
  final GameAnnouncement gameAnnouncement;
  const AnunciosPage({super.key, required this.gameAnnouncement});

  @override
  Widget build(BuildContext context) {
    return Consumer<AvailableAds>(
      builder:
          (context, value, child) => Scaffold(
            // AppBar diferente da home
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: AppColors.textWhite),
              centerTitle: true,
              title: Image.asset("assets/images/Logo.png", height: 40),
            ),
            extendBodyBehindAppBar: true,
            // background
            body: SizedBox.expand(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Fundo_tablet.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        // Imagem do jogo
                        Center(
                          child: Container(
                            height: 160,
                            width: 310,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(100),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                gameAnnouncement.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        // Nome do jogo encima
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            gameAnnouncement.name,
                            style: const TextStyle(
                              fontFamily: "Inter",
                              color: AppColors.textWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),

                        // Conecte-se e comece a jogar!
                        const Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Text(
                            "Conecte-se e comece a jogar!",
                            style: TextStyle(
                              color: AppColors.textGray,
                              fontSize: 16,
                              fontFamily: "Inter",
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Lista de usuarios que anunciaram
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: LayoutBuilder(
                            builder:
                                (context, constraints) =>
                                // mostrar em lista horizontal
                                SizedBox(
                                  height:
                                      constraints.maxHeight > 400 ? 370 : 180,
                                  child: ListView.builder(
                                    itemCount:
                                        gameAnnouncement
                                            .userAnnouncements
                                            .length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      UserAnnouncement announcement =
                                          gameAnnouncement
                                              .userAnnouncements[index];
                                      return UserAnnouncementTile(
                                        userAnnouncement: announcement,
                                      );
                                    },
                                  ),
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
