import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/models/Project.dart';
import 'package:portifolio/screens/home/components/home_banner.dart';
import 'package:portifolio/screens/home/components/label_counter_info.dart';
import 'package:portifolio/screens/home/components/project_card.dart';
import 'package:portifolio/screens/main/main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      children: [
        HomeBanner(),
        LabelCounterAnimatedInfo(),
        Text(
          "Meus Projetos",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: defaultPadding,),
        GridView.builder(
          shrinkWrap: true,
          itemCount: demoProjects.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: defaultPadding,
            childAspectRatio: 1.3,
            mainAxisSpacing: defaultPadding,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ProjectCard(project: demoProjects[index]);
          },
        ),
      ],
    );
  }
}
