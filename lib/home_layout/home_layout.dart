import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName='homelayout';
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo app'),
      ),
    );
  }
}
