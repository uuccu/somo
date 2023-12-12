// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors

import 'package:agile_frontend/page/finding_roommate/finding_roommate_condition.dart';
import 'package:agile_frontend/util/device/screen.dart';
import 'package:agile_frontend/widget/line.dart';
import 'package:agile_frontend/widget/search_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Community',
          style: TextStyle(
            color: Colors.black, // Set the color of the title text
            // Add other TextStyle properties as needed
          ),
        ),
        surfaceTintColor: Colors.white,
        backgroundColor:
            Colors.transparent, // Set the background color of the AppBar
        elevation: 0, // Removes the shadow from the AppBar
      ),
      // padding for body
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: Screen.designToScreenWidth(context, 20),
              right: Screen.designToScreenWidth(context, 20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // line divider
                Line(context: context, width: 390),
                SizedBox(height: Screen.designToScreenHeight(context, 8)),
                SearchScreen(),
                SizedBox(height: Screen.designToScreenHeight(context, 18)),
                BulletinBoard(),
                SizedBox(height: Screen.designToScreenHeight(context, 15)),
                HomeRating(),
                SizedBox(height: Screen.designToScreenHeight(context, 15)),
                FindingMate(),
                // ... Add more widgets here
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BulletinBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Bulletin board',
              style: TextStyle(fontSize: 18),
            ),
            trailing: TextButton(
              onPressed: () {
                // Handle "see more" action
              },
              child: Text(
                'see more >',
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ),
          PostBulletinBoard(
            avatar:
                'asset/image/user/pfp1.jpg', // replace with your asset image
            username: 'lovely_fresher',
            grade: '3rd grade | students',
            date: '2023.11.16.',
            title: 'Be careful!',
            content:
                'I got scammed at the agency in front of the school i trusted it but the agency is ...',
          ),
          PostBulletinBoard(
            avatar:
                'asset/image/user/pfp4.jpg', // replace with your asset image
            username: 'agile_win',
            grade: '2nd grade | students',
            date: '2023.11.14.',
            title: 'Who wants to sign a room here',
            content:
                'I had a situation so I left earlier than the contract period, but the condition of ...',
          ),
          SizedBox(height: Screen.designToScreenHeight(context, 8))
        ],
      ),
      elevation: 8,
    );
  }
}

class PostBulletinBoard extends StatelessWidget {
  final String avatar;
  final String username;
  final String grade;
  final String date;
  final String title;
  final String content;

  const PostBulletinBoard({
    Key? key,
    required this.avatar,
    required this.username,
    required this.grade,
    required this.date,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Column(
        children: [
          Row(
            children: [
              // avatar
              Padding(
                padding: EdgeInsets.only(
                  left: Screen.designToScreenWidth(context, 13),
                  right: Screen.designToScreenWidth(context, 13),
                  bottom: Screen.designToScreenHeight(context, 8),
                  top: Screen.designToScreenHeight(context, 8),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage(avatar),
                  radius: 20,
                ),
              ),
              // username, grade, date
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    grade,
                    style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                  ),
                  Text(
                    date,
                    style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                  ),
                ],
              ),
              Spacer(),
              // more button
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  // Handle "more" actions
                },
              ),
            ],
          ),
          // size box
          SizedBox(height: Screen.designToScreenHeight(context, 2)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  // color FFB34F
                  style: TextStyle(fontSize: 13, color: Colors.orange),
                ),
                Text(
                  content,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
      elevation: 0,
    );
  }
}

class HomeRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: Screen.designToScreenHeight(context, 8),
            ),
            height: Screen.designToScreenHeight(context, 40), // 원하는 높이로 설정하세요.
            child: Row(
              children: <Widget>[
                SizedBox(width: Screen.designToScreenWidth(context, 13)),
                Text(
                  'Home rating',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: Screen.designToScreenWidth(context, 150)),
                TextButton(
                  onPressed: () {
                    // Handle "see more" action
                  },
                  child: Text(
                    'see more >',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
          ),
          PostHomeRating(
            photo: 'asset/image/house/house1.jpg',
            address: '206 Street 06, Phnom Penh',
            avatar:
                'asset/image/user/pfp3.png', // replace with your asset image
            username: 'homie',
            grade: '4th grade | students',
            date: '2023.09.02.',
            title: 'Recommendation for Students New to the Area',
            satisfaction:
                'I contacted the landlord whenever issues arose, and the response was quick.',
            dissatisfaction:
                'There was significant noise between floors, causing discomfort at night.',
          ),
        ],
      ),
      elevation: 8,
    );
  }
}

