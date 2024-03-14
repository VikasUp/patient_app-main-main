import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';

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
    return Container(
      height: 68.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: _buildContainerDecoration(),
      child: ClipRRect(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GNav(
                tabs: [
                  _buildNavButton(
                    ImageSaource.kmenu,
                    Icons.home,
                    'Home',
                    0,
                  ),
                  _buildNavButton(
                      ImageSaource.kcategories, Icons.menu, 'Menu', 1),
                  _buildNavButton(
                      ImageSaource.knotes, Icons.library_books, 'Notes', 2),
                  _buildNavButton(ImageSaource.kshoppingCart,
                      Icons.shopping_bag, 'Cart', 3),
                  _buildNavButton(
                      ImageSaource.kuser, Icons.person, 'Profile', 4),
                ],
                hoverColor: Color.fromARGB(255, 0, 134, 139),
                rippleColor: Color.fromARGB(255, 0, 134, 139),
                haptic: true,
                tabBorderRadius: 20,
                selectedIndex: selectedIndex,
                onTabChange: onTabTapped,
                duration: Duration(milliseconds: 800),
                gap: 5,
                tabBackgroundColor: Color.fromARGB(255, 0, 134, 139),
                activeColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 20.0,
          spreadRadius: 10.0,
        ),
      ],
    );
  }

  GButton _buildNavButton(
      String imagePath, IconData icon, String text, int index) {
    return GButton(
      leading: _buildLeadingContainer(imagePath, index),
      icon: icon,
      text: text,
      onPressed: () => onTabTapped(index),
    );
  }

  Container _buildLeadingContainer(String imagePath, int index) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            imagePath,
          ),
          fit: BoxFit.fitHeight,
          colorFilter: index == selectedIndex
              ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
              : null,
        ),
      ),
    );
  }
}
