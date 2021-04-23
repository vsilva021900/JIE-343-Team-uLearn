import 'package:flutter/material.dart';
import 'quiz/QuizSeven.dart';
import 'ScoreMenuSeven.dart';
import '../helper.dart';


class SevenPointOneLesson extends StatefulWidget {
  @override
  SevenPointOne createState() => SevenPointOne();
}

class SevenPointOne extends State<SevenPointOneLesson> {
  var pictures = [
    "assets/dropbox/SectionSeven/backpack.png",
    "assets/dropbox/SectionSeven/basketball.png",
    "assets/dropbox/SectionSeven/bathtub.png",
    "assets/dropbox/SectionSeven/bigfoot.png",
    "assets/dropbox/SectionSeven/candlestick.png",
    "assets/dropbox/SectionSeven/chainsaw.png",
    "assets/dropbox/SectionSeven/cowboy.png",
    "assets/dropbox/SectionSeven/crosswalk.png",
    "assets/dropbox/SectionSeven/cupcake.png",
    "assets/dropbox/SectionSeven/dragonfly.png",
    "assets/dropbox/SectionSeven/fingernail.png",
    "assets/dropbox/SectionSeven/firetruck.png",
    "assets/dropbox/SectionSeven/flashlight.png",
    "assets/dropbox/SectionSeven/football.png",
    "assets/dropbox/SectionSeven/grasshopper.png",
    "assets/dropbox/SectionSeven/hummingbird.png",
    "assets/dropbox/SectionSeven/jellyfish.png",
    "assets/dropbox/SectionSeven/lawnmower.png",
    "assets/dropbox/SectionSeven/nightgown.png",
    "assets/dropbox/SectionSeven/pigtails.png",
    "assets/dropbox/SectionSeven/playground.png",
    "assets/dropbox/SectionSeven/popcorn.png",
    "assets/dropbox/SectionSeven/rainbow.png",
    "assets/dropbox/SectionSeven/raincoat.png",
    "assets/dropbox/SectionSeven/rattlesnake.png",
    "assets/dropbox/SectionSeven/sandbox.png",
    "assets/dropbox/SectionSeven/skateboard.png",
    "assets/dropbox/SectionSeven/spaceship.png",
    "assets/dropbox/SectionSeven/spyglass.png",
    "assets/dropbox/SectionSeven/starfish.png",
    "assets/dropbox/SectionSeven/stepladder.png",
    "assets/dropbox/SectionSeven/sunglasses.png",
    "assets/dropbox/SectionSeven/sunrise.png",
    "assets/dropbox/SectionSeven/sunset.png",
    "assets/dropbox/SectionSeven/teaspoon.png",
    "assets/dropbox/SectionSeven/toenail.png",
    "assets/dropbox/SectionSeven/toothbrush.png",
    "assets/dropbox/SectionSeven/waterfall.png",
    "assets/dropbox/SectionSeven/watermelon.png",
    "assets/dropbox/SectionSeven/wheelchair.png",
    "assets/dropbox/SectionSeven/windmill.png",
  ];
  var words = [
    ["back", "pack", "backpack"],
    ["basket", "ball", "basketball"],
    ["bath", "tub", "bathtub"],
    ["big", "foot", "bigfoot"],
    ["candle", "stick", "candlestick"],
    ["chain", "saw", "chainsaw"],
    ["cow", "boy", "cowboy"],
    ["cross", "walk", "crosswalk"],
    ["cup", "cake", "cupcake"],
    ["dragon", "fly", "dragonfly"],
    ["finger", "nail", "fingernail"],
    ["fire", "truck", "firetruck"],
    ["flash", "light", "flashlight"],
    ["foot", "ball", "football"],
    ["grass", "hopper", "grasshopper"],
    ["humming", "bird", 'hummingbird'],
    ["jelly", "fish", "jellyfish"],
    ["lawn", "mower", "lawnmower"],
    ["night", "gown", "nightgown"],
    ["pig", "tails", "pigtails"],
    ["play", "ground", "playground"],
    ["pop", "corn", "popcorn"],
    ["rain", "bow", "rainbow"],
    ["rain", "coat", "raincoat"],
    ["rattle", "snake", "rattlesnake"],
    ["sand", "box", "sandbox"],
    ["skate", "board", "skateboard"],
    ["space", "ship", "spaceship"],
    ["spy", "glasses", "spyglasses"],
    ["star", "fish", "starfish"],
    ["step", "ladder", "stepladder"],
    ["sun", "glasses", "sunglasses"],
    ["sun", "rise", "sunrise"],
    ["sun", "set", "sunset"],
    ["tea", "spoon", "teaspoon"],
    ["toe", "nail", "toenail"],
    ["tooth", "brush", "toothbrush"],
    ["water", "fall", "waterfall"],
    ["water", "melon", "watermelon"],
    ["wheel", "chair", "wheelchair"],
    ["wind", "mill", "windmill"],
  ];
  var wordsAudio = [
    "dropbox/SectionSeven/back_pack_backpack.mp3",
    "dropbox/SectionSeven/basket_ball_basketball.mp3",
    "dropbox/SectionSeven/bath_tub_bathtub.mp3",
    "dropbox/SectionSeven/big_foot_bigfoot.mp3",
    "dropbox/SectionSeven/candle_stick_candlestick.mp3",
    "dropbox/SectionSeven/chain_saw_chainsaw.mp3",
    "dropbox/SectionSeven/cow_boy_cowboy.mp3",
    "dropbox/SectionSeven/cross_walk_crosswalk.mp3",
    "dropbox/SectionSeven/cup_cake_cupcake.mp3",
    "dropbox/SectionSeven/dragon_fly_dragonfly.mp3",
    "dropbox/SectionSeven/finger_nail_fingernail.mp3",
    "dropbox/SectionSeven/fire_truck_firetruck.mp3",
    "dropbox/SectionSeven/flash_light_flashlight.mp3",
    "dropbox/SectionSeven/foot_ball_football.mp3",
    "dropbox/SectionSeven/grass_hopper_grasshopper.mp3",
    "dropbox/SectionSeven/humming_bird_hummingbird.mp3",
    "dropbox/SectionSeven/jelly_fish_jellyfish.mp3",
    "dropbox/SectionSeven/lawn_mower_lawnmower.mp3",
    "dropbox/SectionSeven/night_gown_nightgown.mp3",
    "dropbox/SectionSeven/pig_tails_pigtails.mp3",
    "dropbox/SectionSeven/play_ground_playground.mp3",
    "dropbox/SectionSeven/pop_corn_popcorn.mp3",
    "dropbox/SectionSeven/rain_bow_rainbow.mp3",
    "dropbox/SectionSeven/rain_coat_raincoat.mp3",
    "dropbox/SectionSeven/rattle_snake_rattlesnake.mp3",
    "dropbox/SectionSeven/sand_box_sandbox.mp3",
    "dropbox/SectionSeven/skate_board_skateboard.mp3",
    "dropbox/SectionSeven/space_ship_spaceship.mp3",
    "dropbox/SectionSeven/spy_glass_spyglass.mp3",
    "dropbox/SectionSeven/star_fish_starfish.mp3",
    "dropbox/SectionSeven/step_ladder_stepladder.mp3",
    "dropbox/SectionSeven/sun_glasses_sunglasses.mp3",
    "dropbox/SectionSeven/sun_rise_sunrise.mp3",
    "dropbox/SectionSeven/sun_set_sunset.mp3",
    "dropbox/SectionSeven/tea_spoon_teaspoon.mp3",
    "dropbox/SectionSeven/toe_nail_toenail.mp3",
    "dropbox/SectionSeven/tooth_brush_toothbrush.mp3",
    "dropbox/SectionSeven/water_fall_waterfall.mp3",
    "dropbox/SectionSeven/water_melon_watermelon.mp3",
    "dropbox/SectionSeven/wheel_chair_wheelchair.mp3",
    "dropbox/SectionSeven/wind_mill_windmill.mp3",
  ];

