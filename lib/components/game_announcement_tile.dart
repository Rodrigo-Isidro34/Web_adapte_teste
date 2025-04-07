import 'package:flutter/material.dart';
import 'package:web_adapte_teste/models/game_announcement.dart';
import 'package:web_adapte_teste/pages/anuncios_page.dart';

// ignore: must_be_immutable
class GameAnnouncementTile extends StatelessWidget {
  final GameAnnouncement announcement;
  const GameAnnouncementTile({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnunciosPage(gameAnnouncement: announcement),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              // foto
              AspectRatio(
                aspectRatio: 3 / 4,
                child: Image.asset(announcement.imagePath, fit: BoxFit.cover),
              ),

              // degradê preto com transparente
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black, Colors.transparent],
                    ),
                  ),
                ),
              ),

              // combo nome do jogo + quantidade de anúncios
              Positioned(
                left: 25,
                bottom: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nome
                    Text(
                      announcement.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                      ),
                    ),
                    // quantidade de anuncios
                    Text(
                      "${announcement.userAnnouncements.length} anúncios",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
