import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portifolio/constants.dart';

class Knowledge extends StatelessWidget {
  const Knowledge({
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
            "Conhecimentos",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const ConhecimentoText(text: "Angular, Angular JS, Jquery"),
        const ConhecimentoText(text: "Java Android, React Native"),
        const ConhecimentoText(text: "C#, C++, Arduino"),
        const ConhecimentoText(text: "Mysql, SQL Server, PL Sql"),
        const ConhecimentoText(text: "REST API"),
        const ConhecimentoText(text: "Firebase"),
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
          const SizedBox(width: defaultPadding / 2),
          Text(text)
        ],
      ),
    );
  }
}
