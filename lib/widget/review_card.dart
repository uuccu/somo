import 'package:agile_frontend/util/device/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCard extends StatelessWidget {
  final double rating;
  final String title;
  final String satisfactoryText;
  final String dissatisfactoryText;
  final int agreeCount;
  final int disagreeCount;
  final IconData icon;

  const ReviewCard({
    Key? key,
    required this.rating,
    required this.title,
    required this.satisfactoryText,
    required this.dissatisfactoryText,
    required this.agreeCount,
    required this.disagreeCount,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blue[50],
              child: Icon(
                icon,
                color: Colors.orange,
                size: 15,
              ),
            ),
            SizedBox(width: Screen.designToScreenWidth(context, 8)),
            Text(
              '$rating',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(width: Screen.designToScreenWidth(context, 8)),
            RatingBarIndicator(
              rating: rating,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.orange[300],
              ),
              itemCount: 5,
              itemSize: 21.0,
              unratedColor: Colors.grey[300],
              direction: Axis.horizontal,
            ),
            SizedBox(width: Screen.designToScreenWidth(context, 30)),
            TextButton(
              onPressed: () {},
              // smaller the text size
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 12),
              ),
              child: Text('Agree ($agreeCount)'),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 12),
              ),
              child: Text('Disagree ($disagreeCount)'),
            ),
          ],
        ),
        SizedBox(height: Screen.designToScreenHeight(context, 5)),
        Text(
          '[$title]',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: Screen.designToScreenHeight(context, 5)),
        const Text(
          'Satisfactory aspects',
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        Text(satisfactoryText),
        SizedBox(height: Screen.designToScreenHeight(context, 5)),
        const Text(
          'Dissatisfactory aspects',
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        Text(dissatisfactoryText),
        SizedBox(height: Screen.designToScreenHeight(context, 8)),
        Divider(
          color: Colors.grey[300],
          thickness: 1,
        ),
      ],
    );
  }
}
