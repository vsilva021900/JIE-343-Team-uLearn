import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Text('TESTING navigation\n LALALALA \n click anywhere to navigate back')
      )
    );
  }
}