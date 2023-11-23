import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portifolio/constants.dart';

class Conhecimentos extends StatelessWidget {
  const Conhecimentos({
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
            "Conhecimentos",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ConhecimentoText(text: "Flutter, Dart"),
        ConhecimentoText(text: "Flutter, Dart, Teste"),
        ConhecimentoText(text: "Flutter, Dart, TEste,TEste"),
        ConhecimentoText(text: "Flutter, Dart"),
      ],
    );
  }
}


class ConhecimentoText extends StatelessWidget {
  const ConhecimentoText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/check.svg"),
          SizedBox(width: defaultPadding / 2),
          Text(text)
        ],
      ),
    );
  }
}
