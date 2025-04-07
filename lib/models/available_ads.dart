import 'package:flutter/material.dart';
import 'package:web_adapte_teste/models/game_announcement.dart';
import 'package:web_adapte_teste/models/user_announcement.dart';

class AvailableAds extends ChangeNotifier {
  // Lista de jogos disponiveis para anuncios
  List<GameAnnouncement> gameAnnouncements = [
    GameAnnouncement(
      name: "League of Legends",
      imagePath: "assets/images/image 1.png",
      userAnnouncements: [
        UserAnnouncement(
          name: "Diego Fernandes",
          gameTime: "2 anos",
          availability: "3 dias 18h - 20h",
          isCall: true,
          discord: "Diegoww#1549",
        ),
        UserAnnouncement(
          name: "Samantha Brekke",
          gameTime: "2 anos",
          availability: "3 dias 18h - 20h",
          isCall: false,
          discord: "Sam#3113",
        ),
        UserAnnouncement(
          name: "Lucas Ramos",
          gameTime: "1 ano",
          availability: "Todos os dias 21h - 23h",
          isCall: true,
          discord: "lucasR#8888",
        ),
      ],
    ),
    GameAnnouncement(
      name: "Apex Legends",
      imagePath: "assets/images/image 5.png",
      userAnnouncements: [
        UserAnnouncement(
          name: "Mariana Costa",
          gameTime: "6 meses",
          availability: "Seg-Sex 19h - 21h",
          isCall: false,
          discord: "MariC#4561",
        ),
        UserAnnouncement(
          name: "Eduardo Lima",
          gameTime: "3 anos",
          availability: "Fim de semana à tarde",
          isCall: true,
          discord: "eduLima#0021",
        ),
        UserAnnouncement(
          name: "Júlio Cesar",
          gameTime: "1 ano e meio",
          availability: "Qua e Qui 20h - 22h",
          isCall: true,
          discord: "julioC#9981",
        ),
      ],
    ),
    GameAnnouncement(
      name: "Counter Strike",
      imagePath: "assets/images/image 3.png",
      userAnnouncements: [
        UserAnnouncement(
          name: "Ana Pereira",
          gameTime: "4 anos",
          availability: "Seg-Sáb 18h - 23h",
          isCall: true,
          discord: "anap#7283",
        ),
        UserAnnouncement(
          name: "Bruno Silva",
          gameTime: "2 anos",
          availability: "Terça e Quinta 19h - 21h",
          isCall: false,
          discord: "bsilva#1122",
        ),
        UserAnnouncement(
          name: "Carlos Mendes",
          gameTime: "3 anos",
          availability: "Todos os dias 20h - 22h",
          isCall: true,
          discord: "cmendes#0070",
        ),
        UserAnnouncement(
          name: "Larissa Souza",
          gameTime: "8 meses",
          availability: "A combinar",
          isCall: false,
          discord: "lariSouza#8392",
        ),
      ],
    ),
    GameAnnouncement(
      name: "World of Warcraft",
      imagePath: "assets/images/image 7.png",
      userAnnouncements: [
        UserAnnouncement(
          name: "Vinícius Rocha",
          gameTime: "5 anos",
          availability: "Noites durante semana",
          isCall: true,
          discord: "viniR#3210",
        ),
        UserAnnouncement(
          name: "Patrícia Gomes",
          gameTime: "1 ano",
          availability: "Fim de semana à noite",
          isCall: true,
          discord: "patg#4432",
        ),
      ],
    ),
    GameAnnouncement(
      name: "Dota 2",
      imagePath: "assets/images/image 2.png",
      userAnnouncements: [
        UserAnnouncement(
          name: "Igor Matos",
          gameTime: "3 anos",
          availability: "Todos os dias 17h - 20h",
          isCall: true,
          discord: "igorM#5541",
        ),
        UserAnnouncement(
          name: "Thais Oliveira",
          gameTime: "2 anos",
          availability: "Ter, Qui, Sab 20h - 22h",
          isCall: false,
          discord: "thaisO#8811",
        ),
        UserAnnouncement(
          name: "Felipe Araújo",
          gameTime: "6 meses",
          availability: "A combinar",
          isCall: true,
          discord: "felipeA#3321",
        ),
        UserAnnouncement(
          name: "Luana Torres",
          gameTime: "1 ano",
          availability: "Seg a Sex 18h - 21h",
          isCall: false,
          discord: "luTorres#7711",
        ),
        UserAnnouncement(
          name: "André Melo",
          gameTime: "4 anos",
          availability: "Domingo e Feriado",
          isCall: true,
          discord: "andreM#6620",
        ),
      ],
    ),
    GameAnnouncement(
      name: "Fortnite",
      imagePath: "assets/images/image 6.png",
      userAnnouncements: [
        UserAnnouncement(
          name: "Bianca Reis",
          gameTime: "2 anos",
          availability: "Sáb e Dom 14h - 18h",
          isCall: true,
          discord: "biareis#6654",
        ),
        UserAnnouncement(
          name: "Rafael Torres",
          gameTime: "1 ano",
          availability: "Noite (após 20h)",
          isCall: false,
          discord: "rafaT#4409",
        ),
      ],
    ),
  ];

  // lista de anuncios do usuario
  List<GameAnnouncement> userAnnouncement = [];

  // get de announcements
  List<GameAnnouncement> getAnnouncementList() {
    return gameAnnouncements;
  }

  // get de userAnnouncement
  List<GameAnnouncement> getUserAnnouncement() {
    return userAnnouncement;
  }

  // adicionar itens nos anuncios do usuario
  void addItemToUserAnnouncement(GameAnnouncement announcement) {
    userAnnouncement.add(announcement);
    notifyListeners();
  }

  // remover item dos anuncios do usuario
  void removerItemFromCart(GameAnnouncement announcement) {
    userAnnouncement.remove(announcement);
    notifyListeners();
  }
}
