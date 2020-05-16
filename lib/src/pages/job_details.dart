import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:work_anywhere_flutter/src/constants/colors.dart';
import 'package:work_anywhere_flutter/src/models/job.dart';
import 'package:work_anywhere_flutter/src/widgets/job_detail_card.dart';
import 'package:flutter/services.dart';
import 'package:clipboard_manager/clipboard_manager.dart';

class JobDetails extends StatefulWidget {
  final Job job;

  const JobDetails({Key key, this.job}) : super(key: key);

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
     var brightness = MediaQuery.of(context).platformBrightness;
    bool isDark = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? kPrimaryColorDarkTheme : Colors.white,
      key: _scaffoldKey,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDark? greyColor : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0,
            ),
          ],
        ),
        padding: EdgeInsets.all(12.0),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: () {
                _launchURL(widget.job.applyurl);
              },
              child: Text(
                'Apply for job',
                style: TextStyle(
                  color: isDark? Colors.white :kPrimaryColor,
                  fontSize: 16,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                ClipboardManager.copyToClipBoard("your text to copy");
                final snackBar = SnackBar(
                  content: Text('Copied to Clipboard'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {},
                  ),
                );
                _scaffoldKey.currentState.showSnackBar(snackBar);
              },
              child: Text(
                'Copy Link for job',
                style: TextStyle(
                  color: isDark? Colors.white : kPrimaryColor,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: isDark ? kPrimaryColorDarkTheme :kPrimaryColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Platform.isAndroid ? SizedBox(height: 0,):Text('Back') ,
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            color: isDark ? kPrimaryColorDarkTheme :kPrimaryColor,
            child: Text(
              widget.job.position,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            height: 0,
            color: Colors.white,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                JobDetailCard(
                  job: widget.job,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    widget.job.description,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } 
  }
}
