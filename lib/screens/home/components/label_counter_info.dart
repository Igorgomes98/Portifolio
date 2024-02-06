import 'package:flutter/material.dart';
import 'package:portifolio/components/animated_counter.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/responsive.dart';
import 'package:portifolio/screens/home/components/label_counter.dart';

class LabelCounterAnimatedInfo extends StatelessWidget {
  const LabelCounterAnimatedInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Responsive.isMobileLarge(context)
          ? const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelCounterAnimated(
                        counter: AnimatedCounter(value: 119, text: 'K+'),
                        label: "Subscribers"),
                    LabelCounterAnimated(
                        counter: AnimatedCounter(value: 40, text: '+'),
                        label: "Videos"),
                  ],
                ),
                SizedBox(height: defaultPadding,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelCounterAnimated(
                        counter: AnimatedCounter(value: 30, text: '+'),
                        label: "Github Projects"),
                    LabelCounterAnimated(
                        counter: AnimatedCounter(value: 13, text: 'K+'),
                        label: "Stars"),
                  ],
                )
              ],
            )
          : const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelCounterAnimated(
                    counter: AnimatedCounter(value: 119, text: 'K+'),
                    label: "Subscribers"),
                LabelCounterAnimated(
                    counter: AnimatedCounter(value: 40, text: '+'),
                    label: "Videos"),
                LabelCounterAnimated(
                    counter: AnimatedCounter(value: 30, text: '+'),
                    label: "Github Projects"),
                LabelCounterAnimated(
                    counter: AnimatedCounter(value: 13, text: 'K+'),
                    label: "Stars"),
              ],
            ),
    );
  }
}
