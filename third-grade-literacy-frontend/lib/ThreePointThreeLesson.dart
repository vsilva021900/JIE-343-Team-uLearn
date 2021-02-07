import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: ThreePointThreeLesson()
  ));
}
class ThreePointThreeLesson extends StatefulWidget {
  @override
  ThreePointThree createState() => ThreePointThree();
}
class ThreePointThree extends State<ThreePointThreeLesson> {
  var pictures = [Image.asset('assets/dropbox/sectionThree/ThreePointThree/1_4_cranky-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointThree/2_4_friendly-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointThree/3_4_happy-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointThree/4_4_icy-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointThree/5_4_pretty-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointThree/6_4_silly-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointThree/7_4_sneaky_er_est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointThree/8_4_sorry-er-est.png')];
  var words = [['cranky', 'crankier', 'crankiest'], ['friendly', 'friendlier', 'friendliest'],
    ['happy', 'happier', 'happiest'], ['icy', 'icier', 'iciest'],
    ['pretty', 'prettier', 'prettiest'], ['silly', 'sillier', 'silliest'],
    ['sneaky', 'sneakier', 'sneakiest'], ['sorry', 'sorrier', 'sorriest']];
  int tracker = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
        home: Material(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                sideBarWithReplay(context),
                Expanded(
                    child: sub(context)
                )
              ],
            )
        )
    );
  }

  Widget sideBarWithReplay(BuildContext context) {
    return Container(
        color: const Color(0xffc4e8e6),
        child: Column(
            children: <Widget>[
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                    icon: Image.asset('assets/placeholder_back_button.png'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                    icon: Image.asset('assets/placeholder_home_button.png'),
                    onPressed: () {},
                  )
              ),
              Spacer(flex: 5),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_quiz_button.png'),
                      onPressed: () {}
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_replay_button.png'),
                      onPressed: () { }
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_piggy_button.png'),
                      onPressed: () {}
                  )
              ),
            ]
        )
    );
  }

  Widget sub(BuildContext context) {
    return Container(
        color: const Color(0xFFFFFF),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // can probably simplify with RichText
                  Text('When comparing things, words that end in a',
                      style: textStyle(Colors.black, 30)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('consonant and y change the y to i and add ',
                      style: textStyle(Colors.black, 30)
                  ),
                  Text('er ',
                      style: textStyle(Colors.red, 30)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('or ',
                      style: textStyle(Colors.black, 30)
                  ),
                  Text('est',
                      style: textStyle(Colors.red, 30)
                  ),
                  Text('.',
                      style: textStyle(Colors.black, 30)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: screenHeight * 0.5,
                    child: Transform.scale(
                      scale: 1,
                      child: IconButton(
                        icon: Image.asset('assets/placeholder_back_button.png'),
                        onPressed: () {
                          setState(() { tracker = (tracker == 0)? pictures.length - 1 : tracker - 1;});
                        },
                      ),
                    ),
                  ),
                  Container(
                      height: screenHeight * 0.5,
                      child: pictures[tracker],
                      width: 200
                  ),
                  Container(
                    height: screenHeight * 0.5,
                    child: Transform.scale(
                      scale: 1,
                      child: IconButton(
                        icon: Image.asset('assets/placeholder_back_button_reversed.png'),
                        onPressed: () {
                          setState(() { tracker = (tracker == pictures.length - 1)? 0 : tracker + 1;});
                        },
                      ),
                    ),
                  )
                ],
              ),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      child:
                      Text(words[tracker][0], style: textStyle(Colors.black, 30))
                  ),
                  Container (
                      child:
                      Text(words[tracker][1], style: textStyle(Colors.black, 30))
                  ),
                  Container (
                      child:
                      Text(words[tracker][2], style: textStyle(Colors.black, 30))
                  )
                ],
              )
            ]
        )
    );
  }

  double screenHeight, screenWidth;
  TextStyle textStyle(Color col, double size) {
    return TextStyle(
      color: col,
      fontFamily: 'Comic',
      fontSize: size,
    );
  }
}
