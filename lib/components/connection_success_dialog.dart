import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:web_adapte_teste/theme/app_colors.dart';

// Dialog que aparece quando você aperta em "Conectar" em um anuncio
class ConnectionSuccessDialog extends StatelessWidget {
  final String discordName;
  final VoidCallback onClose;

  const ConnectionSuccessDialog({
    super.key,
    required this.discordName,
    required this.onClose,
  });

  // função que copia o nome do discord ao apertar encima dele
  void _discordCopy() {
    // copia o texto
    Clipboard.setData(ClipboardData(text: discordName));
    // cria um toast dizendo que copiou
    Fluttertoast.showToast(
      msg: "Discord copiado!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.background,
      webBgColor: "0xff2a2634", // não funciona colocar no app colors
      textColor: AppColors.toastText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        backgroundColor: AppColors.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 265,
              maxWidth: 300,
              minHeight: 180,
              maxHeight: 280,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: onClose,
                    icon: const Icon(Icons.close),
                    color: AppColors.textGray,
                  ),
                ),
                // icone no topo
                const Icon(
                  Icons.check_circle_outline_rounded,
                  size: 64,
                  color: AppColors.checkIcon,
                ),
                // Let’s play!
                const Text(
                  "Let’s play!",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: AppColors.textWhite,
                  ),
                ),
                // Agora é só começar a jogar!
                const Text(
                  "Agora é só começar a jogar!",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    color: AppColors.textGray,
                  ),
                ),
                const SizedBox(height: 25),

                // Adicione no Discord
                const Text(
                  "Adicione no Discord",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.textWhite,
                  ),
                ),
                GestureDetector(
                  onTap: _discordCopy,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.discordBox,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      discordName,
                      style: const TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
