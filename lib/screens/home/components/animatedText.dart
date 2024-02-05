import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/screens/home/components/codeText.dart';

class BuildAnimatiedText extends StatelessWidget {
  const BuildAnimatiedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.titleMedium!,
      child: Row(
        children: [
          CodedText(),
          SizedBox(width: defaultPadding / 2),
          Text("I build "),
          AnimatedTextKit(animatedTexts: [
            TyperAnimatedText(
              "teste1",
              speed: Duration(milliseconds: 60),
            ),
            TyperAnimatedText(
              "teste2",
              speed: Duration(milliseconds: 60),
            ),
            TyperAnimatedText(
              "teste3",
              speed: Duration(milliseconds: 60),
            ),
          ]),
          Text.rich(
            TextSpan(
              text: "</",
              children: [
                TextSpan(
                    text: "flutter", style: TextStyle(color: primaryColor)),
                TextSpan(text: ">")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
