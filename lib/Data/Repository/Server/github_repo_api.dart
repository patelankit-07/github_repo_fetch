import 'package:flutter_application_1/Data/Repository/api.dart';

class GithubRepoApi {
  static Future githubRepo() async {
    return Api().request(
      url: "repos",
      method: RequestMethod.get,
      header: Api.authHeader,
    );
  }
}
