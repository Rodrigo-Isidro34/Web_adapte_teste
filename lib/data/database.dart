import 'package:hive_flutter/hive_flutter.dart';

class DataBase {
  List gameAnnouncements = [];

  // Referenciar a "box"
  final _myBox = Hive.box("appBox");

  // Se for a primeira iteração do app, inicalizar com alguns dados
  void createInitialData(List inicialData) {
    gameAnnouncements = inicialData;
  }

  // ler dados do banco
  void loadData() {
    gameAnnouncements = _myBox.get("GAMEANNOUNCEMENTS");
  }

  // atualizar o banco
  void updateDataBase() {
    _myBox.put("GAMEANNOUNCEMENTS", gameAnnouncements);
  }
}
