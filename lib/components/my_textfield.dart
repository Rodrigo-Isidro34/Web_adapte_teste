import 'package:flutter/material.dart';
import 'package:web_adapte_teste/theme/app_colors.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  const MyTextfield({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: AppColors.textWhite,
        fontFamily: "Roboto",
        fontSize: 14,
      ),
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.backgroundfields,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.textGray), 
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.transparent, // Sem borda inicialmente
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.blue, // Borda azul ao focar
            width: 1.5,
          ),
        ),
      ),
      cursorColor: Colors.blue,
    );
  }
}
