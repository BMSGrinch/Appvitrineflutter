import 'package:flutter/material.dart';
import 'package:appdemo/utilitaires/constantes.dart';

class CategoryMenu extends StatelessWidget {
  final List<String> categories;
  final String selectedCategorie;
  final void Function(String categorie) onCategorySelected;

  const CategoryMenu({
    super.key,
    required this.categories,
    required this.selectedCategorie,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final categorie = categories[index];
          final bool isSelected = selectedCategorie == categorie;

          return GestureDetector(
            onTap: () => onCategorySelected(categorie),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppConstants.textColor
                    : AppConstants.mainColor,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppConstants.textColor),
              ),
              child: Text(
                categorie,
                style: TextStyle(
                  color: isSelected
                      ? AppConstants.mainColor
                      : AppConstants.textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
