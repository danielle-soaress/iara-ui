import 'package:flutter/material.dart';
import 'package:iara/core/configs/assets/app_images.dart';
import 'package:iara/core/configs/theme/app_colors.dart';
import 'package:iara/common/widgets/app_bar.dart';
import 'package:iara/presentation/home/widgets/theme_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iara/core/configs/theme/app_theme.dart';
import 'package:iara/utils/gradient_mask.dart';

final List<Map<String, dynamic>> gridItems = [
  {
    "icon": Icons.forum_rounded,
    "theme": "Dia a Dia",
    "desc": "Conversas casuais, amizades e rotina diária.",
  },
  {
    "icon": FontAwesomeIcons.userTie,
    "theme": "Carreira",
    "desc": "Domine o mundo profissional e técnico.",
  },
  {
    "icon": Icons.airplanemode_active_outlined,
    "theme": "Viagens",
    "desc": "Explore o mundo sem barreiras de idioma.",
  },
  {
    "icon": Icons.star_rounded,
    "theme": "Cultura Pop",
    "desc": "Entenda séries, games e gírias da internet.",
  },
];

final Map<String, dynamic> bottomItem = {
  "icon": Icons.school_rounded,
  "theme": "Acadêmico",
  "desc": "Vocabulário para estudos e faculdade.",
};

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const double gap = 12.0;

    return Scaffold(
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppImages.backgroundBlur2),
          ),
        ),
        child: Column(
          spacing: 30,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 56),

            Column(
              spacing: 10,
              children: [
                Image.asset(AppImages.defaultAILA, width: 80),

                Text(
                  "Escolha um tema para conversarmos!",
                  style: context.text.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            Column(
              children: [
                GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: gap,
                    mainAxisSpacing: gap,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return ThemeCard(
                      icon: gridItems[index]['icon'] is IconData
                          ? Icon(
                              gridItems[index]['icon'],
                              size: 32,
                              color: Color(AppColors.black),
                            )
                          : FaIcon(
                              gridItems[index]['icon'],
                              size: 32,
                              color: Color(AppColors.black),
                            ),
                      theme: "${gridItems[index]['theme']}",
                      description: "${gridItems[index]['desc']}",
                      stroke: false,
                    );
                  },
                ),
                SizedBox(height: gap),
                SizedBox(
                  width: double.infinity,
                  child: ThemeCard(
                    action: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            print(
                              "block function aqui, mas vou ajeitar depois",
                            );
                            return const HomePage();
                          },
                        ),
                      ),
                    },
                    icon: Icon(
                      Icons.school,
                      color: Color(AppColors.black),
                      size: 32,
                    ),
                    theme: "Desafio do Dia",
                    description:
                        "Um tema mistério único a cada 24h para testar seus limites e garantir recompensas exclusivas.",
                    stroke: true,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 4,
                          children: [
                            GradientMask(
                              child: Text(
                                "0",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            GradientMask(
                              child: FaIcon(
                                FontAwesomeIcons.fire,
                                size: 20,
                                color: Color(AppColors.black),
                              ),
                            ),
                          ],
                        ),

                        Text("day streak", style: context.text.bodySmall),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
