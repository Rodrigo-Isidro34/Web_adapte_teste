import 'package:flutter/material.dart';
import 'package:web_adapte_teste/components/connection_success_dialog.dart';
import 'package:web_adapte_teste/models/user_announcement.dart';

class UserAnnouncementTile extends StatelessWidget {
  final UserAnnouncement userAnnouncement;
  const UserAnnouncementTile({super.key, required this.userAnnouncement});

  @override
  Widget build(BuildContext context) {
    final double spaceTexts = 25;
    return Container(
      margin: const EdgeInsets.only(left: 25),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(25),
          color: const Color(0xff2a2634),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nome
              const Text(
                "Nome",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Inter",
                  fontSize: 14,
                ),
              ),
              Text(
                userAnnouncement.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Inter",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: spaceTexts),

              // tempo de jogo
              const Text(
                "Tempo de jogo",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Inter",
                  fontSize: 14,
                ),
              ),
              Text(
                userAnnouncement.gameTime,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Inter",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: spaceTexts),

              // Disponibilidade
              const Text(
                "Disponibilidade",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Inter",
                  fontSize: 14,
                ),
              ),
              Text(
                userAnnouncement.availability,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Inter",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: spaceTexts),

              // Chamada de áudio
              const Text(
                "Chamada de áudio?",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Inter",
                  fontSize: 14,
                ),
              ),
              Text(
                userAnnouncement.isCall ? "Sim" : "Não",
                style: TextStyle(
                  color:
                      userAnnouncement.isCall
                          ? Colors.greenAccent.shade400
                          : Colors.redAccent.shade100,
                  fontFamily: "Inter",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: spaceTexts),

              // Botão Conectar
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => ConnectionSuccessDialog(
                          discordName: userAnnouncement.discord,
                          onClose: () => Navigator.pop(context),
                        ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                ),
                child: const Row(
                  children: [
                    // Icone
                    Icon(Icons.sports_esports_outlined, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Conectar",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
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
