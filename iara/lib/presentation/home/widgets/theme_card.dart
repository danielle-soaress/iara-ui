import 'package:flutter/material.dart';
import 'package:iara/core/configs/theme/app_colors.dart';
import 'package:iara/core/configs/theme/app_theme.dart';

class ThemeCard extends StatelessWidget {
  final Icon icon;
  final String theme;
  final String description;
  final bool stroke;
  final VoidCallback? action;
  final Widget? widget;

  const ThemeCard({
    super.key,
    required this.icon,
    required this.theme,
    required this.description,
    this.stroke = false,
    this.action,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              Color(AppColors.primaryPurple),
              Color(AppColors.primaryPink),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: stroke
              ? const EdgeInsets.all(4.0)
              : const EdgeInsets.all(0.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: const Color(AppColors.white),
              borderRadius: BorderRadius.circular(28),
            ),

            child: Stack(
              children: [
                Column(
                  spacing: 2,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    icon,
                    const SizedBox(height: 8),
                    Text(
                      theme,
                      style: context.text.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(description, style: context.text.bodySmall),
                  ],
                ),

                widget != null
                    ? Positioned(top: 0, right: 0, child: widget!)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
