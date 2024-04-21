import 'dart:math';
import 'package:culture_app/pages/DetailsPage8.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:culture_app/custom/custom_icons.dart';
import 'package:culture_app/data/data.dart';
import 'package:culture_app/pages/ProfilePage.dart';
import 'package:culture_app/pages/details_page2.dart';
import 'package:culture_app/pages/details_page3.dart';
import 'package:culture_app/pages/details_page4.dart';
import 'package:culture_app/pages/details_page5.dart';
import 'package:culture_app/pages/details_page5.dart';
import 'package:culture_app/pages/details_page6.dart';
import 'package:culture_app/pages/details_page7.dart';
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

List<element> Festivals = [
  element("assets/images/pic7.jpeg", DetailsPage(), "Vishu"),
  element("assets/images/pic13.jpeg", DetailsPage2(), "Theyyam"),
  element("assets/images/onam.jpg", DetailsPage3(), "Onam"),
  element("assets/images/diwali.png", DetailsPage4(), "Diwali"),
];

List<String> trivias = [
  "In Hindu mythology, Mahabali was a demon king belonging to the Asura (demon) clan. Despite being a demon, he was known for his righteousness and piety.",
  "While we might think of outhouses for ancient times, the Indus Valley Civilization had a surprisingly sophisticated toilet system around 2800 BC.",
  "The Rigveda, one of the oldest surviving texts, contains some of the earliest ideas about the cosmos. Believe it or not, it mentions our solar system!"
];

List<String> trivias1 = [
  "Ancient India boasted some of the world's first universities!  Taxila, founded around 600 BC, was a major center for learning, attracting students from far and wide.",
  "The Rigveda, one of the oldest surviving texts, contains some of the earliest ideas about the cosmos. Believe it or not, it mentions our solar system!",
  "Kalaripayattu, one of the oldest martial arts still practiced today, has its roots in Kerala, India. It's known for its flowing movements and weapons use.",
];

List<String> trivias2 = [
  "The Chola Dynasty built some of the most magnificent temples in India, including the Brihadeshwara Temple in Thanjavur.",
  "India has a rich history of textiles and clothing. Dhoti, Sari, and Kurta are just a few examples of traditional garments that are still worn today.",
  "Snakes and ladders isn't the only game with Indian origins. Pachisi, a board game involving racing pawns across a cross-shaped board, is believed to be an ancestor of Ludo and Parcheesi.",
];
List<element> Rituals = [
  element("assets/images/ritual1.jpeg", DetailsPage8(), "Pooja")
];

