import 'package:appdemo/utilitaires/constantes.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const ButtonComponent({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.mainColor,
          foregroundColor: AppConstants.textColor,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontSize: 16),
        ),
        onPressed:
            onPressed ??
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("$label Action non définie")),
              );
            },
        child: Text(label),
      ),
    );
  }
}
