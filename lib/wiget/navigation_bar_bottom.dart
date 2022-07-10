import 'package:bookwalay/activity/home_activity.dart';
import 'package:flutter/material.dart';

class NavigationBarButtom extends StatelessWidget {
  const NavigationBarButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (value) {
        if (value == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeActivity(),
            ),
          );
        }
        else if (value == 1) {
          
        }
        else if (value == 2){

        }
      },
      backgroundColor: Colors.blue,
      items:  const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.black),
          label: "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: Colors.black),
          label: "Search"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart, color: Colors.black),
          label: "Cart"        
        ),
      ],
    );
  }
}