List<element> Epics = [
  element("assets/images/English.jpeg", DetailsPage5(), "Ramayana"),
  element("assets/images/jesus_cover.jpg", DetailsPage6(), "Bible"),
  element("assets/images/mahabharat_book.jpg", DetailsPage7(), "Mahabharat"),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

var cardAspectRatio = 13.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var currentPage = images.length - 1.0;
  var title;
  var desc;
  var image;
  var rate;
  int _index = 0;
  int _pageIndex = 0;
  late PageController _triviaPageController;
  late PageController _mainPageController;
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
    _triviaPageController = PageController();
    _tabController = TabController(length: trivias.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _triviaPageController.dispose();
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
              toolbarHeight: 120,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/image1.png",
                        width: 250,
                        height: 150,
                      )),
                ],
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
                              left: 15, right: 5, top: 4, bottom: 8),
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 8, bottom: 8),
                            alignment: Alignment.center,
                            child: Text(
                              'Festivals',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Sans-Semi-Bold",
                                ),
                              ),
                            ),
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
                            child: Text(
                              'Rituals',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: "Sans-Semi-Bold",
                                ),
                              ),
                            ),
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
                            child: Text(
                              'Epics',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: "Sans-Semi-Bold",
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              shape: BoxShape.rectangle,
                              color: Color(0xFFe0f2f1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      FestivalScrollWidget(currentPage),
                      Positioned.fill(
                        child: InkWell(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Festivals[_pageIndex].page))
                          },
                          child: PageView.builder(
                            itemCount: Festivals.length,
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
                        color: Color(0xffE6B45C)),
                    width: MediaQuery.of(context).size.width * 0.89,
                    height: MediaQuery.of(context).size.height * 0.18,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: PageView(
                            controller: _triviaPageController,
                            onPageChanged: _handlePageViewChanged,
                            children: [
                              for (String trivia in trivias)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(children: [
                                    Text(
                                      "Trivia",
                                      style: GoogleFonts.inter(
                                        textStyle:const TextStyle(
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
                            child: Text(
                              'Festivals',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: "Sans-Semi-Bold",
                                ),
                              ),
                            ),
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
                            child: Text(
                              'Rituals',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Sans-Semi-Bold",
                                ),
                              ),
                            ),
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
                            child: Text(
                              'Epics',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: "Sans-Semi-Bold",
                                ),
                              ),
                            ),
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
                      RitualScrollWidget(currentPage),
                      Positioned.fill(
                        child: InkWell(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Rituals[_pageIndex].page))
                          },
                          child: PageView.builder(
                            itemCount: Rituals.length,
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
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffE6B45C)),
                    width: MediaQuery.of(context).size.width * 0.89,
                    height: MediaQuery.of(context).size.height * 0.18,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: PageView(
                            controller: _triviaPageController,
                            onPageChanged: _handlePageViewChanged,
                            children: [
                              for (String trivia in trivias1)
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
            ),
            SafeArea(
                child: SingleChildScrollView(
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
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 8, bottom: 8),
                                alignment: Alignment.center,
                                child: Text(
                                  'Festivals',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: "Sans-Semi-Bold",
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    shape: BoxShape.rectangle,
                                    color: Color(0xFFe0f2f1)),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 8, bottom: 8),
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 8, bottom: 8),
                            alignment: Alignment.center,
                            child: Text(
                              'Rituals',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: "Sans-Semi-Bold",
                                ),
                              ),
                            ),
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
                            child: Text(
                              'Epics',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Sans-Semi-Bold",
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                shape: BoxShape.rectangle,
                                color: Color(0xFF1565c0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      EpicScrollWidget(currentPage),
                      Positioned.fill(
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Epics[_pageIndex].page))
                          },
                          child: PageView.builder(
                            itemCount: Epics.length,
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
                        color: Color(0xffE6B45C)),
                    width: MediaQuery.of(context).size.width * 0.89,
                    height: MediaQuery.of(context).size.height * 0.18,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: PageView(
                            controller: _triviaPageController,
                            onPageChanged: _handlePageViewChanged,
                            children: [
                              for (String trivia in trivias2)
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
            ))
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
    _triviaPageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}

// ignore: must_be_immutable
class FestivalScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  FestivalScrollWidget(this.currentPage);

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

        for (var i = 0; i < Festivals.length; i++) {
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
                decoration: BoxDecoration(color: Colors.black, boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(25.0, 25.0),
                      blurRadius: 0.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(Festivals[i].image_path, fit: BoxFit.cover),
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
                              child: Text(Festivals[i].title,
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
      padding: const EdgeInsets.all(0.0),
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

class EpicScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  EpicScrollWidget(this.currentPage);

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

        for (var i = 0; i < Epics.length; i++) {
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
                      Image.asset(Epics[i].image_path, fit: BoxFit.cover),
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
                              child: Text(Epics[i].title,
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

class RitualScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  RitualScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, contraints) {
          var width = contraints.maxWidth;
          var height = contraints.maxHeight;

          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;

          List<Widget> cardList = [];

          for (var i = 0; i < Rituals.length; i++) {
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
                        Image.asset(Rituals[i].image_path, fit: BoxFit.cover),
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
                                child: Text(Rituals[i].title,
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
                                            color:
                                                Color.fromARGB(125, 0, 0, 255),
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
        },
      ),
    );
  }
}
