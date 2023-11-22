import 'package:flutter/material.dart';

class sideMenu extends StatelessWidget {
  const sideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AspectRatio(
          aspectRatio: 1.23,
          child: Container(
            color: const Color(0xFF242430),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacer(
                  flex: 2,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("images/IMG_8281.jpg"),
                ),
                Spacer(),
                Text(
                  "Igor Gomes",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text("Desenvolvedor Web Fullstack \ne Mobile",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w200, height: 1.5)),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
