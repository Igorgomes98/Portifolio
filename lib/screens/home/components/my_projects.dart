import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
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
  int page = 1;
  int totalPages = 1;
  List<Project>? allProjects = [];
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
        allProjects = response!;
        isLoadingProject = false;
      });
      getProjectsPage(allProjects!, page);
    } catch (e) {
      print(e);
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
          physics: NeverScrollableScrollPhysics(),
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
          config: NumberPaginatorUIConfig(
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

class PaginationResult {
  final List<Project> projects;
  final int currentPage;
  final int totalPages;

  PaginationResult({
    required this.projects,
    required this.currentPage,
    required this.totalPages,
  });
}

List<Project>? allProjects = [];

PaginationResult getProjectsForPage(int page, int projectsPerPage) {
  final int startIndex = (page - 1) * projectsPerPage;
  final int endIndex = startIndex + projectsPerPage;
  final List<Project> projects = allProjects!.sublist(startIndex, endIndex);

  final int totalProjects = allProjects!.length;
  final int totalPages = (totalProjects / projectsPerPage).ceil();

  return PaginationResult(
    projects: projects,
    currentPage: page,
    totalPages: totalPages,
  );
}
