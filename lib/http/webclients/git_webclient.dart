import 'package:dio/dio.dart';
import 'package:portifolio/models/Project.dart';

class GitWebClient {
  final String githubAPIRepo = "https://api.github.com/users/igorgomes98/repos";
  Future<List<Project>?> getGitProjects() async {
    final Dio dio = Dio();
    final Response response = await dio.get(githubAPIRepo);
    if (response.statusCode == 200) {
      final List<dynamic>? responseData = response.data;
      if (responseData != null) {
      final List<Project> returnProject = responseData.map((dynamic json) => Project.fromJson(json)).toList();
      return returnProject;
      }
    }
    return [];
  }
}
