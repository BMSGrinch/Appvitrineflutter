import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String logoPath;
  final Color fontsColor;
  final Color textColor;
  final List<Widget>? actions;

  // ignore: use_super_parameters
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.logoPath,
    required this.fontsColor,
    required this.textColor,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: fontsColor,
      title: Row(
        children: [
          Image.asset(logoPath, height: 32),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: TextStyle(color: textColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      iconTheme: IconThemeData(color: textColor),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
