import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gophr/model/job_model.dart';
import 'package:gophr/network_service/network_service.dart';

class Jobs extends ChangeNotifier {
  List<JobModel> jobsAvailable = [];
  List<JobModel> acceptedJobs = [];

  Future<List<JobModel>> getJobsAvailable() async {
    var jsonData = await NetworkHelper.fetchNetworkData();
    List<dynamic> data = jsonDecode(jsonData);

    jobsAvailable = data.map((jobData) => JobModel.fromJson(jobData)).toList();
    jobsAvailable.sort((b, a) => a.date_posted!.compareTo(b.date_posted!));
    return jobsAvailable;
  }

  void rejectJob(int index) {
    jobsAvailable.removeAt(index);
    notifyListeners();
  }

  void acceptJob(int index) {
    acceptedJobs.add(jobsAvailable[index]);
    jobsAvailable.removeAt(index);
    notifyListeners();
  }
}
