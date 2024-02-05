import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/models/Project.dart';
import 'package:portifolio/screens/home/components/project_card.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Meus Projetos",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: defaultPadding,
        ),
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
