import 'package:flutter/material.dart';
import 'package:iara/core/configs/assets/app_images.dart';
import 'package:iara/common/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppImages.backgroundBlur2),
          ),
        ),
        child: Column(
          children: [
            Column(
              children: [
                Image.asset(AppImages.defaultAILA),
                Text("Escolha um tema para conversarmos!"),
              ],
            ),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  Card(child: Center(child: Text("Tema 1"))),
                  Card(child: Center(child: Text("Tema 2"))),
                  Card(child: Center(child: Text("Tema 3"))),
                  Card(child: Center(child: Text("Tema 4"))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
