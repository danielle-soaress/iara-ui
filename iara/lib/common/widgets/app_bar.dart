import 'package:flutter/material.dart';
import 'package:iara/core/configs/assets/app_images.dart';
import 'package:iara/core/configs/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: const Color(AppColors.black),
      elevation: 0,
      titleTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w800,
        fontSize: 20,
      ),
      centerTitle: true,
      title: Text("AILA"),
      leading: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: Color(AppColors.white),
          shape: const CircleBorder(),
          padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 0),
        ),
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onTap: () {
              print("Clicou no perfil");
            },
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(AppImages.devImg),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
