
import 'package:flutter/material.dart';
import 'package:work_anywhere_flutter/src/constants/colors.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  final String totalJobs;

  const SearchBar({Key key, this.controller, this.totalJobs}) : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool closeOn = false;
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDark = brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, right: 24.0, left: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: widget.controller,
            onChanged: (val){
              if( closeOn == false && val.length > 0){
                setState(() {
                  closeOn = true;
                });
              }
            },
            cursorColor: isDark? Colors.black : Colors.white,
            style: TextStyle(
              color: isDark? Colors.black : Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
            decoration: InputDecoration(
              focusColor: isDark ? Colors.white : kPrimaryColorDark,
              hintText: 'Search',
              hintStyle: TextStyle(
                color: isDark? Colors.black : Colors.white,
              ),
                prefixIcon: Icon(
                  Icons.search,
                  color: isDark? Colors.black : Colors.white,
                ),
                suffixIcon: widget.controller.text.length > 0
                    ? IconButton(
                        icon: Icon(
                          Icons.close,
                          color: isDark? Colors.black : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.controller.text = '';
                            closeOn = false;
                            FocusScope.of(context).requestFocus(new FocusNode());
                          });
                        },
                      )
                    : null,
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: isDark? Colors.white : kPrimaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: isDark? Colors.white : kPrimaryColor)),
                fillColor: isDark? Colors.white : kPrimaryColorDark,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: isDark? Colors.white : kPrimaryColor))),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
                      child: Text(widget.totalJobs, style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),),
          ),
        ],
      ),
    );
  }
}
