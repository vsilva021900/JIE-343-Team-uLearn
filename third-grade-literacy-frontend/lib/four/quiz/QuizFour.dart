import 'dart:math';

import 'package:flutter/material.dart';

class QuizFour extends StatefulWidget {
  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<QuizFour> {
  var answers = [
    // 4.1
    [ ['bubble', 'cookie', 'creature', 'frog', 'giraffe', 'puddle', 'stripe', 'vehicles'], // 4.1
      ['bus', 'dress', 'glass', 'guess', 'kiss', 'walrus', //4.2
      'blush', 'dish', 'splash', 'bush', 'eyelash', 'brush', 'radish', // 4.3
      'crutch', 'peach', 'itch', 'scratch', 'ostrich', 'watch'], // 4.4
      ['box', 'six', 'fox', 'wax', 'lynx', 'mix', // 4.5
      'baby', 'fairy', 'spy', 'berry', 'fly', 'bunny', 'pony', // 4.6
      'elf', 'loaf', 'knife', 'thief', 'leaf', 'wolf'], // 4.7
      ['child', 'mouse', 'foot', 'person', 'goose', 'tooth', 'man', 'woman', // 4.8
        'octopus', 'cactus', 'hippopotamus', 'rhinoceros', //4.9
      'aircraft', 'bison', 'moose', 'sheep', 'deer', 'elk', 'fish', 'jellyfish', 'watercraft'] // 4.10
    ],
    // 4.2 - 4.5
    [ ['bus', 'dress', 'glass', 'guess', 'kiss', 'walrus', // 4.2
      'blush', 'dish', 'splash', 'bush', 'eyelash', 'brush', 'radish', // 4.3
      'crutch', 'peach', 'itch', 'scratch', 'ostrich', 'watch', // 4.4
      'box', 'six', 'fox', 'wax', 'lynx', 'mix'], // 4.5
      ['bubble', 'cookie', 'creature', 'frog', 'giraffe', 'puddle', 'stripe', 'vehicles'], //4.1
      ['baby', 'fairy', 'spy', 'berry', 'fly', 'bunny', 'pony', // 4.6
        'elf', 'loaf', 'knife', 'thief', 'leaf', 'wolf'], //4.7
      ['child', 'mouse', 'foot', 'person', 'goose', 'tooth', 'man', 'woman', // 4.8
        'octopus', 'cactus', 'hippopotamus', 'rhinoceros', // 4.9
        'aircraft', 'bison', 'moose', 'sheep', 'deer', 'elk', 'fish', 'jellyfish', 'watercraft'] // 4.10
    ],
    // 4.6
    [
      ['baby', 'fairy', 'spy', 'berry', 'fly', 'bunny', 'pony'], //4.6
      ['bubble', 'cookie', 'creature', 'frog', 'giraffe', 'puddle', 'stripe', 'vehicles'], //4.1
      ['bus', 'dress', 'glass', 'guess', 'kiss', 'walrus', //4.2
        'blush', 'dish', 'splash', 'bush', 'eyelash', 'brush', 'radish', //4.3
      'crutch', 'peach', 'itch', 'scratch', 'ostrich', 'watch', //4.4
          'box', 'six', 'fox', 'wax', 'lynx', 'mix'], //4.5
      ['elf', 'loaf', 'knife', 'thief', 'leaf', 'wolf', //4.7
        'child', 'mouse', 'foot', 'person', 'goose', 'tooth', 'man', 'woman', // 4.8
      'octopus', 'cactus', 'hippopotamus', 'rhinoceros', // 4.9
      'aircraft', 'bison', 'moose', 'sheep', 'deer', 'elk', 'fish', 'jellyfish', 'watercraft'] //4.10
    ],
    //4.7
    [
      ['elf', 'loaf', 'knife', 'thief', 'leaf', 'wolf'], //4.7
      ['bubble', 'cookie', 'creature', 'frog', 'giraffe', 'puddle', 'stripe', 'vehicles'], //4.1
      ['bus', 'dress', 'glass', 'guess', 'kiss', 'walrus', //4.2
        'blush', 'dish', 'splash', 'bush', 'eyelash', 'brush', 'radish', //4.3
        'crutch', 'peach', 'itch', 'scratch', 'ostrich', 'watch', //4.4
        'box', 'six', 'fox', 'wax', 'lynx', 'mix'], //4.5
      ['baby', 'fairy', 'spy', 'berry', 'fly', 'bunny', 'pony', //4.6
        'child', 'mouse', 'foot', 'person', 'goose', 'tooth', 'man', 'woman', // 4.8
        'octopus', 'cactus', 'hippopotamus', 'rhinoceros', // 4.9
        'aircraft', 'bison', 'moose', 'sheep', 'deer', 'elk', 'fish', 'jellyfish', 'watercraft'] //4.10
    ],
    //4.8
    [
      ['child', 'mouse', 'foot', 'person', 'goose', 'tooth', 'man', 'woman'], //4.8
      ['bubble', 'cookie', 'creature', 'frog', 'giraffe', 'puddle', 'stripe', 'vehicles'], //4.1
      ['bus', 'dress', 'glass', 'guess', 'kiss', 'walrus', //4.2
        'blush', 'dish', 'splash', 'bush', 'eyelash', 'brush', 'radish', //4.3
        'crutch', 'peach', 'itch', 'scratch', 'ostrich', 'watch'], //4.4
      ['elf', 'loaf', 'knife', 'thief', 'leaf', 'wolf', //4.7
        'box', 'six', 'fox', 'wax', 'lynx', 'mix', //4.5
        'baby', 'fairy', 'spy', 'berry', 'fly', 'bunny', 'pony'] //4.6
    ],
    [
      ['octopus', 'cactus', 'hippopotamus', 'rhinoceros'], //4.9
      ['bubble', 'cookie', 'creature', 'frog', 'giraffe', 'puddle', 'stripe', 'vehicles'], //4.1
      ['bus', 'dress', 'glass', 'guess', 'kiss', 'walrus', //4.2
        'blush', 'dish', 'splash', 'bush', 'eyelash', 'brush', 'radish', //4.3
        'crutch', 'peach', 'itch', 'scratch', 'ostrich', 'watch'], //4.4
      ['elf', 'loaf', 'knife', 'thief', 'leaf', 'wolf', //4.7
        'box', 'six', 'fox', 'wax', 'lynx', 'mix', //4.5
        'baby', 'fairy', 'spy', 'berry', 'fly', 'bunny', 'pony'] //4.6
    ],
    [
      ['aircraft', 'bison', 'moose', 'sheep', 'deer', 'elk', 'fish', 'jellyfish', 'watercraft'], //4.10
      ['bubble', 'cookie', 'creature', 'frog', 'giraffe', 'puddle', 'stripe', 'vehicles'], //4.1
      ['bus', 'dress', 'glass', 'guess', 'kiss', 'walrus', //4.2
        'blush', 'dish', 'splash', 'bush', 'eyelash', 'brush', 'radish', //4.3
        'crutch', 'peach', 'itch', 'scratch', 'ostrich', 'watch', //4.4
        'box', 'six', 'fox', 'wax', 'lynx', 'mix'], //4.5
      ['baby', 'fairy', 'spy', 'berry', 'fly', 'bunny', 'pony', //4.6
        'child', 'mouse', 'foot', 'person', 'goose', 'tooth', 'man', 'woman', // 4.8
        'octopus', 'cactus', 'hippopotamus', 'rhinoceros', // 4.9
        'elf', 'loaf', 'knife', 'thief', 'leaf', 'wolf'] //4.7
    ]
  ];
  var answerOrder = [0, 1, 2, 3];
  int prevCorrect = -1; // prevent same correct answer multiple times in a row

  int streak = 0; // first try correct answer streak
  int attempt = 0; // how many tries before answering correctly

  int counter = -1;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    answerOrder.shuffle();
    attempt = 0;
    if (counter == 1) {
      counter = counter + 1 + random.nextInt(5);
    } else if (counter > 1) {
      counter = 0;
    } else {
      counter = counter + 1;
    }

    return MaterialApp(
        home: Material(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
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
                      icon: Image.asset('assets/placeholder_replay_button.png'),
                      onPressed: () {
                        // audioCache.play(music[tracker]);
                      }
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            getQuestion(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Box 0
                GestureDetector(
                    onTap: () {
                      // if the choice is correct
                      if (answerOrder[0] == 0) {
                        // if this is the first try
                        if (attempt == 0) {
                          // increase correct answer streak
                          streak += 1;
                        }
                        setState(() {});
                      }
                      // choice is not correct
                      else {
                        // increment attempt counter
                        attempt += 1;
                        // reset correct answer streak
                        streak = 0;
                      }
                    },
                    child: Container(
                        width: screenWidth * 0.3,
                        decoration: boxDecoration(),
                        child: padding(getChoice(0), screenWidth / 24)
                    )
                ),
                // Box 1
                GestureDetector(
                    onTap: () {
                      if (answerOrder[1] == 0) {
                        if (attempt == 0) {
                          streak += 1;
                        }
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        streak = 0;
                      }
                    },
                    child: Container(
                        width: screenWidth * 0.3,
                        decoration: boxDecoration(),
                        child: padding(getChoice(1), screenWidth / 24)
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Box 2
                GestureDetector(
                    onTap: () {
                      if (answerOrder[2] == 0) {
                        if (attempt == 0) {
                          streak += 1;
                        }
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        streak = 0;
                      }
                    },
                    child: Container(
                        width: screenWidth * 0.3,
                        decoration: boxDecoration(),
                        child: padding(getChoice(2), screenWidth / 24)
                    )
                ),
                // Box 3
                GestureDetector(
                    onTap: () {
                      if (answerOrder[3] == 0) {
                        if (attempt == 0) {
                          streak += 1;
                        }
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        streak = 0;
                      }
                    },
                    child: Container(
                        width: screenWidth * 0.3,
                        decoration: boxDecoration(),
                        child: padding(getChoice(3), screenWidth / 24)
                    )
                ),
              ],
            )
          ],
        )
    );
  }

