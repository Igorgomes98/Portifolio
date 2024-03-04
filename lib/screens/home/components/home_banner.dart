import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/responsive.dart';
import 'package:portifolio/screens/home/components/subtitle_text.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isMobile(context) ? 2.5 : 3,
      child: Stack(fit: StackFit.expand, children: [
        Image.asset(
          "assets/images/bg_igor.webp",
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
              "Bem vindo \nao meu portifolio",
              style: Responsive.isDesktop(context)
                  ? Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )
                  : Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
            ),
            if (!Responsive.isMobileLarge(context))
              const SizedBox(height: defaultPadding / 2),
            const BuildAnimatiedText(),
            const SizedBox(height: defaultPadding),
            // if (!Responsive.isMobileLarge(context))
            //   ElevatedButton(
            //     onPressed: () {},
            //     style: TextButton.styleFrom(
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: defaultPadding * 2,
            //             vertical: defaultPadding),
            //         backgroundColor: primaryColor,
            //         foregroundColor: darkColor,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10),
            //         )),
            //     child: const Text(""),
            //   )
          ],
        )
      ]),
    );
  }
}
