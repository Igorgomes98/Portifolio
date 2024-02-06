import 'package:flutter/material.dart';
import 'package:portifolio/components/animated_progress_indicator.dart';
import 'package:portifolio/constants.dart';

class Hability extends StatelessWidget {
  const Hability({
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
            "Habilidades",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const Row(
          children: [
            Expanded(
              child: AnimatedCircularProgress(
                label: "JS",
                percentage: 0.75,
              ),
            ),
            SizedBox(
              width: defaultPadding,
            ),
            Expanded(
              child: AnimatedCircularProgress(
                label: "PHP",
                percentage: 0.70,
              ),
            ),
            SizedBox(
              width: defaultPadding,
            ),
            Expanded(
              child: AnimatedCircularProgress(
                label: "Flutter",
                percentage: 0.80,
              ),
            ),
          ],
        )
      ],
    );
  }
}
