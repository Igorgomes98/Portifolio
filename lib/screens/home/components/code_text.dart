import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';

class CodedText extends StatelessWidget {
  const CodedText({
    super.key, required this.open,
  });

  final String open;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: open,
        children: [
          TextSpan(text: "flutter", style: TextStyle(color: primaryColor)),
          TextSpan(text: ">")
        ],
      ),
    );
  }
}
