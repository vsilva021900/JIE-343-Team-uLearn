import 'package:flutter/material.dart';
import 'WordStructures.dart';
import 'dart:io';

import 'package:hearatale_literacy_app/UserDataModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:hearatale_literacy_app/globals.dart' as globals;
import 'dart:convert';
import 'dart:async';



logInStudent(String id) async {
  final response = await http.post(
      Uri.https("teacherportal.hearatale.com", "/api/session/student"),
      body: {
        "id": id,   // The 5-digit conjoined teacher_id + student_id --> gx4aa
      });
  var convertDataToJson = json.decode(response.body);
  if(convertDataToJson["status"] == "ok") {
    globals.studentID = id.substring(3, 5);
    globals.teacherID = id.substring(0, 3);
    print("Logged in on " + globals.studentID + globals.teacherID);

  } else {
    print("UNABLE TO LOGIN");
  }
}

void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: LogInScreen()
  ));
}

class LogInScreen extends StatefulWidget {
  @override
  LogIn createState() => LogIn();
}

class LogIn extends State<LogInScreen> {
  // This widget is the root of your application.
  String letters = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Word Structures',
        theme: ThemeData(),
        home: Material(
            child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: mainSections(context)),
                ]
            )
        )
    );
  }

  Widget mainSections(BuildContext context) {
    return Container(
        color: const Color(0xff6ec6d4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 5)
            ),
            Container(
                decoration: boxDecoration(const Color(0xFF80CDC4)),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Text("Parent & Teacher Access",
                          style: textStyle(15),
                          textAlign: TextAlign.center,
                        )
                    )
                  ],
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "a";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("a"),
                          picture('assets/dropbox/Cropped/a.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "b";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("b"),
                          picture('assets/dropbox/Cropped/b.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "c";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("c"),
                          picture('assets/dropbox/Cropped/c.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "d";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("d"),
                          picture('assets/dropbox/Cropped/d.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "e";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("e"),
                          picture('assets/dropbox/Cropped/e.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "f";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("f"),
                          picture('assets/dropbox/Cropped/f.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "g";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("g"),
                          picture('assets/dropbox/Cropped/g.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "h";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("h"),
                          picture('assets/dropbox/Cropped/h.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "i";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("i"),
                          picture('assets/dropbox/Cropped/i.png')
                        ],
                      )
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "j";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("j"),
                          picture('assets/dropbox/Cropped/j.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "k";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("k"),
                          picture('assets/dropbox/Cropped/k.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "l";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("l"),
                          picture('assets/dropbox/Cropped/l.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "m";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("m"),
                          picture('assets/dropbox/Cropped/m.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "n";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("n"),
                          picture('assets/dropbox/Cropped/n.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "o";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("o"),
                          picture('assets/dropbox/Cropped/o.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "p";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("p"),
                          picture('assets/dropbox/Cropped/p.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "q";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("q"),
                          picture('assets/dropbox/Cropped/q.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "r";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("r"),
                          picture('assets/dropbox/Cropped/r.png')
                        ],
                      )
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(left: 5, right: 5)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "s";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("s"),
                          picture('assets/dropbox/Cropped/s.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "t";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("t"),
                          picture('assets/dropbox/Cropped/t.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "u";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("u"),
                          picture('assets/dropbox/Cropped/u.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "v";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("v"),
                          picture('assets/dropbox/Cropped/v.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "w";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("w"),
                          picture('assets/dropbox/Cropped/w.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "x";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("x"),
                          picture('assets/dropbox/Cropped/x.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "y";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("y"),
                          picture('assets/dropbox/Cropped/y.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "z";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("z"),
                          picture('assets/dropbox/Cropped/z.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "0";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("0"),
                          picture('assets/dropbox/Cropped/0.png')
                        ],
                      )
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "1";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("1"),
                          picture('assets/dropbox/Cropped/1.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "2";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("2"),
                          picture('assets/dropbox/Cropped/2.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "3";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("3"),
                          picture('assets/dropbox/Cropped/3.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "4";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("4"),
                          picture('assets/dropbox/Cropped/4.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "5";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("5"),
                          picture('assets/dropbox/Cropped/5.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "6";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("6"),
                          picture('assets/dropbox/Cropped/6.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "7";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("7"),
                          picture('assets/dropbox/Cropped/7.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "8";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("8"),
                          picture('assets/dropbox/Cropped/8.png')
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5)
                ),
                GestureDetector(
                  onTap: () {
                    if (letters.length < 5) {
                      letters += "9";
                      setState(() {});
                    }
                  },
                  child: Container(
                      decoration: boxDecoration(const Color(0xffffffff)),
                      child: Column(
                        children: [
                          letter("9"),
                          picture('assets/dropbox/Cropped/9.png')
                        ],
                      )
                  ),
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (letters.length == 1) {
                        letters = "";
                        setState(() {});
                      }
                    },
                    child: setLetterBoxOne(),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5)
                  ),
                  GestureDetector(
                    onTap: () {
                      if (letters.length == 2) {
                        letters = letters.substring(0, 1);
                        setState(() {});
                      }
                    },
                    child: setLetterBoxTwo(),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5)
                  ),
                  GestureDetector(
                    onTap: () {
                      if (letters.length == 3) {
                        letters = letters.substring(0, 2);
                        setState(() {});
                      }
                    },
                    child: setLetterBoxThree(),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5)
                  ),
                  GestureDetector(
                    onTap: () {
                      if (letters.length == 4) {
                        letters = letters.substring(0, 3);
                        setState(() {});
                      }
                    },
                    child: setLetterBoxFour(),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5)
                  ),
                  GestureDetector(
                    onTap: () {
                      if (letters.length == 5) {
                        letters = letters.substring(0, 4);
                        setState(() {});
                      }
                    },
                    child: setLetterBoxFive(),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5)
                  ),
                  GestureDetector(
                      onTap: () async {
                      globals.teacherID = null;
                      globals.studentID = null;
                      if (letters.length == 5) {
                        await logInStudent(letters);
                      }


                      if(globals.studentID != null){
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => MyApp(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      } else {
                        print("student id = null");
                      }
                    },
                    child: Container(
                        decoration: boxDecoration(const Color(0xFF80CDC4)),
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                child: Text("Login",
                                  style: textStyle(15),
                                  textAlign: TextAlign.center,
                                )
                            )
                          ],
                        )
                    ),
                  )
                ]
            ),
          ],
        )
    );
  }


// helper methods to reduce duplicate code
  BoxDecoration boxDecoration(Color col) {
    return BoxDecoration(
      color: col,
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

  Padding letter(String text) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 0),
        child: Text(text,
          style: textStyle(15),
          textAlign: TextAlign.center,
        )
    );
  }

  Padding picture(String img) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
        child: Image.asset(img,
          height: 30,
          width: 30,
        )
    );
  }

  Container setLetterBoxOne() {
    if (letters.length == 0) {
      return Container(
          child: Column(
            children: [
              letter(""),
              Text("________")
            ],
          )
      );
    } else {
      return getLetter(0);
    }
  }

  Container setLetterBoxTwo() {
    if (letters.length < 2) {
      return Container(
          child: Column(
            children: [
              letter(""),
              Text("________")
            ],
          )
      );
    } else {
      return getLetter(1);
    }
  }

  Container setLetterBoxThree() {
    if (letters.length < 3) {
      return Container(
          child: Column(
            children: [
              letter(""),
              Text("________")
            ],
          )
      );
    } else {
      return getLetter(2);
    }
  }

  Container setLetterBoxFour() {
    if (letters.length < 4) {
      return Container(
          child: Column(
            children: [
              letter(""),
              Text("________")
            ],
          )
      );
    } else {
      return getLetter(3);
    }
  }

  Container setLetterBoxFive() {
    if (letters.length < 5) {
      return Container(
          child: Column(
            children: [
              letter(""),
              Text("________")
            ],
          )
      );
    } else {
      return getLetter(4);
    }
  }
  Container getLetter(int index) {
    return Container(
        decoration: boxDecoration(const Color(0xffffffff)),
        child: Column(
          children: [
            letter(letters[index]),
            picture("assets/dropbox/Cropped/" + letters[index] + ".png")
          ],
        )
    );
  }
}