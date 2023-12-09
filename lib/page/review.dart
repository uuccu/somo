// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          color: Colors.grey[600],
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 240, // Adjusted height for image carousel
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8, // The number of images in the horizontal list
              itemBuilder: (context, index) {
                return Image.asset('asset/image/room1.png', // Changed to 'assets/' according to Flutter's default asset directory
                  width: MediaQuery.of(context).size.width, // Use the full width of the screen
                  fit: BoxFit.cover, // This will cover the given width, preserving the aspect ratio
                );
              },
              padding: EdgeInsets.zero, // Set padding to zero
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
            // make the margin smaller
            margin: EdgeInsets.only(left: 16, top: 10.0, right: 290),
            // make it in the center
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0), // Border color and width 
            ),
            child: Text(
              'home no. 20231116',
              style: TextStyle(
                fontSize: 10.0, // Font size // Font weight
                color: Colors.black, // Text color
              ),
            ),
          ),
        
      Padding (
        padding: const EdgeInsets.only(left:  16.0, right: 16.0, top: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '604 street 02',
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
                      Text('One room'),
                      SizedBox(width: 16), // Space between items
                      Icon(Icons.filter_none, color: Colors.orange), 
                      SizedBox(width: 4), // Space between icon and text
                      Text('3 floors in total'),
                    ],
                  ),
                ],
              ),
            ),
            LikeButton(likes: 105),
          ],
        ),
      ),

          ReviewSection(),
          SizedBox(height: 3),
          //  a vertical line between reviews indent 16 and endIndent 16
          Divider(
            color: Colors.grey[300],
            thickness: 0.5,
            indent: 16,
            endIndent: 16,
          ),
          BestReviewSection(),
          // Add more widgets as needed for your layout
        ],
      ),
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:  16.0, right: 16.0, top: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Review (30)',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                '4.0',
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
          SizedBox(height: 3),
          //  a vertical line between reviews
          Divider(
            color: Colors.grey[300],
            thickness: 0.5,
          ),
          SizedBox(height: 3),
          Text(
            'Rating by category',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          RatingCategory(title: 'Indoor environtment', rating: 4.1),
          RatingCategory(title: 'Communication with the landlord', rating: 3.9),
          RatingCategory(title: 'Similarity to the provided info', rating: 4.2),
          RatingCategory(title: 'Sunlight exposure', rating: 3.8),
        ],
      ),
    );
  }
}

class RatingCategory extends StatelessWidget {
  final String title;
  final double rating;

  const RatingCategory({Key? key, required this.title, required this.rating}) : super(key: key);

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



class BestReviewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best review',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BestReviewPage()),
                  );
                },
                child: Text(
                  'see more >',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                '3.0',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(width: 8),
              RatingBarIndicator(
                rating: 3.0,
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Text(
              '[Decent condition among the houses nearby]',
            ),
          ),
          Text(
            'Satisfactory aspects',
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
          Text('there were not many major issues.'),
          SizedBox(height: 3),
          Text(
            'Dissatisfactory aspects',
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
          Text('The landlord is not responsive to communication.'),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

class BestReviewPage extends StatelessWidget {
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
          'Review',
          style: TextStyle(
            color: Colors.black, // Set the color of the title text
            // Add other TextStyle properties as needed
          ),
        ),
        backgroundColor: Colors.white, // Set the background color of the AppBar
        elevation: 0, // Removes the shadow from the AppBar
      ),
      // divider line
      // make a floating action button add icon
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to be taken when button is pressed
        },
        child: Icon(Icons.add), // The '+' icon
        backgroundColor: Colors.orange, // The background color of the button
      ),
      body: ListView(
        children: [
          Divider(
            color: Colors.grey[300],
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 5), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '604 street 02, phnom penh',
                      style: TextStyle(
                      fontSize: 17,
                      ),
                      
                    ),
                    SizedBox(width: 19),
                    DropdownWidget(),
                    ],
                ),
                
                Row(
                  children: [
                    Text(
                      '4.0',
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
                SizedBox(height: 20),
                // create a text with background orage and white text say best
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.orange[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Best',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                ReviewCard(
                  rating: 3.0,
                  title: 'Decent condition among the houses nearby',
                  satisfactoryText: 'there were not many major issues.',
                  dissatisfactoryText: 'The landlord is not responsive to communication, and there were instances where problems arose, but the response was slow. there instances where problems arose, but the response was slow. There were times when I had to handle issues on my own.',
                  agreeCount: 57,
                  disagreeCount: 4,
                  icon: Icons.percent, // Replace with a suitable icon
                ),

                ReviewCard(
                  rating: 2.0,
                  title: 'Consider this house as a last resort',
                  satisfactoryText: 'It\'s a typical one-room apartment, and the condition is not too bad.',
                  dissatisfactoryText: 'Due to the lack of communication with the landlord, I couldn\'t resolve issues that arose in the house.',
                  agreeCount: 45,
                  disagreeCount: 6,
                  icon: Icons.home, // Replace with a suitable icon
                ),
                ReviewCard(
                  rating: 4.0,
                  title: 'Cost-effective house',
                  satisfactoryText: 'Recommended for those experiencing their first independence. It\'s challenging to find a house with these condition at this price.',
                  dissatisfactoryText: 'There was a serious noise insulation problem.',
                  agreeCount: 30,
                  disagreeCount: 9,
                  icon: Icons.turn_right_rounded, // Replace with a suitable icon
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}


class DropdownWidget extends StatefulWidget {
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String dropdownValueTotal = 'Total';
  String dropdownValueSorting = 'Sorting';

  @override
  Widget build(BuildContext context) {
    return Row (
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.0), // Reduced padding
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
            icon: Icon(Icons.keyboard_arrow_down_sharp, size: 20), // Smaller icon size
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
                child: Row (
                  children: [
                    Star(),
                    SizedBox(width: 1),
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
                
        SizedBox(width: 5),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.0), // Reduced padding
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
            icon: Icon(Icons.keyboard_arrow_down_sharp, size: 20), // Smaller icon size
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


// create widget of display a star icon
class Star extends StatelessWidget {
  const Star({
    Key? key,
  }) : super(key: key); // Constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.star,
        color: Colors.orange[300],
        size: 9,
      ),
    );
  } 
}


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
                SizedBox(width: 8),
                Text(
                  '$rating',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(width: 8),
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
                SizedBox(width: 41),
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
            SizedBox(height: 5),
            Text(
              '[$title]',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Satisfactory aspects',
              style: TextStyle(
                color: Colors.orange,
              ),
            ),
            Text(satisfactoryText),
            SizedBox(height: 5),
            Text(
              'Dissatisfactory aspects',
              style: TextStyle(
                color: Colors.orange,
              ),
            ),
            Text(dissatisfactoryText),
            SizedBox(height: 8),
            Divider(
              color: Colors.grey[300],
              thickness: 1,

            ),
          ],
      );
  }
}