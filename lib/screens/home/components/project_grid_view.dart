import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/http/webclients/git_webclient.dart';
import 'package:portifolio/models/Project.dart';
import 'package:portifolio/screens/home/components/project_card.dart';

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
  int page = 1;
  int totalPages = 1;
  List<Project>? allProjects = [];
  List<Project>? projects = [];
  bool isLoadingProject = false;

  @override
  void initState() {
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
        allProjects = response!;
        isLoadingProject = false;
      });
      getProjectsPage(allProjects!, page);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      setState(() {
        isLoadingProject = false;
      });
    }
  }

  void getProjectsPage(List<Project> allProjects, int page, {int perPage = 6}) {
    final int startIndex = (page - 1) * perPage;
    final int totalProjects = allProjects.length;
    final int endIndex = startIndex + perPage >= totalProjects
        ? totalProjects - 1
        : startIndex + perPage;
    setState(() {
      projects = allProjects.sublist(startIndex, endIndex);
      totalPages = (totalProjects / perPage).ceil();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          itemCount: projects?.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount,
            crossAxisSpacing: defaultPadding,
            childAspectRatio: widget.childAspectRatio,
            mainAxisSpacing: defaultPadding,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ProjectCard(project: projects![index]);
          },
        ),
        NumberPaginator(
          numberPages: totalPages,
          config: const NumberPaginatorUIConfig(
            buttonSelectedBackgroundColor: secondaryColor,
            buttonSelectedForegroundColor: primaryColor,
            buttonUnselectedForegroundColor: Colors.white,
            // contentPadding: EdgeInsets.all()
          ),
          onPageChange: (int index) {
            final int page = index + 1;
            getProjectsPage(allProjects!, page);
          },
        )
      ],
    );
  }
}