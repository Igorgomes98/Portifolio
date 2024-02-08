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
      maxLines: 2,
      child: Row(
        children: [
          if (!Responsive.isMobileLarge(context))
            const CodedText(
              open: '<',
            ),
          if (!Responsive.isMobileLarge(context))
            const SizedBox(width: defaultPadding / 2),
          // const Text("Construo "),
          Responsive.isMobile(context) ? 
          const Expanded(child: AnimatedTextSubtitle()) : const AnimatedTextSubtitle(),
          if (!Responsive.isMobileLarge(context))
            const SizedBox(width: defaultPadding / 2),
          if (!Responsive.isMobileLarge(context)) const CodedText(open: '</'),
        ],
      ),
    );
  }
}