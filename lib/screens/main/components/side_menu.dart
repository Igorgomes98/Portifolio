import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:portifolio/constants.dart';
import 'package:portifolio/screens/main/components/area_info_text.dart';
import 'package:portifolio/screens/main/components/code.dart';
import 'package:portifolio/screens/main/components/knowledge.dart';
import 'package:portifolio/screens/main/components/hability.dart';
import 'package:portifolio/screens/main/components/my_info.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Uri urlLinkedin =
        Uri.parse("https://www.linkedin.com/in/igor-gomes-76b59a144/");
    final Uri urlGithub = Uri.parse("https://github.com/Igorgomes98");
    return Drawer(
      child: SafeArea(
        child: Column(children: [
          const MyInfo(),
          Expanded(
              child: SingleChildScrollView(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                const AreaInfoText(
                  title: "Pais",
                  text: "Brasil",
                ),
                const AreaInfoText(
                  title: "Cidade",
                  text: "São José do Rio Preto",
                ),
                const AreaInfoText(
                  title: "Idade",
                  text: "25",
                ),
                const Hability(),
                const Code(),
                const Knowledge(),
                const Divider(),
                TextButton(
                  onPressed: () async {
                    html.window
                        .open("assets/docs/Curriculo.pdf", "Curriculo.pdf");
                  },
                  child: Row(
                    children: [
                      Text(
                        "DOWNLOAD CV",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                      const SizedBox(width: defaultPadding / 2),
                      SvgPicture.asset("assets/icons/download.svg")
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: defaultPadding),
                  color: const Color(0xFF24242E),
                  child: Row(
                    children: [
                      const Spacer(),
                      IconButton(
                          onPressed: () async {
                            if (await canLaunchUrl(urlLinkedin)) {
                              await launchUrl(urlLinkedin,
                                  mode: LaunchMode.externalApplication);
                            } else {
                              throw 'Could not launch $urlLinkedin';
                            }
                          },
                          icon: SvgPicture.asset("assets/icons/linkedin.svg")),
                      IconButton(
                          onPressed: () async {
                            if (await canLaunchUrl(urlGithub)) {
                              await launchUrl(urlGithub,
                                  mode: LaunchMode.externalApplication);
                            } else {
                              throw 'Could not launch $urlGithub';
                            }
                          },
                          icon: SvgPicture.asset("assets/icons/github.svg")),
                      const Spacer(),
                    ],
                  ),
                )
              ],
            ),
          ))
        ]),
      ),
    );
  }
}
