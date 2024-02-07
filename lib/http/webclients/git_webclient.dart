import 'package:dio/dio.dart';
import 'package:portifolio/models/Project.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
class GitWebClient {
  final dio = Dio();
  Future<List<Project>?> getGitProjects() async {
    final Response response = await dio.get()
  }
}