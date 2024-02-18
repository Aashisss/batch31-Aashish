import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'cart.dart';
import 'favourite.dart';
import 'home.dart';
import 'settings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
///function
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _itemTapped(int selectedIndex) {
    pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA6B1E1),
      body: PageView(
        controller: pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          HomeScreen(),
          FavoriteScreen(),
          CartScreen(),
          SettingScreen()
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
            child: GNav(
              rippleColor: Colors.white,
              hoverColor: Colors.white,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.white,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                  onPressed: () {
                    _itemTapped(0);
                  },
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Likes',
                  onPressed: () {
                    _itemTapped(1);
                  },
                ),
                GButton(
                  icon: LineIcons.shoppingCart,
                  text: 'Shop',
                  onPressed: () {
                    _itemTapped(2); // Add your search screen page index
                  },
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                  onPressed: () {
                    _itemTapped(3); // Add your profile screen page index
                  },
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                _itemTapped(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
