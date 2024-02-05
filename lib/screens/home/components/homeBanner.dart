import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/screens/home/components/animatedText.dart';
import 'package:portifolio/screens/home/homeScreen.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Stack(fit: StackFit.expand, children: [
        Image.asset(
          "assets/images/bg.jpeg",
          fit: BoxFit.cover,
        ),
        Container(
          color: darkColor.withOpacity(0.66),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Disconver my Amazing \nArt Space",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            BuildAnimatiedText(),
            SizedBox(
              height: defaultPadding,
            ),
            ElevatedButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 2, vertical: defaultPadding),
                  backgroundColor: primaryColor,
                  foregroundColor: darkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Text("EXPLORE NOW"),
            )
          ],
        )
      ]),
    );
  }
}
