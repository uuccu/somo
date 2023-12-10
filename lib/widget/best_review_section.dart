import 'package:agile_frontend/page/best_review_page.dart';
import 'package:agile_frontend/service/house_review_data_provider_service.dart';
import 'package:agile_frontend/util/db/entity/house.dart';
import 'package:agile_frontend/util/db/entity/house_review.dart';
import 'package:agile_frontend/util/device/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BestReviewSection extends StatelessWidget {
  final House house;

  const BestReviewSection({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HouseReviewDataProviderService>(
        builder: (context, houseReviewData, child) {
      String houseId = house.id;
      List<HouseReview> houseReviews =
          houseReviewData.getHouseReviewsByHouseIdOrderByAgree(houseId);
      HouseReview bestReview = houseReviews[0];
      double rating = (bestReview.communicationWithLandlordRating +
              bestReview.indoorEnvironmentRating +
              bestReview.outdoorEnvironmentRating +
              bestReview.similarityToTheProvidedInfoRating +
              bestReview.sunlightExposureRating) /
          100;
      return Padding(
        padding: EdgeInsets.only(left: Screen.designToScreenWidth(context, 20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Best review',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    houseReviewData.setHouseIdWithBestReview(houseId);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BestReviewPage()),
                    );
                  },
                  child: const Text(
                    'see more >',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Screen.designToScreenHeight(context, 5)),
            Row(
              children: [
                Text(
                  '${rating.toPrecision(1)}',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(width: Screen.designToScreenWidth(context, 5)),
                RatingBarIndicator(
                  rating: rating.toPrecision(1),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.orange[300],
                  ),
                  itemCount: 5,
                  itemSize: 21.0,
                  unratedColor: Colors.grey[300],
                  direction: Axis.horizontal,
                ),
                SizedBox(width: Screen.designToScreenWidth(context, 5)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Text(
                bestReview.generalReview,
              ),
            ),
            const Text(
              'Satisfactory aspects',
              style: TextStyle(
                color: Colors.orange,
              ),
            ),
            Text(bestReview.satisfactionReview),
            SizedBox(height: Screen.designToScreenHeight(context, 3)),
            const Text(
              'Dissatisfactory aspects',
              style: TextStyle(
                color: Colors.orange,
              ),
            ),
            Text(bestReview.dissatisfactionReview),
            SizedBox(height: Screen.designToScreenHeight(context, 15)),
          ],
        ),
      );
    });
  }
}
