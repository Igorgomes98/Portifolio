import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';

class CodedText extends StatelessWidget {
  const CodedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "<",
        children: [
          TextSpan(text: "flutter", style: TextStyle(color: primaryColor)),
          TextSpan(text: ">")
        ],
      ),
    );
  }
}
