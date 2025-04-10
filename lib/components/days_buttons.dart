import 'package:flutter/material.dart';
import 'package:web_adapte_teste/theme/app_colors.dart';

// botões (S T Q Q S) que aparecem na tela de cadastro
class DaysButtons extends StatefulWidget {
  final List<int> days;

  const DaysButtons({super.key, required this.days});

  @override
  State<DaysButtons> createState() => _DaysButtonsState();
}

class _DaysButtonsState extends State<DaysButtons> {
  @override
  Widget build(BuildContext context) {
    // adicionar ou remover dias da lista conforme seleciona e deseleciona os
    // botões
    void toggleDay(int dayCode, List<int> days) {
      setState(() {
        if (days.contains(dayCode)) {
          days.remove(dayCode);
        } else {
          days.add(dayCode);
        }
      });
    }

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quando costuma jogar?
          const Text(
            "Quando costuma jogar?",
            style: TextStyle(
              color: AppColors.textWhite,
              fontFamily: "Inter",
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
                [
                  {"label": "S", "code": 1},
                  {"label": "T", "code": 2},
                  {"label": "Q", "code": 3},
                  {"label": "Q", "code": 4},
                  {"label": "S", "code": 5},
                ].map((day) {
                  final int code = day["code"] as int;
                  final String label = day["label"] as String;
                  final bool isSelected = widget.days.contains(code);

                  return ElevatedButton(
                    onPressed: () => toggleDay(code, widget.days),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isSelected
                              ? AppColors.margentButton
                              : AppColors.backgroundfields,
                      fixedSize: const Size(40, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      label,
                      style: const TextStyle(
                        color: AppColors.textGray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
