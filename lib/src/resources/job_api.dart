import 'package:http/http.dart';
import 'dart:convert';

import 'package:work_anywhere_flutter/src/models/job.dart';

class JobApi {
  static Future<List<Job>> fetchJobs(int count) async {
    List<Job> jobs = [];
    final Response response =
        await get("https://www.workanywhere.io/api/jobs?count=$count");
    List<dynamic> responseDecoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (int i = 0; i < 24; i++) {
        jobs.add(Job.fromJson(responseDecoded[i]));
      }
      return jobs;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
