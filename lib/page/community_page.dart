// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors

import 'package:flutter/material.dart';


class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          // icon like <
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.grey[400],
          onPressed: () => Navigator.of(context).pop(),
        ),
        // add text and go to center
        centerTitle: true,
        title: Text(
          'Community',
          style: TextStyle(
            color: Colors.black, // Set the color of the title text
            // Add other TextStyle properties as needed
          ),
        ),
        backgroundColor: Colors.white, // Set the background color of the AppBar
        elevation: 0, // Removes the shadow from the AppBar
      ),
      // padding for body
      body: ListView(
        children: <Widget>[
          Padding (
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // line divider
                Divider(height: 1, color: Colors.grey[300]),
                SizedBox(height: 8),
                SearchWidget(),
                BulletinBoard(),
                HomeRating(),
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


class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // size the container smaller
      height: 35,
      padding: EdgeInsets.symmetric(horizontal: 8), // Add horizontal padding
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 7), // Add some margin
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the search bar
        borderRadius: BorderRadius.circular(10), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 7, // Blur radius
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        // make it center vertically
        decoration: InputDecoration(
          hintText: 'Search whatever you want!',
          // color hint text
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15),
          prefixIcon: Icon(Icons.search, color: Colors.orange , size: 18),
          // make the icon smaller
          prefixIconConstraints: BoxConstraints(
            minWidth: 30,
            minHeight: 18,
          ),
          border: InputBorder.none, // Remove border
        ),
      ),
    );
  }
}

class BulletinBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card (
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
            avatar: 'asset/image/user/pfp1.jpg', // replace with your asset image
            username: 'lovely_fresher',
            grade: '3rd grade | students',
            date: '2023.11.16.',
            title: 'Be careful!',
            content: 'I got scammed at the agency in front of the school i trusted it but the agency is ...',
          ),
          PostBulletinBoard(
            avatar: 'asset/image/user/pfp4.jpg', // replace with your asset image
            username: 'agile_win',
            grade: '2nd grade | students',
            date: '2023.11.14.',
            title: 'Who wants to sign a room here',
            content: 'I had a situation so I left earlier than the contract period, but the condition of ...',
          ),
          SizedBox(height: 8)
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
      child: Column(
        children: [
          Row(
            children: [
              // avatar
              Padding(
                padding: EdgeInsets.all(8),
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
          SizedBox(height: 2),
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
    return Card (
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Home rating',
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
          PostHomeRating(
            photo: 'asset/image/house/house1.jpg',
            address: '206 Street 06, Phnom Penh',
            avatar: 'asset/image/user/pfp3.png', // replace with your asset image
            username: 'homie',
            grade: '4th grade | students',
            date: '2023.09.02.',
            title: 'Recommendation for Students New to the Area',
            satisfaction: 'I contacted the landlord whenever issues arose, and \nthe response was quick.',
            dissatisfaction: 'There was significant noise between floors, causing \ndiscomfort at night.',
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
      child: Column(
        children: [
          // size box
          SizedBox(height: 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                // put the image 
                Column(
                  children: [
                    Container(
                      // create the image from photo
                      child: Image.asset(
                        photo,
                        width: 100,
                        height: 120,
                        fit: BoxFit.cover,
                        
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                    address,
                    style: TextStyle(fontSize: 8),
                  ),
                  ],
                  
                ),
                
                SizedBox(width: 14),
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // avatar
                      Padding(
                        padding: EdgeInsets.only(right: 8),
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
                      SizedBox(width: 48),
                      // more button
                      IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {
                          // Handle "more" actions
                        },
                      ),
                    ],
                  ),
                  Text(
                    '[$title]',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    'Satisfactory Aspects',
                    style: TextStyle(fontSize: 10, color: Colors.orange),
                  ),
                  Text(
                    satisfaction,
                    style: TextStyle(fontSize: 10),

                  ),
                  Text(
                    'Dissatisfactory Aspects',
                    style: TextStyle(fontSize: 10, color: Colors.orange),
                  ),
                  Text(
                    dissatisfaction,
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              ],
            ),
          ),
          SizedBox (height: 8),
        ],
      ),
      elevation: 0,
    );
  }
}


class FindingMate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card (
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Finding roommates',
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
          PostFindingMate(
            photo: 'asset/image/house/house2.jpg',
            address: '206 Street 06, Phnom Penh',
            avatar: 'asset/image/user/pfp5.jpg', // replace with your asset image
            username: 'bts_lover',
            grade: '1st grade | students',
            date: '2023.10.02.',
            title: 'Looking for a roommate who can live considerately',
            content: 'Hello! I\'ve come here alone from the provinces and \nlooking for a roommate to share accommodation. \nI\'m an early riser and I tend to clean the house \nfrequently. During exam periods, I might study until \nthe early morning, so I may need to keep the lights \non late. Since it\'s a shared space, It would be ...',
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
      child: Column(
        children: [
          // size box
          SizedBox(height: 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                // put the image 
                Column(
                  children: [
                    Container(
                      // create the image from photo
                      child: Image.asset(
                        photo,
                        width: 100,
                        height: 120,
                        fit: BoxFit.cover,
                        
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                    address,
                    style: TextStyle(fontSize: 8),
                  ),
                  ],
                  
                ),
                
                SizedBox(width: 14),
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // avatar
                      Padding(
                        padding: EdgeInsets.only(right: 8),
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
                      SizedBox(width: 48),
                      // more button
                      IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {
                          // Handle "more" actions
                        },
                      ),
                    ],
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 10, color: Colors.orange),
                  ),
                  Text(
                    content,
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              ],
            ),
          ),
          SizedBox (height: 8),
        ],
      ),
      elevation: 0,
    );
  }
}
