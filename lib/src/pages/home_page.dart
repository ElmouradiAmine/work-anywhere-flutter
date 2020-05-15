import 'package:flutter/material.dart';
import 'package:work_anywhere_flutter/src/models/job.dart';
import 'package:work_anywhere_flutter/src/resources/job_api.dart';
import 'package:work_anywhere_flutter/src/widgets/job_card.dart';
import 'package:work_anywhere_flutter/src/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  TextEditingController _controller = TextEditingController();
  bool isLoading = false;
  bool initialLoading = false;
  List<Job> jobs = List<Job>();
  int count = 1;

  fetchJobs() async {
    print(count);
    setState(() {
      if (count > 1) {
        isLoading = true;
      } else {
        initialLoading = true;
      }
    });
    List<Job> res = await JobApi.fetchJobs(count);

    jobs.addAll(res);

    setState(() {
      if (count > 1) {
        isLoading = false;
      } else {
        initialLoading = false;
      }
    });
    count += 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: Text('Work Anywhere'),
        bottom: PreferredSize(
            child: SearchBar(controller: _controller),
            preferredSize: Size(200, 60)),
      ),
      body: initialLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                Container(
                  color: Color(0xFFF8BBD0).withOpacity(0.7),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  width: double.infinity,
                  child: Text(
                    'Amount of jobs available: ${jobs[0].alljobs}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: jobs.length + 1,
                    padding: EdgeInsets.all(12.0),
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == jobs.length)
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Visibility(
                            visible: isLoading,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                      if (jobs[index].position.contains(_controller.text)) {
                        return JobCard(
                          job: jobs[index],
                        );
                      } else {
                        return SizedBox(height: 0,width: 0,);
                      }
                    },
                  ),
                ),
              ],
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
      });
    });

    fetchJobs();
    _scrollController.addListener(() {
      if (!isLoading &&
          !initialLoading &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 10) {
        fetchJobs();
      }
    });
  }
}
