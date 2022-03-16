import 'package:flutter/material.dart';
import 'package:gophr/jobs/jobLogic.dart';
import 'package:gophr/ui/common/widgets.dart';
import 'package:gophr/ui/components/app_colours.dart';
import 'package:gophr/jobs/jobCard.dart';
import 'package:provider/provider.dart';
import 'package:async/async.dart';

class GophrJobBoard extends StatefulWidget {
  const GophrJobBoard({Key? key}) : super(key: key);

  @override
  _GophrJobBoardState createState() => _GophrJobBoardState();
}

class _GophrJobBoardState extends State<GophrJobBoard> {
  late Future myJobs;
  final AsyncMemoizer _memorizer = AsyncMemoizer();

  Future fetchData() {
    return _memorizer.runOnce(() async {
      await Future.delayed(const Duration(seconds: 2));
      return Provider.of<Jobs>(context, listen: false).getJobsAvailable();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.grey,
          elevation: 0,
          title: Text(
            'Gophr Job Board',
            style: Theme.of(context).textTheme.headline6,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Container(
              color: AppColors.white,
              child: TabBar(
                indicatorColor: AppColors.black,
                indicatorWeight: 2,
                labelStyle: Theme.of(context).textTheme.button,
                labelColor: AppColors.black,
                tabs: const [
                  Tab(
                    text: 'JOBS',
                  ),
                  Tab(text: 'ACCEPTED JOBS'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Consumer<Jobs>(builder: (context, jobData, child) {
                      return ListView.builder(
                        itemCount: Provider.of<Jobs>(context).jobsAvailable.length,
                        itemBuilder: (BuildContext context, int index) {
                          return JobCard(
                            index: index,
                            jobTitle: jobData.jobsAvailable[index].title!,
                            pickUpLocation: jobData.jobsAvailable[index].pickup!,
                            dropOffLocation: jobData.jobsAvailable[index].drop_off!,
                            deliveryDate: jobData.jobsAvailable[index].expected_delivery_date!,
                            buttonsVisible: true,
                          );
                        },
                      );
                    });
                  }
                  if (snapshot.hasError) {
                    return showError(snapshot);
                  }
                  return progressIndicator();
                }),
            Consumer<Jobs>(builder: (context, jobData, child) {
              return ListView.builder(
                itemCount: jobData.acceptedJobs.length,
                itemBuilder: (BuildContext context, int index) {
                  return JobCard(
                    index: index,
                    jobTitle: jobData.acceptedJobs[index].title!,
                    pickUpLocation: jobData.acceptedJobs[index].pickup!,
                    dropOffLocation: jobData.acceptedJobs[index].drop_off!,
                    deliveryDate: jobData.acceptedJobs[index].expected_delivery_date!,
                    buttonsVisible: false,
                  );
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
