import 'package:flutter/material.dart';
import 'package:culture_app/custom/custom_icons.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: InkWell(
        onDoubleTap: () {
          _showBottomSheet();
        },
        child: Stack(fit: StackFit.expand, children: [
          Image.asset(
            "assets/images/pic7.jpeg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 8, left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white70,
                    size: 30.0,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white70,
                    size: 30.0,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 190, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Maldives \n Tour',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    letterSpacing: 1.1,
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: "Sans-Regular")),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.schedule,
                      color: Colors.white70,
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    Text('30 DAYS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Sans-Regular")),
                    SizedBox(width: 20),
                    Icon(
                      Icons.outlined_flag,
                      color: Colors.white70,
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    Text('862 KM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Sans-Regular")),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Islam was introduced to the Maldivian\n archipelago in the 12th century which \n was consolidated as a sultanate,\n developing strong commercial \n and cultural',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: "Sans-Regular")),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite_border,
                      color: Colors.white70,
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    Text('295',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: "Sans-Regular")),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 600),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    _buildImage('assets/images/pic7.jpeg'),
                    _buildImage('assets/images/pic9.jpeg'),
                    _buildImage('assets/images/pic11.jpeg'),
                    _buildImage('assets/images/pic12.jpeg'),
                    _buildImage('assets/images/pic13.jpeg'),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          imagePath,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Card(
          margin: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            children: <Widget>[
              FloatingActionButton(
                elevation: 5,
                child: Icon(Icons.near_me,
                  size: 30, color: Color(0xFF0097a7)),
                backgroundColor: Colors.white,
                onPressed: () {},
              ),
              SizedBox(height: 20),
              Text('Maldives Tour',
                textAlign: TextAlign.left,
                style: TextStyle(
                  letterSpacing: 1.1,
                  color: Colors.black87,
                  fontSize: 30,
                  fontFamily: "Sans-Semi-Bold")),
              SizedBox(height: 20),
              Text(
                'Islam was introduced to the Maldivian \narchipelago in the 12th century which was\nconsolidated as a sultanate ',
                style: TextStyle(
                  color: Colors.black26,
                  letterSpacing: 1,
                  height: 1.25,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: "Sans-Regular")),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildBottomSheetButton(Icons.chat_bubble, '24'),
                  _buildBottomSheetButton(Icons.favorite, '65'),
                  _buildBottomSheetButton(Icons.star_border, '17'),
                  _buildBottomSheetButton(Icons.whatshot, '80'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  _buildUserAvatar('assets/images/user1.png'),
                  _buildUserAvatar('assets/images/user2.png'),
                  _buildUserAvatar('assets/images/user3.png'),
                  Spacer(),
                  Container(
                    width: 60,
                    height: 60,
                    child: Icon(
                      CustomIcons.option,
                      size: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFe0f2f1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildLocationCard(),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 80, 82, 83),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Color(0xFF1565c0)),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Commence The Tour',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFffffff),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "Sans-Regular")),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetButton(IconData icon, String text) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            icon,
            color: Color(0xFF37474f),
            size: 25,
          ),
          onPressed: () {},
        ),
        Text(text,
          style: TextStyle(
            color: Color(0xFF37474f),
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: "Sans-Regular")),
      ],
    );
  }

  Widget _buildUserAvatar(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        imagePath,
        height: 60,
        width: 60,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildLocationCard() {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      color: Color(0xaaf5f5f5),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              child: Icon(
                Icons.location_on,
                color: Color(0xFFb39ddb),
                size: 30,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFf3e5f5),
              ),
            ),
            SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('From',
                  style: TextStyle(
                    color: Color(0xFF757575),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: "Sans-Regular")),
                SizedBox(height: 5),
                Text('Beijing',
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: "Sans-Regular")),
              ],
            ),
            SizedBox(width: 80),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('To',
                  style: TextStyle(
                    color: Color(0xFF757575),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: "Sans-Regular")),
                SizedBox(height: 5),
                Text('Maldives',
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: "Sans-Regular")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
