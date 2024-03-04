import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/models/Language.dart';
import 'package:portifolio/screens/home/components/build_language_row.dart';

class BuildLanguageColumn extends StatelessWidget {
  const BuildLanguageColumn({
    super.key,
    required this.languages,
  });

  final List<Language> languages;

  @override
  Widget build(BuildContext context) {
    if (languages.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: LinearProgressIndicator(
          color: primaryColor,
        ),
      );
    } else {
      final List<Language> firstColumn = languages.sublist(0, 2);
      final List<Language> secondColumn = languages.sublist(2, 4);
      return Column(
        children: [
          BuildLanguageRow(languages: firstColumn),
          const SizedBox(height: defaultPadding),
          BuildLanguageRow(languages: secondColumn),
        ],
      );
    }
  }
}
