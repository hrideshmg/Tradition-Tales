import 'dart:math';
import 'package:culture_app/custom/custom_icons.dart';
import 'package:culture_app/data/data.dart';
import 'package:culture_app/pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'details_page.dart';
import 'Map.dart';

class element {
  element(this.image_path, this.page);
  final String image_path;
  final Widget page;
}

List <element> elements = [element("assets/images/pic7.jpeg", DetailsPage()), element("assets/images/pic7.jpeg",Placeholder())];
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}
var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _HomePageState extends State<HomePage> {
  var currentPage = images.length - 1.0;
  var title;
  var desc;
  var image;
  var rate;
  int _index = 0;
  void _incrementTab(index) {
    setState(() {
      _index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
            Color(0xFFe1f5fe),
            Color(0xFFffffff),
          ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        appBar: AppBar(
  automaticallyImplyLeading: false, // Ensure no default back button
  titleSpacing: 0, // Reduce spacing between title and actions
  title: Padding(padding: EdgeInsets.all(8) ,child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Namaste",
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontFamily: "Sans-Bold",
          letterSpacing: 1,
        ),
      ),
      IconButton(
        icon: Icon(
          CustomIcons.option,
          color: Colors.black87,
          size: 10,
        ),
        onPressed: () {

        },
      ),
    ],
  ),
))
          ,body:PageView( 
            children: [ 
          SafeArea(
            child:  
          SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        child:  Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 8, bottom: 8),
                          alignment: Alignment.center,
                          child: Text('Festivals',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Sans-Semi-Bold",
                              )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              shape: BoxShape.rectangle,
                              color: Color(0xFF1565c0)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 8, bottom: 8),
                          alignment: Alignment.center,
                          child: Text('Rituals',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontFamily: "Sans-Semi-Bold",
                              )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              shape: BoxShape.rectangle,
                              color: Color(0xFFe0f2f1)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 8, bottom: 8),
                          alignment: Alignment.center,
                          child: Text('Artifacts',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontFamily: "Sans-Semi-Bold",
                              )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              shape: BoxShape.rectangle,
                              color: Color(0xFFe0f2f1)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 8, bottom: 8),
                          alignment: Alignment.center,
                          child: Text('India',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontFamily: "Sans-Semi-Bold",
                              )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              shape: BoxShape.rectangle,
                              color: Color(0xFFe0f2f1)),
                        ),
                      ),
                    ],
                  ),
                ),
                 Stack(
                    children: <Widget>[
                      CardScrollWidget(currentPage),
                      Positioned.fill(
                        child: PageView.builder(
                          itemCount: elements.length,
                          controller: controller,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Container();
                          },
                        ),
                      )
                    ],
                  ),
                
              ],
            ),
          )),

          SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        child:  Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 8, bottom: 8),
                          alignment: Alignment.center,
                          child: Text('Festivals',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Sans-Semi-Bold",
                              )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              shape: BoxShape.rectangle,
                              color: Color(0xFF1565c0)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 8, bottom: 8),
                          alignment: Alignment.center,
                          child: Text('Rituals',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontFamily: "Sans-Semi-Bold",
                              )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              shape: BoxShape.rectangle,
                              color: Color(0xFFe0f2f1)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 8, bottom: 8),
                          alignment: Alignment.center,
                          child: Text('Artifacts',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontFamily: "Sans-Semi-Bold",
                              )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              shape: BoxShape.rectangle,
                              color: Color(0xFFe0f2f1)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 8, bottom: 8),
                          alignment: Alignment.center,
                          child: Text('India',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontFamily: "Sans-Semi-Bold",
                              )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              shape: BoxShape.rectangle,
                              color: Color(0xFFe0f2f1)),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  
                  child: Stack(
                    children: <Widget>[
                      CardScrollWidget(currentPage),
                      Positioned.fill(
                        child: Container())
                    ],
                  ),
                ),
              ],
            ),
          ),
          ])),
    );
  }
}

// ignore: must_be_immutable
class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = [];

        for (var i = 0; i < elements.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
         
              
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3.0, 6.0),
                        blurRadius: 10.0)
                  ]),
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.asset(elements[i].image_path, fit: BoxFit.cover),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.star_border,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: Text(titles[i],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: "SourceSansPro-Regular")),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                
                              ],
                            ),
                          )
                        ],
                      ),
                    
                
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}

