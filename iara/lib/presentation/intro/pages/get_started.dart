import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iara/core/configs/assets/app_images.dart';
import 'package:iara/core/configs/assets/app_vectors.dart';
import 'package:iara/core/configs/theme/app_colors.dart';
import 'package:iara/core/configs/theme/app_theme.dart';
import 'package:iara/presentation/home/pages/home.dart';
import 'package:iara/common/widgets/gradient_button.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
              options: AnimatedMeshGradientOptions(speed: 6, grain: 0.1),
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
                  spacing: 20,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          BounceAnimatedText(
                            'Olá!',
                            textStyle: context.text.headlineLarge,
                            textAlign: TextAlign.start,
                          ),
                          BounceAnimatedText(
                            'Hello!',
                            textStyle: context.text.headlineLarge,
                            textAlign: TextAlign.start,
                          ),
                          BounceAnimatedText(
                            'Hola!',
                            textStyle: context.text.headlineLarge,
                            textAlign: TextAlign.start,
                          ),
                          BounceAnimatedText(
                            'Bonjour!',
                            textStyle: context.text.headlineLarge,
                            textAlign: TextAlign.start,
                          ),
                          BounceAnimatedText(
                            'Ciao!',
                            textStyle: context.text.headlineLarge,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    FadeIn(
                      duration: Duration(milliseconds: 500),
                      delay: Duration(milliseconds: 1500),
                      child: Text.rich(
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
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FadeIn(
                      duration: Duration(milliseconds: 500),
                      delay: Duration(milliseconds: 1800),
                      child: SvgPicture.asset(AppVectors.world),
                    ),
                    FadeIn(
                      duration: Duration(milliseconds: 500),
                      delay: Duration(milliseconds: 2100),
                      child: SvgPicture.asset(AppVectors.conversation),
                    ),
                    FadeIn(
                      duration: Duration(milliseconds: 500),
                      delay: Duration(milliseconds: 2500),
                      child: SvgPicture.asset(AppVectors.academic),
                    ),
                  ],
                ),

                Container(
                  child: Column(
                    children: [
                      FadeIn(
                        duration: Duration(milliseconds: 500),
                        delay: Duration(milliseconds: 2800),
                        child: Text(
                          "Estou pronta para te ajudar.",
                          style: context.text.bodyLarge?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      FadeIn(
                        duration: Duration(milliseconds: 500),
                        delay: Duration(milliseconds: 3100),
                        child: Text(
                          "Vamos lá?",
                          style: context.text.bodyLarge?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      FadeIn(
                        duration: Duration(milliseconds: 500),
                        delay: Duration(milliseconds: 3600),
                        child: GradientButton(
                          text: "Vamos!",
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            ),
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
