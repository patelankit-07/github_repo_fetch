import 'dart:developer';
import 'package:flutter/material.dart';
import '../Server/github_repo_api.dart';
import '../../Models/github_repo_model.dart';

GithubRepoProvider githubRepoProvider = GithubRepoProvider();

class GithubRepoProvider extends ChangeNotifier {
  List<GithubReposmodel> _gitRepo = [];
  List<GithubReposmodel> get gitRepoData => _gitRepo;

  Future getGithubRepo() async {
    await GithubRepoApi.githubRepo().then((onValue) {
      try {
        _gitRepo = List.from(
            onValue.map((e) => GithubReposmodel.fromJson(e)).toList());
      } catch (e) {
        log("message${e.toString()}");
        _gitRepo = [];
      }
    }).catchError((onError) {
      log("message${onError.toString()}");
      _gitRepo = [];
    });
    notifyListeners();

    log("_gitRepo${_gitRepo.length}");
  }

  Future getGithubLastCommit() async {
    await GithubRepoApi.githubLastCommit().then((onValue) {});
    notifyListeners();

    log("_gitRepo${_gitRepo.length}");
  }
}
