import 'package:flutter/material.dart';
import 'package:portifolio/components/animatedProgressIndicator.dart';
import 'package:portifolio/constants.dart';

class Codigo extends StatelessWidget {
  const Codigo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
          ),
          child: Text(
            "Código",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        AnimatedLinearProgress(
          title: "Dart",
          endValue: 0.8,
        ),
        AnimatedLinearProgress(
          title: "C#",
          endValue: 0.6,
        ),
        AnimatedLinearProgress(
          title: "C++",
          endValue: 0.4,
        ),
        AnimatedLinearProgress(
          title: "Arduino",
          endValue: 0.4,
        ),
        AnimatedLinearProgress(
          title: "React Native",
          endValue: 0.2,
        ),
      ],
    );
  }
}
