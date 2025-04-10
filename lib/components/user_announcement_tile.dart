import 'package:flutter/material.dart';
import 'package:web_adapte_teste/components/connection_success_dialog.dart';
import 'package:web_adapte_teste/models/user_announcement.dart';
import 'package:web_adapte_teste/theme/app_colors.dart';

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
        child: SizedBox(
          height: 300,
          child: Container(
            padding: const EdgeInsets.all(25),
            color: const Color(0xff2a2634),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nome
                const Text(
                  "Nome",
                  style: TextStyle(
                    color: AppColors.textGray,
                    fontFamily: "Inter",
                    fontSize: 14,
                  ),
                ),
                Text(
                  userAnnouncement.name,
                  style: const TextStyle(
                    color: AppColors.textWhite,
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
                    color: AppColors.textGray,
                    fontFamily: "Inter",
                    fontSize: 14,
                  ),
                ),
                Text(
                  userAnnouncement.gameTime,
                  style: const TextStyle(
                    color: AppColors.textWhite,
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
                    color: AppColors.textGray,
                    fontFamily: "Inter",
                    fontSize: 14,
                  ),
                ),
                Text(
                  userAnnouncement.availability,
                  style: const TextStyle(
                    color: AppColors.textWhite,
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
                    color: AppColors.textGray,
                    fontFamily: "Inter",
                    fontSize: 14,
                  ),
                ),
                Text(
                  userAnnouncement.isCall ? "Sim" : "Não",
                  style: TextStyle(
                    color:
                        userAnnouncement.isCall
                            ? AppColors.checkIcon
                            : AppColors.negative,
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
                    backgroundColor: AppColors.margentButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icone
                      Icon(
                        Icons.sports_esports_outlined,
                        color: AppColors.textWhite,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Conectar",
                        style: TextStyle(
                          color: AppColors.textWhite,
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
      ),
    );
  }
}
