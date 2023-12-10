// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:agile_frontend/routing/bottom_bar_routing_page.dart';
import 'package:agile_frontend/service/house_data_provider_service.dart';
import 'package:agile_frontend/service/house_review_data_provider_service.dart';
import 'package:agile_frontend/util/db/entity/house.dart';
import 'package:agile_frontend/util/db/entity/house_review.dart';
import 'package:agile_frontend/util/db/firebase_storage.dart';
import 'package:agile_frontend/util/device/screen.dart';
import 'package:agile_frontend/widget/best_review_section.dart';
import 'package:agile_frontend/widget/heart_painter.dart';
import 'package:agile_frontend/widget/home_no_box.dart';
import 'package:agile_frontend/widget/house_image_widget.dart';
import 'package:agile_frontend/widget/line.dart';
import 'package:agile_frontend/widget/rating_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HouseReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<HouseDataProviderService>(
            builder: (context, houseData, child) {
          int index = houseData.homeInformationIndex;
          House house = houseData.houses[index.toString()]!;

          return Column(
            children: <Widget>[
              HouseImageWidget(house: house),

              Container(
                padding: EdgeInsets.only(
                    left: Screen.designToScreenWidth(context, 20),
                    top: Screen.designToScreenHeight(context, 14)),
                alignment: Alignment.topLeft,
                child: HomeNoBox(
                  house: house,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Screen.designToScreenWidth(context, 20),
                  bottom: Screen.designToScreenHeight(context, 14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            house.name,
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            'located in Phnom penh',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[500],
                            ),
                          ),
                          SizedBox(height: 10), // Space between text and icons
                          Row(
                            children: [
                              Icon(Icons.home, color: Colors.orange),
                              SizedBox(width: 4), // Space between icon and text
                              Text(house.type),
                              SizedBox(width: 16), // Space between items
                              Icon(Icons.filter_none, color: Colors.orange),
                              SizedBox(width: 4), // Space between icon and text
                              Text('${house.floor} floor in total'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(
                          size: Size(Screen.designToScreenWidth(context, 70),
                              Screen.designToScreenHeight(context, 70)),
                          painter: HeartPainter(),
                        ),
                        const Text(
                          '\nlike\n14',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                width: Screen.designToScreenWidth(context, 445),
                height: Screen.designToScreenHeight(context, 10),
                color: Colors.grey[200],
                padding: EdgeInsets.only(
                  bottom: Screen.designToScreenHeight(context, 8),
                ),
              ),

              ReviewSection(house: house),
              SizedBox(height: Screen.designToScreenHeight(context, 3)),
              Line(
                  context: context,
                  width: Screen.designToScreenWidth(context, 390)),
              BestReviewSection(
                house: house,
              ),
              // Add more widgets as needed for your layout
            ],
          );
        }),
      ),
      bottomNavigationBar: BottomBarRoutingPage(),
    );
  }
}

class RatingRow extends StatelessWidget {
  final String category;
  final double rating;

  RatingRow(this.category, this.rating);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: Text(category)),
        Text(rating.toString()),
        Icon(Icons.star, color: Colors.yellow),
      ],
    );
  }
}

class LikeButton extends StatelessWidget {
  final int likes;

  const LikeButton({Key? key, required this.likes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.favorite_border, color: Colors.orange),
        SizedBox(width: 4), // Space between icon and text
        Text('$likes'),
      ],
    );
  }
}

class ReviewSection extends StatelessWidget {
  final House house;

  const ReviewSection({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HouseReviewDataProviderService>(
        builder: (context, houseReviewData, child) {
      String houseId = house.id;
      List<HouseReview> houseReviews =
          houseReviewData.getHouseReviewsByHouseIdOrderByAgree(houseId);

      double indoorEnvironment = houseReviews
              .map((e) => e.indoorEnvironmentRating)
              .reduce((a, b) => a + b) /
          100;
      double outdoorEnvironment = houseReviews
              .map((e) => e.outdoorEnvironmentRating)
              .reduce((a, b) => a + b) /
          100;
      double communication = houseReviews
              .map((e) => e.communicationWithLandlordRating)
              .reduce((a, b) => a + b) /
          100;
      double similarity = houseReviews
              .map((e) => e.similarityToTheProvidedInfoRating)
              .reduce((a, b) => a + b) /
          100;
      double sunlightExposure = houseReviews
              .map((e) => e.sunlightExposureRating)
              .reduce((a, b) => a + b) /
          100;

      double averageRating =
          (indoorEnvironment + communication + similarity + sunlightExposure) /
              4;

      return Padding(
        padding: EdgeInsets.only(
          left: Screen.designToScreenWidth(context, 20),
          right: Screen.designToScreenWidth(context, 16),
          top: Screen.designToScreenHeight(context, 5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: 'Review ', style: const TextStyle(fontSize: 18.0)),
                  const TextSpan(
                      text: '(30)', style: TextStyle(fontSize: 13.0)),
                ],
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '${averageRating.toPrecision(1)}',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(width: 8),
                RatingBarIndicator(
                  rating: 4.0,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.orange[300],
                  ),
                  itemCount: 5,
                  itemSize: 21.0,
                  unratedColor: Colors.grey[300],
                  direction: Axis.horizontal,
                ),
                SizedBox(width: 8),
              ],
            ),
            Line(
                context: context,
                width: Screen.designToScreenWidth(context, 390)),
            Padding(
              padding: EdgeInsets.only(
                top: Screen.designToScreenHeight(context, 5),
                bottom: Screen.designToScreenHeight(context, 5),
              ),
              child: Text(
                'Rating by category',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            RatingCategory(
                title: 'Indoor environtment',
                rating: indoorEnvironment.toPrecision(1)),
            RatingCategory(
                title: 'Outdoor environtment',
                rating: outdoorEnvironment.toPrecision(1)),
            RatingCategory(
                title: 'Communication with the landlord',
                rating: communication.toPrecision(1)),
            RatingCategory(
                title: 'Similarity to the provided info',
                rating: similarity.toPrecision(1)),
            RatingCategory(
                title: 'Sunlight exposure',
                rating: sunlightExposure.toPrecision(1)),
          ],
        ),
      );
    });
  }
}
