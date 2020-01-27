import 'dart:convert';
import 'dart:io';

import 'package:auto_widgets/Widgets/ServiceInteractionWidgets/JSON/Job.dart';
import 'package:flutter/material.dart';

class GitHubJobsPage extends StatelessWidget {
  final Future<List<Job>> _jobs = HttpClient()
      .getUrl(Uri.parse(
          'https://jobs.github.com/positions.json?description=java&location=new+york'))
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
    return response.transform(utf8.decoder).join("").then((String content) {
      return (jsonDecode(content) as List<dynamic>)
          .map((json) => Job.fromJson(json))
          .toList();
    });
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Jobs'),
      ),
      body: FutureBuilder<List<Job>>(
        future: _jobs,
        builder: (BuildContext context, AsyncSnapshot<List<Job>> snapshot) {
          if (snapshot.hasData) {
            return JobsList(snapshot.data);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error}',
                style: TextStyle(color: Colors.red),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class JobsList extends StatelessWidget {
  JobsList(this.jobs);
  final List<Job> jobs;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        Job job = jobs[index];
        return ListTile(
          title: Text(job.title),
          subtitle: Text(job.company),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
      itemCount: jobs.length,
    );
  }
}