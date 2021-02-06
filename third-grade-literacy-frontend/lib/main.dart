import 'package:flutter/material.dart';
import 'testing.dart';
import 'sectionOne.dart';
import 'sectionTen.dart';
import 'sectionNine.dart';
import 'sectionEight.dart';
import 'sectionSeven.dart';
import 'sectionSix.dart';

void main() {
  runApp(MaterialApp(
    title: '3rd Grade Literacy App',
    home: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Structures',
      theme: ThemeData(),
      home: Material(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            sideBar,
            Expanded(
              child: mainSections(context),
            )
          ],
        )
      )
    );
  }
}

Widget sideBar = Container(
  color: const Color(0xffc4e8e6),
  child: Column(
    children: <Widget>[
      Material(
        color: const Color(0xffc4e8e6),
        child: IconButton(
          icon: Image.asset('assets/placeholder_back_button.png'),
          onPressed: () {  },
        )
      ),
      Material(
        color: const Color(0xffc4e8e6),
        child: IconButton(
          icon: Image.asset('assets/placeholder_home_button.png'),
          onPressed: () {  },
        )
      ),
      Spacer(flex: 5),
      Material(
        color: const Color(0xffc4e8e6),
        child: IconButton(
          icon: Image.asset('assets/placeholder_piggy_button.png'),
          onPressed: () {  }
        )
      ),
    ]
  )
);

Widget mainSections(BuildContext context) {
  return Container(
      color: const Color(0xff6ec6d4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
              'Word Structures',
              style: textStyle(30)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, _, __) => MainOne(),
                        transitionDuration: Duration(seconds: 0)
                      )
                  );
                },
                child: Container(
                    decoration: boxDecoration(const Color(0xff96e4a2)),
                    child: sections('1', 'Base Words and Endings', 'ed ing')
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) => Test(),
                          transitionDuration: Duration(seconds: 0)
                      )
                  );
                },
                child: Container(
                  decoration: boxDecoration(const Color(0xff66cf69)),
                  child: sections('2', 'Base Words and Endings', 's es')
                )
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) => Test(),
                          transitionDuration: Duration(seconds: 0)
                      )
                  );
                },
                child: Container(
                  decoration: boxDecoration(const Color(0xfffdf885)),
                  child: sections('3', 'Comparative', 'Endings')
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) => Test(),
                          transitionDuration: Duration(seconds: 0)
                      )
                  );
                },
                child: Container(
                  decoration: boxDecoration(const Color(0xffbc8f75)),
                  child: sections('4', 'Plurals', '')
                )
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) => Test(),
                          transitionDuration: Duration(seconds: 0)
                      )
                  );
                },
                child: Container(
                  decoration: boxDecoration(const Color(0xfff3b2c8)),
                  child: sections('5', 'Possessives', '')
                )
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) => MainSix(),
                          transitionDuration: Duration(seconds: 0)
                      )
                  );
                },
                child: Container(
                  decoration: boxDecoration(const Color(0xfff3b98c)),
                  child: sections('6', 'Contractions', '')
                )
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) => MainSeven(),
                          transitionDuration: Duration(seconds: 0)
                      )
                  );
                },
                child: Container(
                  decoration: boxDecoration(const Color(0xffb87cbe)),
                  child: sections('7', 'Compound', 'Words')
                )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) => MainEight(),
                          transitionDuration: Duration(seconds: 0)
                      )
                  );
                },
                child: Container(
                  decoration: boxDecoration(const Color(0xff6abad7)),
                  child: sections('8', 'Prefixes', '')
                )
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) => MainNine(),
                          transitionDuration: Duration(seconds: 0)
                      )
                  );
                },
                child: Container(
                  decoration: boxDecoration(const Color(0xfffcf351)),
                  child: sections('9', 'Suffixes', '')
                )
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) => MainTen(),
                          transitionDuration: Duration(seconds: 0)
                      )
                  );
                },
                child: Container(
                  decoration: boxDecoration(const Color(0xffee8640)),
                  child: sections('10', 'Syllables', '')
                )
              ),
            ],
          )
        ],
      )
  );
}


// helper methods to reduce duplicate code
BoxDecoration boxDecoration(Color col) {
  return BoxDecoration(
    color: col,
    border: Border.all(color: Colors.black, width: 3),
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );
}

TextStyle textStyle(double size) {
  return TextStyle(
    color: Colors.black,
    fontFamily: 'Comic',
    fontSize: size,
  );
}

Padding sections(String a, String b, String c) {
  return Padding(
      padding: const EdgeInsets.only(left: 10, right: 13),
      child: Text('\n ' + a + ' \n ' + b + ' \n ' + c + ' \n',
        style: textStyle(15),
        textAlign: TextAlign.center,
      )
  );
}
