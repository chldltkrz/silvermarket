import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFD9DDE7),
      toolbarHeight: 80,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Color(0xFF182233)),
        onPressed: onBackPressed ?? () => Get.back(),
      ),
      centerTitle: false,
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xFF182233),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
