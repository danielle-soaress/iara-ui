import 'package:flutter/material.dart';
import 'package:iara/core/configs/theme/app_colors.dart';

class GradientMask extends StatelessWidget {
  final Widget child;
  final List<Color> colors;

  const GradientMask({
    super.key,
    required this.child,
    this.colors = const [
      Color(AppColors.primaryPurple),
      Color(AppColors.primaryPink),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => LinearGradient(
        colors: colors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: child,
    );
  }
}
