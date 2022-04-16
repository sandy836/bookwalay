import 'package:bookwalay/activity/home_activity.dart';
import 'package:flutter/material.dart';

class NavigationBarButtom extends StatelessWidget {
  const NavigationBarButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        if (value == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeActivity(),
            ),
          );
        } else {
          if (value == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeActivity(),
              ),
            );
          }
        }
      },
      backgroundColor: Colors.blue,
      items:  [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.black),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: Colors.black),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart, color: Colors.black),
          label: "Cart",
        ),
      ],
    );
  }
}