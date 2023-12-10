// ignore_for_file: sized_box_for_whitespace

import 'package:agile_frontend/util/device/screen.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();

  String _searchText = "";
  _SearchScreenState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Screen.designToScreenWidth(context, 390),
      height: Screen.designToScreenHeight(context, 32),
      child: Row(
        children: [
          Expanded(
            child: TextField(
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                focusNode: focusNode,
                style: const TextStyle(
                  fontSize: 15,
                ),
                controller: _filter,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color.fromRGBO(254, 142, 72, 1),
                    size: 32,
                  ),
                  hintText: 'Not Implemented Yet! Don\'t Touch',
                  contentPadding: EdgeInsets.symmetric(vertical: 0),

                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),

                  // labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(217, 217, 217, 1), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(217, 217, 217, 1), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(217, 217, 217, 1), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                )),
          ),
        ],
      ),
    );
  }
}
