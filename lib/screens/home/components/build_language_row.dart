import 'package:flutter/material.dart';
import 'package:portifolio/components/animated_counter.dart';
import 'package:portifolio/models/Language.dart';
import 'package:portifolio/screens/home/components/label_counter.dart';

class BuildLanguageRow extends StatelessWidget {
  const BuildLanguageRow({
    super.key,
    required this.languages,
  });

  final List<Language> languages;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: languages.map((language) {
        return LabelCounterAnimated(
          counter: AnimatedCounter(value: language.hours, text: 'h+'),
          label: language.name,
        );
      }).toList(),
    );
  }
}
