import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:portifolio/models/Language.dart';
import 'package:portifolio/models/Project.dart';

class GitWebClient {
  Future<List<Project>?> getGitProjects() async {
    const String githubAPIRepo =
        "https://api.github.com/users/igorgomes98/repos";
    final Dio dio = Dio();
    final Response response = await dio.get(githubAPIRepo);
    if (response.statusCode == 200) {
      final List<dynamic>? responseData = response.data;
      if (responseData != null) {
        final List<int> notIn = [745042621, 493246735];
        final List<Project> allProjects = responseData
            .where((json) => !notIn.contains(json['id']))
            .map((dynamic json) => Project.fromJson(json))
            .toList();
        return allProjects;
      }
    }
    return [];
  }

  Future<List<Language>?> getWakaLanguageTime() async {
    try {
      const String wakaAPILanguage =
          "https://wakatime.com/share/@igorgomes98/15927b97-0ae9-4a5a-8b46-e3710246b923.json";
      final Dio dio = Dio();
      final Response response = await dio.get(wakaAPILanguage);
      if (response.statusCode == 200) {
        final List<dynamic>? responseData = response.data['data'];
        if (responseData != null) {
          final List<Language> languages = responseData
              .map((dynamic json) => Language.fromJson(json))
              .toList()
              .sublist(0, 4);
          return languages;
        }
      }
      return [];
    } on DioException catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print(e.response!.data);
          print(e.response!.headers);
          print(e.response!.requestOptions);
        }
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        if (kDebugMode) {
          print(e.requestOptions);
          print(e.message);
        }
      }
    }
    return null;
  }
}
