import 'package:flutter/material.dart';
import 'package:portifolio/components/animated_progress_indicator.dart';
import 'package:portifolio/constants.dart';

class Code extends StatelessWidget {
  const Code({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
          ),
          child: Text(
            "Código",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const AnimatedLinearProgress(
          title: "Dart",
          endValue: 0.8,
        ),
        const AnimatedLinearProgress(
          title: "C#",
          endValue: 0.6,
        ),
        const AnimatedLinearProgress(
          title: "C++",
          endValue: 0.4,
        ),
        const AnimatedLinearProgress(
          title: "Arduino",
          endValue: 0.4,
        ),
        const AnimatedLinearProgress(
          title: "React Native",
          endValue: 0.2,
        ),
      ],
    );
  }
}
