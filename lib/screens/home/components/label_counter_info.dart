import 'package:flutter/material.dart';
import 'package:portifolio/components/animated_counter.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/http/webclients/git_webclient.dart';
import 'package:portifolio/models/Language.dart';
import 'package:portifolio/responsive.dart';
import 'package:portifolio/screens/home/components/label_counter.dart';

class LabelCounterAnimatedInfo extends StatefulWidget {
  const LabelCounterAnimatedInfo({
    super.key,
  });

  @override
  State<LabelCounterAnimatedInfo> createState() =>
      _LabelCounterAnimatedInfoState();
}

class _LabelCounterAnimatedInfoState extends State<LabelCounterAnimatedInfo> {
  List<Language> languages = [];
  final GitWebClient _gitWebClient = GitWebClient();
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLanguages();
  }

  void getLanguages() async {
    try {
      setState(() {
        isLoading = true;
      });
      final List<Language>? response =
          await _gitWebClient.getWakaLanguageTime();
      setState(() {
        languages = response!;
        isLoading = false;
      });
      print(languages.toString());
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Responsive.isMobileLarge(context)
          ? BuildLanguageColumn(languages: languages)
          : BuildLanguageRow(languages: languages),
    );
  }
}

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
