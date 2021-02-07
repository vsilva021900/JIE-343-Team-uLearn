import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: OnePointThreeLesson()
  ));
}
class OnePointThreeLesson extends StatefulWidget {
  @override
  OnePointThree createState() => OnePointThree();
}
class OnePointThree extends State<OnePointThreeLesson> {
  var pictures = [Image.asset('assets/dropbox/sectionOne/OnePointThree/bake.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointThree/dance.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointThree/excite.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointThree/move.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointThree/tickle.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointThree/tumble.png')];
  var words = [['bake', 'baked', 'baking'],
    ['dance', 'danced', "dancing"],
    ['excite', 'excited', "exciting"],
    ['move', 'moved', "moving"],
    ['tickle', 'tickled', "tickling"],
    ['tumble', 'tumbled', "tumbling"]];
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
                sideBar(context),
                Expanded(
                    child: sub(context)
                )
              ],
            )
        )
    );
  }

  Widget sideBar(BuildContext context) {
    return Container(
        color: const Color(0xffc4e8e6),
        child: Column(
            children: <Widget>[
              Material(
                  child: IconButton(
                    icon: Image.asset('assets/placeholder_back_button.png'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
              ),
              Material(
                  child: IconButton(
                    icon: Image.asset('assets/placeholder_home_button.png'),
                    onPressed: () {},
                  )
              ),
              Spacer(flex: 5),
              Material(
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_quiz_button.png'),
                      onPressed: () {}
                  )
              ),
              Material(
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_piggy_button.png'),
                      onPressed: () {}
                  )
              ),
            ]
        )
    );
  }

// same as above except include replay button for audio files
// use for lesson pages
  Widget sideBarWithReplay(BuildContext context) {
    return Container(
        color: const Color(0xffc4e8e6),
        child: Column(
            children: <Widget>[
              Material(
                  child: IconButton(
                    icon: Image.asset('assets/placeholder_back_button.png'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
              ),
              Material(
                  child: IconButton(
                    icon: Image.asset('assets/placeholder_home_button.png'),
                    onPressed: () {},
                  )
              ),
              Spacer(flex: 5),
              Material(
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_quiz_button.png'),
                      onPressed: () {}
                  )
              ),
              Material(
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_replay_button.png'),
                      onPressed: () {}
                  )
              ),
              Material(
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
                  Text('Many action words end with e. These words drop',
                      style: textStyle(Colors.black, 30)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('the final e and add ',
                      style: textStyle(Colors.black, 30)
                  ),
                  Text('ed ',
                      style: textStyle(Colors.red, 30)
                  ),
                  Text('or ',
                      style: textStyle(Colors.black, 30)
                  ),
                  Text('ing ',
                      style: textStyle(Colors.red, 30)
                  ),
                  Text('to the base word.',
                      style: textStyle(Colors.black, 30)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: screenHeight * 0.6,
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
                      height: screenHeight * 0.6,
                      child: pictures[tracker],
                      width: 200
                  ),
                  Container(
                    height: screenHeight * 0.6,
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
