import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:work_anywhere_flutter/src/constants/colors.dart';
import 'package:work_anywhere_flutter/src/constants/images.dart';
import 'package:work_anywhere_flutter/src/models/job.dart';
import 'package:work_anywhere_flutter/src/pages/job_details.dart';

class JobDetailCard extends StatelessWidget {
  final Job job;

  const JobDetailCard({Key key, this.job}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime dateadded = DateTime.parse(job.dateadded);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        padding: EdgeInsets.all(12.0),

      decoration: BoxDecoration(
        
        color: Colors.transparent,
        
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
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
                  'posted ${calculateDays(dateadded)} day ago',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontSize:12,
                  ),
                ),
                SizedBox(
                  height: 15.0,
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
                    style: Theme.of(context).textTheme.headline3.copyWith(
                      fontSize:16,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 5.0,),
          InkWell(
            onTap: (){
              _launchURL("https://www.linkedin.com/search/results/companies/?keywords=hey");
            },
                      child: SizedBox(
              width: 30,
              child: Image.asset(kLinkedinImage)),
          ),
        ],
      ),
    );
  }

  int calculateDays(DateTime date) {
    DateTime now = new DateTime.now();
    if(now.difference(date).inDays > 1) return now.difference(date).inDays;
    return now.difference(date).inHours;
  }

   _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } 
  }
}
