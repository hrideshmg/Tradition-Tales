import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:culture_app/custom/custom_icons.dart';
import 'package:culture_app/data/data.dart';
import 'package:culture_app/pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'details_page.dart';
import 'Map.dart';

class element {
  element(this.image_path, this.page, this.title);
  final String image_path;
  final Widget page;
  final String title;
}

List<element> elements = [
  element("assets/images/pic7.jpeg", DetailsPage(), "Vishu"),
  element("assets/images/pic13.jpeg", Placeholder(), "Theyyam")
];

List<String> trivias = [
  "In Hindu mythology, Mahabali was a demon king belonging to the Asura (demon) clan. Despite being a demon, he was known for his righteousness and piety.",
  "While we might think of outhouses for ancient times, the Indus Valley Civilization had a surprisingly sophisticated toilet system around 2800 BC.",
  "The Rigveda, one of the oldest surviving texts, contains some of the earliest ideas about the cosmos. Believe it or not, it mentions our solar system!"
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var currentPage = images.length - 1.0;
  var title;
  var desc;
  var image;
  var rate;
  int _index = 0;
  int _pageIndex = 0;
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;
  void _incrementTab(index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: trivias.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    PageController triviaController = PageController(initialPage: 0);
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
              title: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Namaste",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "inter",
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          body: PageView(children: [
            SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 5, top: 8, bottom: 8),
                          child: Container(
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
                              left: 5, right: 5, top: 8, bottom: 8),
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
                              left: 5, right: 5, top: 8, bottom: 8),
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
                              left: 5, right: 12, top: 8, bottom: 8),
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
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        elements[_pageIndex].page))
                          },
                          child: PageView.builder(
                            itemCount: elements.length,
                            controller: controller,
                            reverse: true,
                            onPageChanged: (page_index) => {
                              setState(() {
                                _pageIndex = page_index;
                              })
                            },
                            itemBuilder: (context, index) {
                              return Container();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff13CA9E)),
                    width: MediaQuery.of(context).size.width * 0.89,
                    height: MediaQuery.of(context).size.height * 0.18,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: PageView(
                            controller: _pageViewController,
                            onPageChanged: _handlePageViewChanged,
                            children: [
                              for (String trivia in trivias)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(children: [
                                    Text(
                                      "Trivia",
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      trivia,
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 18, height: 1.1)),
                                    )
                                  ]),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  PageIndicator(
                    tabController: _tabController,
                    currentPageIndex: _currentPageIndex,
                    onUpdateCurrentPageIndex: _updateCurrentPageIndex,
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
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 8, bottom: 8),
                            alignment: Alignment.center,
                            child: Text('Festivals',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
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
                            child: Text('Rituals',
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
                ],
              ),
            ),
          ])),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
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
                              size: 35,
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
                              child: Text(elements[i].title,
                                  style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 3.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                        Shadow(
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 8.0,
                                          color: Color.fromARGB(125, 0, 0, 255),
                                        ),
                                      ],
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

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 0) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex - 1);
            },
            icon: const Icon(
              Icons.arrow_left_rounded,
              size: 32.0,
            ),
          ),
          TabPageSelector(
            controller: tabController,
            color: colorScheme.background,
            selectedColor: colorScheme.primary,
          ),
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 2) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex + 1);
            },
            icon: const Icon(
              Icons.arrow_right_rounded,
              size: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}
