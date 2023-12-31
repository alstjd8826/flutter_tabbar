import 'package:flutter/material.dart';
import 'package:flutter_tabbar/screen/appbar_using_controller.dart';
import 'package:flutter_tabbar/screen/basic_appbar_tabbar_screen.dart';
import 'package:flutter_tabbar/screen/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Home Scren',
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BasicAppBarTabBarScreen(),
                  ),
                );
              },
              child: Text(
                'Basic AppBar TabBar Screen',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AppBarUsingController(),
                  ),
                );
              },
              child: Text(
                'AppBar Using Controller',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BottomNavigationBarScreen(),
                  ),
                );
              },
              child: Text(
                'Bottom Navigation Bar',
              ),
            )
          ],
        ),
      ),
    );
  }
}
