import 'package:agile_frontend/service/house_data_provider_service.dart';
import 'package:agile_frontend/service/house_review_data_provider_service.dart';
import 'package:agile_frontend/util/db/entity/house.dart';
import 'package:agile_frontend/util/db/entity/house_review.dart';
import 'package:agile_frontend/util/device/screen.dart';
import 'package:agile_frontend/widget/drop_down.dart';
import 'package:agile_frontend/widget/line.dart';
import 'package:agile_frontend/widget/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BestReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.grey[400],
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Review',
          style: TextStyle(
            color: Colors.black, // Set the color of the title text
          ),
        ),
        backgroundColor: Colors.white, // Set the background color of the AppBar
        elevation: 0, // Removes the shadow from the AppBar
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
      body: Consumer<HouseReviewDataProviderService>(
          builder: (context, houseReviewData, child) {
        House house =
            Provider.of<HouseDataProviderService>(context, listen: false)
                .houses[houseReviewData.houseIdWithBestReview]!;

        String houseName = house.name;
        String houseId = house.id;
        List<HouseReview> houseReviews =
            houseReviewData.getHouseReviewsByHouseIdOrderByAgree(houseId);

        double averageRating = (houseReviews
                .map((e) =>
                    (e.communicationWithLandlordRating +
                        e.indoorEnvironmentRating +
                        e.outdoorEnvironmentRating +
                        e.similarityToTheProvidedInfoRating +
                        e.sunlightExposureRating) /
                    100)
                .reduce((value, element) => value + element)) /
            houseReviews.length;

        return ListView(
          children: [
            Line(
                context: context,
                width: Screen.designToScreenWidth(context, 390)),
            Padding(
              padding: EdgeInsets.only(
                  left: Screen.designToScreenWidth(context, 20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: Screen.designToScreenWidth(context, 220),
                        child: Text(
                          houseName,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      DropdownWidget(),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        '${averageRating.toPrecision(1)}',
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(width: Screen.designToScreenWidth(context, 8)),
                      RatingBarIndicator(
                        rating: averageRating.toPrecision(1),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.orange[300],
                        ),
                        itemCount: 5,
                        itemSize: 21.0,
                        unratedColor: Colors.grey[300],
                        direction: Axis.horizontal,
                      ),
                      SizedBox(width: Screen.designToScreenWidth(context, 8)),
                    ],
                  ),
                  SizedBox(height: Screen.designToScreenHeight(context, 20)),
                  // create a text with background orage and white text say best
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.orange[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'Best',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),

                  Column(
                    children: houseReviews.map(
                      (e) {
                        return ReviewCard(
                          rating: ((e.communicationWithLandlordRating +
                                      e.indoorEnvironmentRating +
                                      e.outdoorEnvironmentRating +
                                      e.similarityToTheProvidedInfoRating +
                                      e.sunlightExposureRating) /
                                  100)
                              .toPrecision(1),
                          title: e.generalReview,
                          satisfactoryText: e.satisfactionReview,
                          dissatisfactoryText: e.dissatisfactionReview,
                          agreeCount: e.agree,
                          disagreeCount: e.disagree,
                          icon: Icons.home, // Replace with a suitable icon
                        );
                      },
                    ).toList(),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
