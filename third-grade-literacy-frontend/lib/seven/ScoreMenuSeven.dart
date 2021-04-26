import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/MainScoreMenu.dart';
import 'package:hearatale_literacy_app/seven/StreakSeven.dart';
import '../helper.dart';


class ScoreSeven extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setWidthHeight(context);

    return MaterialApp(
        home: Material(
            child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  sideBar(context),
                  Expanded(
                      child: sub(context)
                  )
                ]
            )
        )
    );
  }
}

Widget sideBar(BuildContext context) {
  return Container(
      color: const Color(0xffc4e8e6),
      child: Column(
          children: <Widget>[
            backButton(context),
            homeButton(context),
            Spacer(flex: 5),
            pinkPigButton(context)
          ]
      )
  );
}

Widget sub(BuildContext context) {
  return Container(
      child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) => MainScore(),
                          transitionDuration: Duration(seconds: 0)
                      )
                  );
                },
                child: Text('Compound Words',
                    style: textStyle(Colors.black, 40)
                )
            ),
            Container(
                height: screenHeight / 12
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(),
                Text('7  compounds words combine',
                    style: textStyle(Colors.black, screenWidth / 40)
                )
              ],
            ),
            Row(
              children: [
                Container(
                    width: (2 * screenWidth / 40) + (screenWidth * 0.01)
                ),
                Container(
                    width: (screenWidth / 5) + (screenHeight / 12)
                ),
                Text('          two to make one',
                    style: textStyle(Colors.black, screenWidth / 40)
                ),
              ],
            )
          ]
      )
  );
}

Row starsAndCheck() {
  Container checkmark;
  if (StreakSeven.checkmark) {
    checkmark = Container(
        constraints: BoxConstraints(maxWidth: screenHeight / 12, maxHeight: screenHeight / 12),
        child: Image.asset("assets/stars/placeholder_checkmark.png",
          fit: BoxFit.contain,
        )
    );
  }
  else {
    checkmark = Container(
      // color: Colors.green,
        width: screenHeight / 12,
        height: screenHeight / 12
    );
  }

  return Row(
    children: [
      Container(
          width: screenWidth / 40,
          height: screenHeight / 12
      ),
      starImage(),
      Container(
          width: screenWidth * 0.01,
          height: screenHeight / 12
      ),
      checkmark,
      Container(
          width: screenWidth / 40,
          height: screenHeight / 12
      )
    ],
  );
}

Container starImage() {
  String imagePath = StreakSeven.getImagePath();
  if (imagePath.length == 0) {
    return Container(
        width: screenWidth / 5,
        height: screenHeight / 12
    );
  }

  return Container(
      constraints: BoxConstraints(maxWidth: screenWidth / 5),
      child: Image.asset(StreakSeven.getImagePath(),
        fit: BoxFit.contain,
      )
  );
}