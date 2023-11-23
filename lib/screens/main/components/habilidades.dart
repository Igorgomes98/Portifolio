import 'package:flutter/material.dart';
import 'package:portifolio/components/animatedProgressIndicator.dart';
import 'package:portifolio/constants.dart';

class Habilidades extends StatelessWidget {
  const Habilidades({
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
