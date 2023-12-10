import 'package:agile_frontend/util/device/screen.dart';
import 'package:flutter/material.dart';

class LifestyleOptionCard extends StatefulWidget {
  final String type;
  final String emoji;
  final String description;

  const LifestyleOptionCard({
    Key? key,
    required this.type,
    required this.emoji,
    required this.description,
  }) : super(key: key);

  @override
  _LifestyleOptionCardState createState() => _LifestyleOptionCardState();
}

class _LifestyleOptionCardState extends State<LifestyleOptionCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.type,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.orange : Colors.black,
                    ),
                  ),
                  Text(
                    widget.emoji,
                    style: TextStyle(
                      fontSize: 24,
                      color: isSelected ? Colors.orange : Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Screen.designToScreenHeight(context, 8)),
              Text(
                widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.orange : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
