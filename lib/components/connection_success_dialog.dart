import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConnectionSuccessDialog extends StatelessWidget {
  final String discordName;
  final VoidCallback onClose;
  const ConnectionSuccessDialog({
    super.key,
    required this.discordName,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xff2a2634),
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
              // X de fechar
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: onClose,
                  icon: const Icon(Icons.close),
                  color: Colors.grey.shade400,
                ),
              ),
              // Check circle
              Icon(
                Icons.check_circle_outline_rounded,
                size: 64,
                color: Colors.greenAccent.shade400,
              ),

              // Let’s play!
              const Text(
                "Let’s play!",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),

              // Agora é só começar a jogar!
              Text(
                "Agora é só começar a jogar!",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  color: Colors.grey.shade400,
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
                  color: Colors.white,
                ),
              ),
              // Discord + opção de copiar
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: discordName));
                  Fluttertoast.showToast(
                    msg: "Discord copiado!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.black87,
                    textColor: Colors.white,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    discordName,
                    style: const TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
