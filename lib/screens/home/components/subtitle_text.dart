import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/responsive.dart';
import 'package:portifolio/screens/home/components/animated_text_subtitle.dart';
import 'package:portifolio/screens/home/components/code_text.dart';

class BuildAnimatiedText extends StatelessWidget {
  const BuildAnimatiedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.titleMedium!,
      maxLines: 1,
      child: Row(
        children: [
          if (!Responsive.isMobileLarge(context))
            const CodedText(
              open: '<',
            ),
          if (!Responsive.isMobileLarge(context))
            const SizedBox(width: defaultPadding / 2),
          const Text("I build "),
          Responsive.isMobile(context) ? 
          Expanded(child: AnimatedTextSubtitle()) : AnimatedTextSubtitle(),
          if (!Responsive.isMobileLarge(context))
            const SizedBox(width: defaultPadding / 2),
          if (!Responsive.isMobileLarge(context)) const CodedText(open: '</'),
        ],
      ),
    );
  }
}