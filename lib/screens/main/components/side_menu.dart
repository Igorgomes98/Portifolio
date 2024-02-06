import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                  onPressed: () {},
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
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/linkedin.svg")),
                      IconButton(
                          onPressed: () {},
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
