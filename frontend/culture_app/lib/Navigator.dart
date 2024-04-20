import 'package:culture_app/pages/Map.dart';
import 'package:culture_app/pages/ProfilePage.dart';
import 'package:culture_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class Navigation1 extends StatefulWidget {
  const Navigation1({super.key});

  @override
  State<Navigation1> createState() => _NavigatorState();
}

int _selectedIndex = 0;
 const List<Widget> _pages = <Widget>[
  HomePage(),
  Map1(),
  ProfilePage()

];
class _NavigatorState extends State<Navigation1> {
  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            child: BottomNavigationBar(
               currentIndex: _selectedIndex, //New
  onTap: _onItemTapped,        
              backgroundColor: Colors.white,
              iconSize: 30,
              elevation: 2,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.room, color: Color(0xFF90a4ae)),
                    label: ''
                    ),
                    
                BottomNavigationBarItem(
                    icon: Icon(Icons.adjust, color: Color(0xFFcfd8dc)),
                      label: ''
                    ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline, color: Color(0xFFcfd8dc)),
                      label: ''
                    )
              ],
    
            ),
    ));
  }
}

  