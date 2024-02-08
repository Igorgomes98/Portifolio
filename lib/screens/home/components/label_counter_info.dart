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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLanguages();
  }

  void getLanguages() async {
    try {
      final List<Language>? response =
          await _gitWebClient.getWakaLanguageTime();
      setState(() {
        languages = response!;
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
          ? Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: languages
                        .map((language) {
                          return LabelCounterAnimated(
                            counter: AnimatedCounter(
                                value: language.hours, text: 'h+'),
                            label: language.name,
                          );
                        })
                        .toList()
                        .sublist(0, 2)),
                SizedBox(
                  height: defaultPadding,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: languages
                        .map((language) {
                          return LabelCounterAnimated(
                            counter: AnimatedCounter(
                                value: language.hours, text: 'h+'),
                            label: language.name,
                          );
                        })
                        .toList()
                        .sublist(2, 4))
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: languages.map((language) {
                return LabelCounterAnimated(
                  counter: AnimatedCounter(value: language.hours, text: 'h+'),
                  label: language.name,
                );
              }).toList(),
            ),
    );
  }
}
