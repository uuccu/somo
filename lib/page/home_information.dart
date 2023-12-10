import 'dart:math';

import 'package:agile_frontend/page/house_review_page.dart';
import 'package:agile_frontend/routing/bottom_bar_routing_page.dart';
import 'package:agile_frontend/service/agent_data_provider_service.dart';
import 'package:agile_frontend/service/agent_data_review_provider_service.dart';
import 'package:agile_frontend/service/house_data_provider_service.dart';
import 'package:agile_frontend/util/db/entity/agent.dart';
import 'package:agile_frontend/util/db/entity/agent_review.dart';
import 'package:agile_frontend/util/db/entity/house.dart';
import 'package:agile_frontend/util/db/firebase_storage.dart';
import 'package:agile_frontend/util/device/screen.dart';
import 'package:agile_frontend/widget/build_house_list.dart';
import 'package:agile_frontend/widget/heart_painter.dart';
import 'package:agile_frontend/widget/home_no_box.dart';
import 'package:agile_frontend/widget/house_image_widget.dart';
import 'package:agile_frontend/widget/line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeInformation extends StatefulWidget {
  const HomeInformation({Key? key}) : super(key: key);

  @override
  _HomeInformationState createState() => _HomeInformationState();
}

class _HomeInformationState extends State<HomeInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<HouseDataProviderService>(
            builder: (context, houseData, child) {
          int index = houseData.homeInformationIndex;
          House house = houseData.houses[index.toString()]!;
          return Column(
            children: [
              HouseImageWidget(house: house),
              Padding(
                  padding: EdgeInsets.only(
                      top: Screen.designToScreenHeight(context, 14))),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: Screen.designToScreenWidth(context, 20))),
                  GestureDetector(
                    onTap: () {
                      Get.to(HouseReviewPage());
                    },
                    child: HomeNoBox(house: house),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: Screen.designToScreenHeight(context, 7))),
              Row(children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: Screen.designToScreenWidth(context, 20))),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: house.price,
                          style: const TextStyle(fontSize: 30.0)),
                      const TextSpan(
                          text: ' per month', style: TextStyle(fontSize: 20.0)),
                      TextSpan(
                        text:
                            '\n${house.floor} floor, near RUPP, large hallway',
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: Screen.designToScreenWidth(context, 90))),
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
              ]),
              Padding(
                  padding: EdgeInsets.only(
                      top: Screen.designToScreenHeight(context, 20))),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: Screen.designToScreenWidth(context, 20))),
                  const Image(
                      image: AssetImage('asset/image/house_info/Room.png')),
                  Text("  ${house.type}      "),
                  const Image(
                      image: AssetImage('asset/image/house_info/Bathroom.png')),
                  Text("  ${house.type}      "),
                  const Image(
                      image: AssetImage('asset/image/house_info/Area.png')),
                  Text("  ${house.type}    "),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: Screen.designToScreenHeight(context, 14))),
              Container(
                width: Screen.designToScreenWidth(context, 445),
                height: Screen.designToScreenHeight(context, 10),
                color: const Color.fromRGBO(242, 242, 242, 1),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: Screen.designToScreenHeight(context, 16))),
              Container(
                padding: EdgeInsets.only(
                    left: Screen.designToScreenWidth(context, 20)),
                alignment: Alignment.centerLeft,
                child: const Text("Detailed Information",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: Screen.designToScreenHeight(context, 6))),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: Screen.designToScreenWidth(context, 20))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
                    children: [
                      const Text("room type"),
                      Line(context: context, width: 125),
                      const Text("floor"),
                      Line(context: context, width: 125),
                      const Text("size"),
                      Line(context: context, width: 125),
                      const Text("room & bathroom"),
                      Line(context: context, width: 125),
                      const Text("direction"),
                      Line(context: context, width: 125),
                      const Text("park"),
                      Line(context: context, width: 125),
                      const Text("occupancy date"),
                      Line(context: context, width: 125),
                      const Text("completion date"),
                      Line(context: context, width: 125)
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: Screen.designToScreenWidth(context, 43))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
                    children: [
                      Text("  ${house.type}"),
                      Line(context: context, width: 200),
                      Text("  ${house.floor} floor"),
                      Line(context: context, width: 200),
                      Text("  ${house.size} m²"),
                      Line(context: context, width: 200),
                      Text("  ${house.room} room (${house.bathroom} bathroom)"),
                      Line(context: context, width: 200),
                      Text("  ${house.direction}"),
                      Line(context: context, width: 200),
                      Text("  ${house.park} vehicle"),
                      Line(context: context, width: 200),
                      Text("  ${house.occupancyDate}"),
                      Line(context: context, width: 200),
                      Text(
                          "  ${house.completionDate.toLocal().toString().substring(0, 10)}"),
                      Line(context: context, width: 200)
                    ],
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: Screen.designToScreenHeight(context, 16))),
              Container(
                width: Screen.designToScreenWidth(context, 445),
                height: Screen.designToScreenHeight(context, 10),
                color: const Color.fromRGBO(242, 242, 242, 1),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: Screen.designToScreenHeight(context, 16))),
              Consumer<AgentDataProviderService>(
                  builder: (context, agentData, child) {
                Agent agent = agentData.agents[int.parse(house.agentId)];
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: Screen.designToScreenWidth(context, 20)),
                      alignment: Alignment.centerLeft,
                      child: Text(
                          agent.role == 'owner'
                              ? 'Houseowner Information'
                              : "Brokerage Information",
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: Screen.designToScreenHeight(context, 12))),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: Screen.designToScreenWidth(context, 20))),
                        FutureBuilder<String>(
                            future: FirebaseStorageUtil()
                                .getImageUrl(agent.photoUrl),
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return Container(
                                  width:
                                      Screen.designToScreenWidth(context, 70),
                                  height:
                                      Screen.designToScreenHeight(context, 70),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                      image: NetworkImage(snapshot.data!),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              }
                            }),
                        Padding(
                            padding: EdgeInsets.only(
                                left: Screen.designToScreenWidth(context, 21))),
                        Expanded(
                          child: Text(agent.name,
                              style: const TextStyle(fontSize: 18)),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: Screen.designToScreenWidth(context, 65))),
                        Consumer<AgentReviewDataProviderService>(
                            builder: (context, agentReviewData, child) {
                          List<AgentReview> agentReviews = agentReviewData
                              .agentReviews
                              .where((element) => element.agentId == agent.id)
                              .toList();
                          double average = 0;
                          if (agent.role == 'broker') {
                            average = agentReviews
                                    .map((e) => max(
                                        0,
                                        min(
                                            100,
                                            50 +
                                                e.agree -
                                                e.disagree))) // worst code, this null check is not good i know but i have no time
                                    .reduce((value, element) => value + element) /
                                (agentReviews.length);
                          } else {
                            average = agentReviews
                                    .map((e) =>
                                        e.propertyDiversityRating! +
                                        e.informationAccessibilityRating! +
                                        e.customerServiceRating! +
                                        e.communicationRating! +
                                        e.facilitiesAndAmenitiesRating!) // worst code, this null check is not good i know but i have no time
                                    .reduce((value, element) => value + element) /
                                (agentReviews.length * 20 * 5);
                          }
                          average = average.toPrecision(1);

                          int length = agentReviews.length;

                          return Column(
                            children: [
                              agent.role == 'owner'
                                  ? Text("$average",
                                      style: const TextStyle(
                                          fontSize: 40, color: Colors.orange))
                                  : Text("${average}kg",
                                      style: const TextStyle(
                                          fontSize: 33, color: Colors.orange)),
                              TextButton(
                                  onPressed: () {
                                    // todo review page routing
                                  },
                                  child: Text("$length reviews  >",
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.black))),
                            ],
                          );
                        }),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: Screen.designToScreenHeight(context, 10))),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: Screen.designToScreenWidth(context, 20))),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('address',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            Text('CEO',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 15)),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: Screen.designToScreenWidth(context, 48))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(agent.address,
                                style: const TextStyle(fontSize: 10)),
                            Text(agent.name,
                                style: const TextStyle(fontSize: 10)),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: Screen.designToScreenHeight(context, 11))),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: Screen.designToScreenWidth(context, 20))),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                Screen.designToScreenWidth(context, 225),
                                Screen.designToScreenHeight(context, 32)),
                            side: const BorderSide(
                                width: 1, color: Colors.transparent),
                            shadowColor: Colors.black,
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            surfaceTintColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text("Phone ${agent.phone}"),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: Screen.designToScreenWidth(context, 10))),
                        ElevatedButton(
                          onPressed: () async {
                            final url = Uri.parse('sms:${agent.phone}');
                            if (await canLaunchUrl(url)) {
                              launchUrl(url);
                            } else {
                              // ignore: avoid_print
                              print("Can't launch $url");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                Screen.designToScreenWidth(context, 155),
                                Screen.designToScreenHeight(context, 32)),
                            side: const BorderSide(
                                width: 1, color: Colors.transparent),
                            shadowColor: Colors.black,
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            surfaceTintColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text("Direct Message"), // todo direct
                        ),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: Screen.designToScreenHeight(context, 11))),
                    Container(
                      padding: EdgeInsets.only(
                          left: Screen.designToScreenWidth(context, 20)),
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            WidgetSpan(
                                child: Image(
                                    image: AssetImage(
                                        'asset/image/house_info/CircleCircle.png'))),
                            TextSpan(
                                text: ' The landlord\'s property description',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: Screen.designToScreenWidth(context, 20)),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        house.description,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    Line(
                        context: context,
                        width: Screen.designToScreenWidth(context, 390)),
                    Container(
                      padding: EdgeInsets.only(
                          left: Screen.designToScreenWidth(context, 20)),
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            WidgetSpan(
                                child: Image(
                                    image: AssetImage(
                                        'asset/image/house_info/CircleCircle.png'))),
                            TextSpan(
                                text: ' Rules of use',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: Screen.designToScreenWidth(context, 20)),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        house.rule,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    Line(
                        context: context,
                        width: Screen.designToScreenWidth(context, 390)),
                    Container(
                      padding: EdgeInsets.only(
                          left: Screen.designToScreenWidth(context, 20)),
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            WidgetSpan(
                                child: Image(
                                    image: AssetImage(
                                        'asset/image/house_info/CircleCircle.png'))),
                            TextSpan(
                                text:
                                    ' See other houses you might find interesting',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                    ),
                    const BuildHouseList()
                  ],
                );
              })
            ],
          );
        }),
      ),
      bottomNavigationBar: BottomBarRoutingPage(),
    );
  }
}
