import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/http/webclients/git_webclient.dart';
import 'package:portifolio/models/Project.dart';
import 'package:portifolio/responsive.dart';
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
        const SizedBox(height: defaultPadding),
        const Responsive(
          mobile: ProjectGridView(
            crossAxisCount: 1,
            childAspectRatio: 1.7,
          ),
          mobileLarge: ProjectGridView(crossAxisCount: 2),
          desktop: ProjectGridView(),
          tablet: ProjectGridView(childAspectRatio: 1.1),
        ),
      ],
    );
  }
}

class ProjectGridView extends StatefulWidget {
  const ProjectGridView({
    super.key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.3,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  State<ProjectGridView> createState() => _ProjectGridViewState();
}

class _ProjectGridViewState extends State<ProjectGridView> {
  final GitWebClient _gitWebClient = GitWebClient();
  List<Project>? projects = [];
  bool isLoadingProject = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProjects();
  }

  void getProjects() async {
    try {
      setState(() {
        isLoadingProject = true;
      });
      final List<Project>? response = await _gitWebClient.getGitProjects();
      setState(() {
        projects = response!;
        isLoadingProject = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoadingProject = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: projects?.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        crossAxisSpacing: defaultPadding,
        childAspectRatio: widget.childAspectRatio,
        mainAxisSpacing: defaultPadding,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ProjectCard(project: projects![index]);
      },
    );
  }
}
