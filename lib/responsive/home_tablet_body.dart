import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_adapte_teste/components/game_announcement_tile.dart';
import 'package:web_adapte_teste/components/post_ad_dialog.dart';
import 'package:web_adapte_teste/models/available_ads.dart';
import 'package:web_adapte_teste/theme/app_colors.dart';

class HomeTabletBody extends StatelessWidget {
  HomeTabletBody({super.key});

  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 300,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 300,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _openPostAdDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => (const PostAdDialog()));
  }

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
                        // Logo
                        Center(child: Image.asset("assets/images/Logo.png")),
                        const SizedBox(height: 30),
                        // Encontre Seu duo
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Seu
                              const Text(
                                "Seu",
                                style: TextStyle(
                                  color: AppColors.textWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 64,
                                  fontFamily: "Inter",
                                ),
                              ),
                              // Duo
                              Text(
                                " duo ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 64,
                                  fontFamily: "Inter",
                                  foreground:
                                      Paint()
                                        ..shader = const LinearGradient(
                                          colors: <Color>[
                                            Color(0xFF9572FC),
                                            Color(0xFF43E7AD),
                                            Color(0xFFE1D55D),
                                          ],
                                          stops: [0.6, 0.8, 0.9],
                                        ).createShader(
                                          const Rect.fromLTWH(
                                            0.0,
                                            0.0,
                                            600.0,
                                            100.0,
                                          ),
                                        ),
                                ),
                              ),
                              // está aqui
                              const Text(
                                "está aqui",
                                style: TextStyle(
                                  color: AppColors.textWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 64,
                                  fontFamily: "Inter",
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        // Grid de Anuncios Disponiveis
                        LayoutBuilder(
                          builder: (context, constraints) {
                            // Setas laterais e lista de jogos
                            return Row(
                              children: [
                                IconButton(
                                  onPressed: _scrollLeft,
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: AppColors.textGray,
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 280,
                                    child: ListView.builder(
                                      controller: _scrollController,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          value.getAnnouncementList().length,
                                      itemBuilder: (context, index) {
                                        return GameAnnouncementTile(
                                          announcement:
                                              value
                                                  .getAnnouncementList()[index],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: _scrollRight,
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.textGray,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        // Card de "Não encontrou seu duo?"
                        Padding(
                          // Aqui controla a distancia das laterais de toda a borda
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 25,
                          ),
                          child: Container(
                            // Aqui é o padding do degradê
                            padding: const EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(8),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                colors: [
                                  Color(0xFF9572FC),
                                  Color(0xFF43E7AD),
                                  Color(0xFFE1D55D),
                                ],
                                stops: [0.0, 0.5, 1.0],
                              ),
                            ),
                            child: Container(
                              // distancia dos textos e do botão das paredes da caixa
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 24,
                              ),
                              // cor da caixa
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Não encontrou seu duo?",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textWhite,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "Publique um anúncio para encontrar novos players!",
                                        style: TextStyle(
                                          color: AppColors.textGray,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () => _openPostAdDialog(context),
                                    icon: const Icon(Icons.add),
                                    label: const Text("Publicar anúncio"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.margentButton,
                                      foregroundColor: AppColors.textWhite,
                                    ),
                                  ),
                                ],
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
