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
          title: "Dart / Flutter",
          endValue: 0.8,
        ),
        const AnimatedLinearProgress(
          title: "HTML / CSS",
          endValue: 0.70,
        ),
        const AnimatedLinearProgress(
          title: "SQL",
          endValue: 0.75,
        ),
        const AnimatedLinearProgress(
          title: "TypeScript",
          endValue: 0.30,
        ),
        const AnimatedLinearProgress(
          title: "ASP.Net",
          endValue: 0.35,
        ),
        const AnimatedLinearProgress(
          title: "No SQL",
          endValue: 0.4,
        ),
      ],
    );
  }
}
