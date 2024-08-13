import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Data/Repository/Provider/github_repo_provider.dart';

class GithubRepo extends StatefulWidget {
  const GithubRepo({super.key});

  @override
  State<GithubRepo> createState() => _GithubRepoState();
}

class _GithubRepoState extends State<GithubRepo> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await githubRepoProvider.getGithubRepo();
    });
  }

  @override
  Widget build(BuildContext context) {
    GithubRepoProvider githubRepoProvider =
        Provider.of<GithubRepoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(githubRepoProvider.gitRepoData.length.toString()),
      ),
      body: ListView.builder(
        itemCount: githubRepoProvider.gitRepoData.length,
        itemBuilder: (BuildContext context, int index) {
          log("message1222${githubRepoProvider.gitRepoData.length}");
          return const Text("data");
        },
      ),
    );
  }
}
