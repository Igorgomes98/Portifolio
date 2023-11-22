import 'package:flutter/material.dart';
import 'package:portifolio/screens/main/components/myInfo.dart';

class sideMenu extends StatelessWidget {
  const sideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        MyInfo()
      ]),
    );
  }
}