  String getChoice(int boxNum) {
    int index = answerOrder[boxNum];
    int temp = random.nextInt(answers[counter][index].length);
    if (index == 0) {
      while (prevCorrect == temp) {
        temp = random.nextInt(answers[counter][0].length);
      }
      prevCorrect = temp;
    }
    return answers[counter][index][temp];
  }

  Column getQuestion() {
    if (counter == 0) {
      return Column(
        children: [
          Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Which base word just adds ',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
              Text('s',
                  style: textStyle(Colors.red, screenWidth / 24)
              ),
              Text(' and makes no',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('other change to turn the word into a plural?',
                  style: textStyle(Colors.black, screenWidth / 24)
              )
            ],
          ),
        ],
      );
    }
    else if (counter == 1) {
      return Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Which base word just adds ',
                    style: textStyle(Colors.black, screenWidth / 24)
                ),
                Text('es',
                    style: textStyle(Colors.red, screenWidth / 24)
                ),
                Text(' and makes no',
                    style: textStyle(Colors.black, screenWidth / 24)
                ),
              ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('other change to turn the word into a plural?',
                  style: textStyle(Colors.black, screenWidth / 24)
              )
            ],
          ),
        ],
      );
    }
    //4.6 question
    else if (counter == 2) {
      return Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Which base word changes the last letter to ',
                    style: textStyle(Colors.black, screenWidth / 24)
                ),
                Text('i',
                    style: textStyle(Colors.red, screenWidth / 24)
                ),
              ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('and adds ',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
              Text('es',
                  style: textStyle(Colors.red, screenWidth / 24)
              ),
              Text(' to turn the word into a plural?',
                  style: textStyle(Colors.black, screenWidth / 24)
              )
            ],
          ),
        ],
      );
    }
    //4.7 question
    else if (counter == 3) {
      return Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Which base word changes the last letter to ',
                    style: textStyle(Colors.black, screenWidth / 24)
                ),
                Text('v',
                    style: textStyle(Colors.red, screenWidth / 24)
                ),
              ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('and adds ',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
              Text('es',
                  style: textStyle(Colors.red, screenWidth / 24)
              ),
              Text(' to turn the word into a plural?',
                  style: textStyle(Colors.black, screenWidth / 24)
              )
            ],
          ),
        ],
      );
    }
    //4.8 question
    else if (counter == 4) {
      return Column(
        children: [
          Text("Which special base word doesn’t make",
              style: textStyle(Colors.black, screenWidth / 24)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('regular changes to turn into a plural, so we',
                  style: textStyle(Colors.black, screenWidth / 24)
              )
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('just have to remember the plural word?',
                    style: textStyle(Colors.black, screenWidth / 24)
                )
              ]
          )
        ],
      );
    }
    //4.9 question
    else if (counter == 5) {
      return Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Which fun words change ',
                    style: textStyle(Colors.black, screenWidth / 24)
                ),
                Text('us ',
                    style: textStyle(Colors.green, screenWidth / 24)
                ),
                Text('or ',
                    style: textStyle(Colors.black, screenWidth / 24)
                ),
                Text('os ',
                    style: textStyle(Colors.green, screenWidth / 24)
                ),
                Text('at the end of',
                    style: textStyle(Colors.black, screenWidth / 24)
                ),
              ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('the base word into ',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
              Text('i ',
                  style: textStyle(Colors.red, screenWidth / 24)
              ),
              Text('to make a plural?',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
            ],
          ),
        ],
      );
    }
    //4.10 question
    else {
      return Column(
        children: [
          Text('Which special base word is exactly the',
              style: textStyle(Colors.black, screenWidth / 24)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('same for both singular and plural?',
                  style: textStyle(Colors.black, screenWidth / 24)
              )
            ],
          ),
        ],
      );
    }
  }
}


double screenHeight, screenWidth;
var random = new Random();


Padding padding(String text, double size) {
  return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Text(
        text,
        style: textStyle(Colors.black, size),
        textAlign: TextAlign.center,
      )
  );
}
BoxDecoration boxDecoration() {
  return BoxDecoration(
    color: const Color(0xff00eeff),
    border: Border.all(color: const Color(0xff008cb3), width: 3),
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );
}
TextStyle textStyle(Color col, double size) {
  return TextStyle(
    color: col,
    fontFamily: 'Comic',
    fontSize: size,
  );
}