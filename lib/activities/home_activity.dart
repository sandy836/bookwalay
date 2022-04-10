import 'package:flutter/material.dart';


class HomeActivity extends StatelessWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bookwalay'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}