class PostHomeRating extends StatelessWidget {
  final String photo;
  final String address;
  final String avatar;
  final String username;
  final String grade;
  final String date;
  final String title;
  final String satisfaction;
  final String dissatisfaction;

  const PostHomeRating({
    Key? key,
    required this.photo,
    required this.address,
    required this.avatar,
    required this.username,
    required this.grade,
    required this.date,
    required this.title,
    required this.satisfaction,
    required this.dissatisfaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Screen.designToScreenWidth(context, 13),
              // right: Screen.designToScreenWidth(context, 13),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        photo,
                        width: Screen.designToScreenWidth(context, 104),
                        height: Screen.designToScreenHeight(context, 112),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: Screen.designToScreenHeight(context, 9)),
                    Text(
                      address,
                      style: TextStyle(fontSize: 8),
                    ),
                  ],
                ),
                SizedBox(width: Screen.designToScreenWidth(context, 14)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: Screen.designToScreenWidth(context, 8)),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(avatar),
                            radius: 20,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              username,
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              grade,
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey[500]),
                            ),
                            Text(
                              date,
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey[500]),
                            ),
                          ],
                        ),
                        SizedBox(
                            width: Screen.designToScreenWidth(context, 48)),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                          onPressed: () {
                            // Handle "more" actions
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      width: Screen.designToScreenWidth(context, 215),
                      child: Text(
                        '[$title]',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Text(
                      'Satisfactory Aspects',
                      style: TextStyle(fontSize: 10, color: Colors.orange),
                    ),
                    SizedBox(
                      width: Screen.designToScreenWidth(context, 215),
                      child: Text(
                        satisfaction,
                        style: TextStyle(fontSize: 10),
                        softWrap: true,
                      ),
                    ),
                    Text(
                      'Dissatisfactory Aspects',
                      style: TextStyle(fontSize: 10, color: Colors.orange),
                    ),
                    SizedBox(
                      width: Screen.designToScreenWidth(context, 215),
                      child: Text(
                        dissatisfaction,
                        style: TextStyle(fontSize: 10),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: Screen.designToScreenHeight(context, 8)),
        ],
      ),
      elevation: 0,
    );
  }
}

class FindingMate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Finding roommates',
              style: TextStyle(fontSize: 18),
            ),
            trailing: TextButton(
              onPressed: () {
                Get.to(FindingRoommateConditionPage1());
              },
              child: Text(
                'see more >',
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ),
          PostFindingMate(
            photo: 'asset/image/house/house2.jpg',
            address: '206 Street 06, Phnom Penh',
            avatar:
                'asset/image/user/pfp5.jpg', // replace with your asset image
            username: 'bts_lover',
            grade: '1st grade | students',
            date: '2023.10.02.',
            title: 'Looking for a roommate who can live considerately',
            content:
                'Hello! I\'ve come here alone from the provinces and looking for a roommate to share accommodation.I\'m an early riser and I tend to clean the house \nfrequently. During exam periods, I might study until \nthe early morning, so I may need to keep the lights on late. Since it\'s a shared space, It would be ...',
          ),
        ],
      ),
      elevation: 8,
    );
  }
}

class PostFindingMate extends StatelessWidget {
  final String photo;
  final String address;
  final String avatar;
  final String username;
  final String grade;
  final String date;
  final String title;
  final String content;

  const PostFindingMate({
    Key? key,
    required this.photo,
    required this.address,
    required this.avatar,
    required this.username,
    required this.grade,
    required this.date,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Screen.designToScreenWidth(context, 13),
              // right: Screen.designToScreenWidth(context, 13),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      photo,
                      width: Screen.designToScreenWidth(context, 100),
                      height: Screen.designToScreenHeight(context, 120),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: Screen.designToScreenHeight(context, 4)),
                    Text(
                      address,
                      style: TextStyle(fontSize: 8),
                    ),
                  ],
                ),
                SizedBox(width: Screen.designToScreenWidth(context, 14)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(avatar),
                            radius: 20,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              username,
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              grade,
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey[500]),
                            ),
                            Text(
                              date,
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey[500]),
                            ),
                          ],
                        ),
                        SizedBox(
                            width: Screen.designToScreenWidth(context, 48)),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      width: Screen.designToScreenWidth(context, 215),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 10, color: Colors.orange),
                      ),
                    ),
                    SizedBox(
                      width: Screen.designToScreenWidth(context, 215),
                      child: Text(
                        content,
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: Screen.designToScreenHeight(context, 8)),
        ],
      ),
      elevation: 0,
    );
  }
}
