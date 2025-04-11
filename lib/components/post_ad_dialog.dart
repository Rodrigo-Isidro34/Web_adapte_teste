import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:web_adapte_teste/components/days_buttons.dart';
import 'package:web_adapte_teste/components/my_dropdown_button_form_field.dart';
import 'package:web_adapte_teste/components/my_textfield.dart';
import 'package:web_adapte_teste/models/available_ads.dart';
import 'package:web_adapte_teste/models/user_announcement.dart';
import 'package:web_adapte_teste/theme/app_colors.dart';

class PostAdDialog extends StatefulWidget {
  const PostAdDialog({super.key});

  @override
  State<PostAdDialog> createState() => _PostAdDialogState();
}

// verifica se um anuncio é valido para ser criado
bool _isCreateUserAdValid(
  BuildContext context,
  dynamic gameSelected,
  List<int> days,
  TextEditingController nicknameController,
  TextEditingController gameTimeController,
  TextEditingController discordController,
  TextEditingController fromController,
  TextEditingController toController,
) {
  // bool para validar se o usuario preencheu todos os campos
  bool isValid = true;
  // Verificar se tem algum campo vazio
  // se nome esta vazio
  if (nicknameController.text.isEmpty) {
    showToastMensage("Nome não pode ser vazio");
    isValid = false;
  }
  // se o "joga há quantos anos?" esta vazio
  if (gameTimeController.text.isEmpty) {
    showToastMensage(
      "Tempo de jogo não pode ser vazio (coloque zero caso deseje)",
    );
    isValid = false;
  }
  // se o discord esta vazio
  if (discordController.text.isEmpty) {
    showToastMensage("Discord não pode ser vazio");
    isValid = false;
  }
  // se o "de" ou "até" do horario está vazio
  if (fromController.text.isEmpty || toController.text.isEmpty) {
    showToastMensage("Horario não pode ser vazio");
    isValid = false;
  }
  // se nenhum jogo foi selecionado
  if (gameSelected == null) {
    showToastMensage("Selecione um jogo");
    isValid = false;
  }

  if (days.isEmpty) {
    showToastMensage("Selecione pelo menos um dia que costume jogar");
    isValid = false;
  }

  return isValid;
}

// Mostrar uma toast mensage
void showToastMensage(String mensagem) {
  Fluttertoast.showToast(
    msg: mensagem,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: const Color(0xff2a2634),
    webBgColor: "0xff2a2634",
    textColor: AppColors.textWhite,
    timeInSecForIosWeb: 2,
  );
}

class _PostAdDialogState extends State<PostAdDialog> {
  final List<int> _days = [];
  String? _gameSelected;
  bool _useVoiceChat = false;

  // Todos os controllers
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _gameTimeController = TextEditingController();
  final TextEditingController _discordController = TextEditingController();
  // controllers do horario "de xxh até xxh"
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AvailableAds>(
      builder:
          (context, value, child) => Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Dialog(
                  backgroundColor: AppColors.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 600,
                        maxHeight: 650,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Publique um anúncio
                          const Text(
                            "Publique um anúncio",
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                          const SizedBox(height: 25),
                          // Qual o game?
                          const Text(
                            "Qual o game?",
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontFamily: "Inter",
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          MyDropdownButtonFormField(
                            gameSelected: _gameSelected,
                            onChanged: (value) {
                              setState(() {
                                _gameSelected = value;
                              });
                            },
                          ),

                          const SizedBox(height: 25),
                          // Seu nome (ou nickname)
                          const Text(
                            "Seu nome (ou nickname)",
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontFamily: "Inter",
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 10),
                          // Como te chamam dentro do game?
                          MyTextfield(
                            hintText: 'Como te chamam dentro do game?',
                            controller: _nicknameController,
                          ),

                          const SizedBox(height: 25),
                          // Joga há quantos anos? + Qual seu Discord?
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Joga há quantos anos?
                                    const Text(
                                      "Joga há quantos anos?",
                                      style: TextStyle(
                                        color: AppColors.textWhite,
                                        fontFamily: "Inter",
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    MyTextfield(
                                      hintText: "Tudo bem ser ZERO",
                                      controller: _gameTimeController,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Qual seu Discord?
                                    const Text(
                                      "Qual seu Discord?",
                                      style: TextStyle(
                                        color: AppColors.textWhite,
                                        fontFamily: "Inter",
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    MyTextfield(
                                      hintText: "Usuario#0000",
                                      controller: _discordController,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 25),
                          // Qual horário do dia? + de até
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DaysButtons(days: _days),

                              const SizedBox(width: 20),

                              // Qual horário do dia?
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Qual horário do dia?",
                                      style: TextStyle(
                                        color: AppColors.textWhite,
                                        fontFamily: "Inter",
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        // Campo "De"
                                        Expanded(
                                          child: MyTextfield(
                                            hintText: "De",
                                            controller: _fromController,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        // Campo "Até"
                                        Expanded(
                                          child: MyTextfield(
                                            hintText: "até",
                                            controller: _toController,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 25),

                          // Checkbox
                          Row(
                            children: [
                              Checkbox(
                                value: _useVoiceChat,
                                onChanged: (value) {
                                  setState(() {
                                    _useVoiceChat = value ?? false;
                                  });
                                },
                                activeColor: Colors.transparent,
                                checkColor: AppColors.checkIcon,
                              ),
                              const SizedBox(width: 8),
                              const Expanded(
                                child: Text(
                                  "Costumo me conectar ao chat de voz",
                                  style: TextStyle(
                                    color: AppColors.textWhite,
                                    fontFamily: "Inter",
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const Spacer(),

                          // Botões: Cancelar e Encontrar duo
                          Row(
                            children: [
                              const Spacer(),
                              Expanded(
                                child: TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    "Cancelar",
                                    style: TextStyle(
                                      color: AppColors.textWhite,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    // Se for possivel criar um usuario
                                    if (_isCreateUserAdValid(
                                      context,
                                      _gameSelected,
                                      _days,
                                      _nicknameController,
                                      _gameTimeController,
                                      _discordController,
                                      _fromController,
                                      _toController,
                                    )) {
                                      // Crie um usuario
                                      String availability =
                                          "${_days.length} dias ° ${_fromController.text} - ${_toController.text}";
                                      value.addAdToGameAnnouncement(
                                        _gameSelected as String,
                                        UserAnnouncement(
                                          name: _nicknameController.text,
                                          gameTime: _gameTimeController.text,
                                          availability: availability,
                                          isCall: _useVoiceChat,
                                          discord: _discordController.text,
                                        ),
                                      );
                                      Navigator.pop(context);
                                      showToastMensage(
                                        "Usuario criado com sucesso",
                                      );
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.sports_esports_outlined,
                                    color: AppColors.textWhite,
                                  ),
                                  label: const Text(
                                    "Encontrar duo",
                                    style: TextStyle(
                                      color: AppColors.textWhite,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.margentButton,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
