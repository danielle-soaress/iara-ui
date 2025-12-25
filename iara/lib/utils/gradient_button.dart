import 'package:flutter/material.dart';
import 'package:iara/core/configs/theme/app_colors.dart';
import 'package:iara/core/configs/theme/app_theme.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final List<Color> colors;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.colors = const [
      Color(AppColors.primaryPink),
      Color(AppColors.primaryPurple),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [colors[0], colors[1]]),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                text,
                style: context.text.bodyLarge?.copyWith(
                  color: Color(AppColors.white),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
