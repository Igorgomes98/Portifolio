import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';

class AnimatedCircularProgress extends StatelessWidget {
  const AnimatedCircularProgress({
    super.key,
    required this.percentage,
    required this.label,
  });
  final double percentage;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder(
            duration: defaultDuration,
            tween: Tween<double>(begin: 0, end: percentage),
            builder: (BuildContext context, double value, Widget? child) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: value,
                    color: primaryColor,
                    backgroundColor: darkColor,
                  ),
                  Center(
                      child: Text(
                    "${(value * 100).toInt()}%",
                    style: Theme.of(context).textTheme.titleMedium,
                  ))
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}

class AnimatedLinearProgress extends StatelessWidget {
  const AnimatedLinearProgress({
    super.key,
    required this.endValue,
    required this.title,
  });
  final double endValue;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TweenAnimationBuilder(
        duration: defaultDuration,
        tween: Tween<double>(begin: 0, end: endValue),
        builder: (BuildContext context, double value, Widget? child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text("${(value * 100).toInt()}%"),
                ],
              ),
              LinearProgressIndicator(
                value: value,
                color: primaryColor,
                backgroundColor: darkColor,
              ),
            ],
          );
        },
      ),
    );
  }
}
