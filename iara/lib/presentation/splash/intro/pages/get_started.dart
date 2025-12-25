import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iara/core/configs/assets/app_images.dart';
import 'package:iara/core/configs/assets/app_vectors.dart';
import 'package:iara/core/configs/theme/app_colors.dart';
import 'package:iara/core/configs/theme/app_theme.dart';
import 'package:iara/common/widgets/gradient_button.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class GetStartedPage extends StatelessWidget {
  final String username;

  const GetStartedPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.white),
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedMeshGradient(
              colors: [
                Color(AppColors.white),
                Color(AppColors.gradientPink),
                Color(AppColors.gradientPurple),
                Color(AppColors.white),
              ],
              options: AnimatedMeshGradientOptions(speed: 4, grain: 0.1),
            ),
          ),

          Positioned.fill(
            child: Container(
              color: Color(AppColors.white).withValues(alpha: 0.5),
            ),
          ),

          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.textLogo),

                Image.asset(AppImages.happyAILA, width: 300),

                Column(
                  children: [
                    Row(
                      children: [
                        Text("Olá, ", style: context.text.headlineLarge),
                        Text(
                          username,
                          style: context.text.headlineLarge?.copyWith(
                            color: Color(AppColors.secondaryPurple),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Eu sou a ",
                            style: context.text.bodyLarge,
                          ),
                          TextSpan(
                            text: "AILA",
                            style: context.text.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Color(AppColors.secondaryPurple),
                            ),
                          ),
                          TextSpan(
                            text:
                                ", sua Inteligência Artificial para aprendizado de idiomas.",
                            style: context.text.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(AppVectors.world),
                    SvgPicture.asset(AppVectors.conversation),
                    SvgPicture.asset(AppVectors.academic),
                  ],
                ),

                GradientButton(text: "Vamos!", onPressed: () => {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
