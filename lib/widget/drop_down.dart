import 'package:agile_frontend/widget/star.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String dropdownValueTotal = 'Total';
  String dropdownValueSorting = 'Sorting';

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0), // Reduced padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0), // Smaller border radius
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5, // Smaller spread radius
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: DropdownButton<String>(
          value: dropdownValueTotal,
          icon: Icon(Icons.keyboard_arrow_down_sharp,
              size: 20), // Smaller icon size
          iconEnabledColor: Colors.grey[400],
          elevation: 1,
          underline: Container(
            height: 0,
            color: Colors.transparent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValueTotal = newValue!;
            });
          },
          // items with Star() widget in the drop down menu
          items: <String>['Total', '(5)', '(4)', '(3)', '(2)', '(1)']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  const Star(),
                  const SizedBox(width: 1),
                  Text(
                    value,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 9, // Further reduced font size
                    ),
                  ),
                ],
              ),
            );
          }).toList(),

          itemHeight: 48, // Reduced item height
          dropdownColor: Colors.white,
          isDense: true, // Reduces the overall size of the dropdown button
        ),
      ),
      const SizedBox(width: 5),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0), // Reduced padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0), // Smaller border radius
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5, // Smaller spread radius
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: DropdownButton<String>(
          value: dropdownValueSorting,
          icon: Icon(Icons.keyboard_arrow_down_sharp,
              size: 20), // Smaller icon size
          iconEnabledColor: Colors.grey[400],
          elevation: 1,
          underline: Container(
            height: 0,
            color: Colors.transparent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValueSorting = newValue!;
            });
          },
          items: <String>['Sorting', 'Lastest', 'Reccomended']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 9, // Further reduced font size
                ),
              ),
            );
          }).toList(),
          itemHeight: 48, // Reduced item height
          dropdownColor: Colors.white,
          isDense: true, // Reduces the overall size of the dropdown button
        ),
      ),
    ]);
  }
}
