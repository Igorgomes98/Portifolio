import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextSubtitle extends StatelessWidget {
  const AnimatedTextSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(animatedTexts: [
      TyperAnimatedText(
        "Faço a Análise sobre o seu projeto",
        speed: const Duration(milliseconds: 60),
      ),
      TyperAnimatedText(
        "Sistemas Multiplataforma, Web, Android e IOS",
        speed: const Duration(milliseconds: 60),
      ),
      TyperAnimatedText(
        "Construo Aplicativos e sites completos e feitos sobre demanda",
        speed: const Duration(milliseconds: 60),
      ),
    ]);
  }
}
