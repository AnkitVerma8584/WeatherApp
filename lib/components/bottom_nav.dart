import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({
    super.key,
  });

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int selectedTab = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BottomNavigationBar(
            currentIndex: selectedTab,
            onTap: (value) => onTabSelected(value),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            fixedColor: Colors.blue,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "Home",
              ),
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search),
                label: "Search",
              ),
              const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.compass), label: "Explore"),
              BottomNavigationBarItem(
                  icon: CircleAvatar(
                    radius: 10,
                    child: SvgPicture.asset("assets/weather/day.svg"),
                  ),
                  label: "Profile")
            ]),
      ),
    );
  }
}
