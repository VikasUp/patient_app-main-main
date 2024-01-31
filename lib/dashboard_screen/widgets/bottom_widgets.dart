import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabTapped;

  const MyBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTabTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Container(
      height: 80.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20.0,
            spreadRadius: 10.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GNav(
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
                GButton(
                  icon: Icons.note,
                  text: 'Pick',
                ),
                GButton(
                  icon: Icons.shopping_bag,
                  text: 'History',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: selectedIndex,
              onTabChange: onTabTapped,
              gap: 20,
              tabBackgroundColor: Color.fromARGB(255, 0, 134, 139),
              activeColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            ),
          ],
        ),
      ),
    );
  }
}
