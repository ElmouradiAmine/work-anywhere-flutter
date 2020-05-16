import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:work_anywhere_flutter/src/constants/colors.dart';
import 'package:work_anywhere_flutter/src/constants/images.dart';
import 'package:work_anywhere_flutter/src/models/job.dart';
import 'package:work_anywhere_flutter/src/pages/job_details.dart';

class JobCard extends StatelessWidget {
  final Job job;

  const JobCard({Key key, this.job}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime dateadded = DateTime.parse(job.dateadded);
    int nbDays = calculateDays(dateadded);
    String postedString = nbDays > 30 ? 'posted longer than 30 days ago': 'posted $nbDays day${nbDays > 1 ?  's' : ''} ago';
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> JobDetails(job:job)));
          },
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            padding: EdgeInsets.all(12.0),
            color: Colors.transparent,
            child: Row(
              children: <Widget>[
                job.companylogo == ''
                    ? Container(width: 60, child: Image.asset(kPenImage2))
                    : Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0)),
                        width: 60,
                        height: 60,
                        child: FittedBox(
                            fit: BoxFit.cover,
                            child: FadeInImage.assetNetwork(
                                placeholder: kPenImage2,
                                image: job.companylogo)),
                      ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        postedString,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        job.position,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(5.0)),
                        padding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 6.0),
                        child: Text(
                          job.companyname,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  int calculateDays(DateTime date) {
    DateTime now = new DateTime.now();
    if(now.difference(date).inDays > 1) return now.difference(date).inDays;
    return now.difference(date).inHours;
  }
}
