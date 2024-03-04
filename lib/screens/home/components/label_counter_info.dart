import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/http/webclients/git_webclient.dart';
import 'package:portifolio/models/Language.dart';
import 'package:portifolio/responsive.dart';
import 'package:portifolio/screens/home/components/build_language_column.dart';
import 'package:portifolio/screens/home/components/build_language_row.dart';

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
      if (kDebugMode) {
        print(languages.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
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