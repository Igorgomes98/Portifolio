import 'package:flutter/material.dart';
import 'package:portifolio/screens/home/components/home_banner.dart';
import 'package:portifolio/screens/home/components/label_counter_info.dart';
import 'package:portifolio/screens/home/components/my_projects.dart';
import 'package:portifolio/screens/main/main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      children: [
        HomeBanner(),
        LabelCounterAnimatedInfo(),
        MyProjects(),
      ],
    );
  }
}
