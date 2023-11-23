import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/screens/main/components/areaInfoText.dart';
import 'package:portifolio/screens/main/components/codigo.dart';
import 'package:portifolio/screens/main/components/conhecimento.dart';
import 'package:portifolio/screens/main/components/habilidades.dart';
import 'package:portifolio/screens/main/components/myInfo.dart';

class sideMenu extends StatelessWidget {
  const sideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              Habilidades(),
              Codigo(),
              Conhecimentos(),
              Divider(),
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
                    SizedBox(width: defaultPadding/2),
                    SvgPicture.asset("assets/icons/download.svg")
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: defaultPadding),
                color: Color(0xFF24242E),
                child: Row(
                  children: [
                    Spacer(),
                    IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/linkedin.svg")),
                    IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/github.svg")),
                    Spacer(),
                  ],
                ),
              )
            ],
          ),
        ))
      ]),
    );
  }
}
