import 'package:culture_app/pages/Map.dart';
import 'package:culture_app/pages/ProfilePage.dart';
import 'package:culture_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class Navigation1 extends StatefulWidget {
  const Navigation1({super.key});

  @override
  State<Navigation1> createState() => _NavigatorState();
}

int _selectedIndex = 0;
const List<Widget> _pages = <Widget>[HomePage(), Map1(), ProfilePage()];

class _NavigatorState extends State<Navigation1> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int currentIndex = 0;
  void onTabTapped(int index) {
    setState(
      () {
        currentIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = <Widget>[
      HomePage(),
      ProfilePage(),
    ];
    return Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: _children,
        ),
        bottomNavigationBar: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                  child: GNav(
                    // rippleColor: Colors.white,
                    // hoverColor: Colors.white,
                    // Color.fromARGB(255, 155, 226, 61)
                    gap: 8,
                    activeColor: Colors.black,
                    iconSize: 32,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    duration: Duration(milliseconds: 400),
                    tabBackgroundColor: Color(0xffDFEEEB),
                    color: Colors.black,
                    tabs: const [
                      GButton(
                        icon: LineIcons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: LineIcons.user,
                        text: 'Profile',
                      ),
                    ],

                    selectedIndex: currentIndex,
                    onTabChange: onTabTapped,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