  int tracker = 0;
  bool marker = true;

  String sentenceAudio = "dropbox/SectionSeven/##7.0_compoundwordsaretwowords.mp3";

  @override
  Widget build(BuildContext context) {
    setWidthHeight(context);

    if (marker) {
      marker = false;
      playSentenceAudio();
    }

    return MaterialApp(
        home: Material(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
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
              backButton(context),
              homeButton(context),
              Spacer(flex: 5),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_quiz_button.png'),
                      onPressed: () {
                        stopAudio();
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => QuizSeven(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      }
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_replay_button.png'),
                      onPressed: () {
                        playWordsAudio();
                      }
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                    icon: Image.asset('assets/star_button.png'),
                    onPressed: () {
                      stopAudio();
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, _, __) => ScoreSeven(),
                              transitionDuration: Duration(seconds: 0)
                          )
                      );
                    },
                  )
              ),
              pinkPigButton(context)
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
                  Text('Compound Words are two words ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('combined to make one word ',
                      style: textStyle(Colors.black, screenWidth / 24)
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
                          playWordsAudio();
                        },
                      ),
                    ),
                  ),
                  Container(
                      height: screenHeight * 0.6,
                      child: Image.asset(pictures[tracker]),
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
                          playWordsAudio();
                        },
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(words[tracker][0],
                      style: textStyle(Colors.black, 30)
                  ),
                  Text(words[tracker][1],
                      style: textStyle(Colors.black, 30)
                  ),
                  Text(words[tracker][2],
                      style: textStyle(Colors.black, 30)
                  )
                ],
              )
            ]
        )
    );


  }

  playSentenceAudio() async {
    stopAudio();
    audioPlayer = await audioCache.play(sentenceAudio);
  }

  playWordsAudio() async {
    stopAudio();
    audioPlayer = await audioCache.play(wordsAudio[tracker]);
  }
}
