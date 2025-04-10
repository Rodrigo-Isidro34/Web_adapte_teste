import 'package:flutter/material.dart';
import 'package:web_adapte_teste/theme/app_colors.dart';

class MyDropdownButtonFormField extends StatelessWidget {
  final dynamic gameSelected;
  final ValueChanged<String?> onChanged;
  const MyDropdownButtonFormField({
    super.key,
    required this.gameSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: gameSelected,
      onChanged: onChanged,
      items: [
        const DropdownMenuItem(
          value: 'League of Legends',
          child: Text(
            'League of Legends',
            style: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.textGray,
              fontSize: 14,
            ),
          ),
        ),
        const DropdownMenuItem(
          value: 'Apex Legends',
          child: Text(
            'Apex Legends',
            style: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.textGray,
              fontSize: 14,
            ),
          ),
        ),
        const DropdownMenuItem(
          value: 'Counter Strike',
          child: Text(
            'Counter Strike',
            style: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.textGray,
              fontSize: 14,
            ),
          ),
        ),
        const DropdownMenuItem(
          value: 'World of Warcraft',
          child: Text(
            'World of Warcraft',
            style: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.textGray,
              fontSize: 14,
            ),
          ),
        ),
        const DropdownMenuItem(
          value: 'Dota 2',
          child: Text(
            'Dota 2',
            style: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.textGray,
              fontSize: 14,
            ),
          ),
        ),
        const DropdownMenuItem(
          value: 'Fortnite',
          child: Text(
            'Fortnite',
            style: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.textGray,
              fontSize: 14,
            ),
          ),
        ),
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.backgroundfields,
        labelText: "Selecione o game que deseja jogar",
        labelStyle: const TextStyle(
          color: AppColors.textGray,
          fontFamily: "Roboto",
          fontSize: 14,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade700, width: 1.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),

      dropdownColor: AppColors.backgroundfields, // Fundo da lista suspensa
      style: const TextStyle(color: AppColors.textWhite),
      iconEnabledColor: AppColors.textWhite, // Cor do ícone da seta
    );
  }
}
