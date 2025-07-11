import 'package:flutter/material.dart';
import 'package:appdemo/utilitaires/constantes.dart';

class MyBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MyBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  List<IconData> icons = AppConstants.icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          bool isMiddle = index == 2;
          bool isSelected = widget.selectedIndex == index;
          String tooltipMsg = '';

          switch (index) {
            case 0:
              tooltipMsg = 'Accueil';
              break;
            case 1:
              tooltipMsg = 'Catalogue';
              break;
            case 2:
              tooltipMsg = 'Réseaux sociaux';
              break;
            case 3:
              tooltipMsg = 'Favoris';
              break;
            case 4:
              tooltipMsg = 'Profil';
              break;
          }

          return Tooltip(
            message: " $tooltipMsg",
            child: GestureDetector(
              onTap: () => widget.onItemTapped(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.all(10),
                decoration: isMiddle
                    ? BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 2,
                            blurRadius: 10,
                          ),
                        ],
                      )
                    : BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                child: Icon(
                  icons[index],
                  size: isMiddle ? 28 : 24,
                  color: isMiddle
                      ? Colors.black
                      : (isSelected ? Colors.white : Colors.grey[400]),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
