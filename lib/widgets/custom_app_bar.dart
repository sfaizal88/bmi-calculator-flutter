import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBar({
    required this.title,
    this.showBackButton = true,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF11163a),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFf9f9fa), 
          fontSize: 18,
          fontWeight: FontWeight.bold),
      ),
      leading: showBackButton ? 
      IconButton(
        onPressed: () {
          Navigator.pop(context);
        }, 
        icon: const Icon(Icons.arrow_back)
      )
      : null
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}