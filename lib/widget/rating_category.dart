import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingCategory extends StatelessWidget {
  final String title;
  final double rating;

  const RatingCategory({Key? key, required this.title, required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(rating.toString()),
        SizedBox(width: 8),
        RatingBarIndicator(
          rating: rating,
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: Colors.orange[300],
          ),
          itemCount: 5,
          itemSize: 15.0,
          unratedColor: Colors.grey[300],
          direction: Axis.horizontal,
        ),
        SizedBox(width: 18),
        Expanded(child: Text(title)),
        SizedBox(width: 8),
      ],
    );
  }
}
