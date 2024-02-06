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
        "teste1",
        speed: const Duration(milliseconds: 60),
      ),
      TyperAnimatedText(
        "teste2",
        speed: const Duration(milliseconds: 60),
      ),
      TyperAnimatedText(
        "teste3",
        speed: const Duration(milliseconds: 60),
      ),
    ]);
  }
}
