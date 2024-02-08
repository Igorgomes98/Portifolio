import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/models/Project.dart';
import 'package:portifolio/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });
  final Project project;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          project.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const Spacer(),
        Text(
          project.description!,
          maxLines: Responsive.isMobileLarge(context) ? 3 : 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(height: 1.5),
        ),
        const Spacer(),
        TextButton(
          onPressed: () async {
            final Uri url = Uri.parse(project.htmlUrl);
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: const Text(
            'Saiba Mais >>',
            style: TextStyle(
              color: primaryColor,
            ),
          ),
        )
      ]),
    );
  }
}
