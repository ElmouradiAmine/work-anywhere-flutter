import 'package:flutter/material.dart';
import 'package:work_anywhere_flutter/src/constants/colors.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController controller;

  const SearchBar({Key key, this.controller}) : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool closeOn = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0, left: 24.0, bottom: 12.0),
      child: TextField(
        controller: widget.controller,
        onChanged: (val){
          if( closeOn == false && val.length > 0){
            setState(() {
              closeOn = true;
            });
          }
        },
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            suffixIcon: widget.controller.text.length > 0
                ? IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
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
                borderSide: BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            fillColor: kPrimaryColorDark,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
