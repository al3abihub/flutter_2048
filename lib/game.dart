// ignore_for_file: empty_catches

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_2048/global/prefs.dart';
import 'package:flutter_2048/global/top10Users.dart';
import 'package:flutter_2048/login/login.dart';
import 'package:flutter_2048/scores/scores.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'ads/adOpenApp.dart';
import 'components/button.dart';
import 'components/empy_board.dart';
import 'components/score_board.dart';
import 'components/tile_board.dart';
import 'global/colors.dart';
import 'global/urls.dart';
import 'managers/board.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Game extends ConsumerStatefulWidget {
  const Game({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameState();
}

class _GameState extends ConsumerState<Game>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  //The contoller used to move the the tiles
  late final AnimationController _moveController = AnimationController(
    duration: const Duration(milliseconds: 100),
    vsync: this,
  )..addStatusListener((status) {
      //When the movement finishes merge the tiles and start the scale animation which gives the pop effect.
      if (status == AnimationStatus.completed) {
        ref.read(boardManager.notifier).merge();
        _scaleController.forward(from: 0.0);
      }
    });

  //The curve animation for the move animation controller.
  late final CurvedAnimation _moveAnimation = CurvedAnimation(
    parent: _moveController,
    curve: Curves.easeInOut,
  );

  //The contoller used to show a popup effect when the tiles get merged
  late final AnimationController _scaleController = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  )..addStatusListener((status) {
      //When the scale animation finishes end the round and if there is a queued movement start the move controller again for the next direction.
      if (status == AnimationStatus.completed) {
        if (ref.read(boardManager.notifier).endRound()) {
          _moveController.forward(from: 0.0);
        }
      }
    });

  //The curve animation for the scale animation controller.
  late final CurvedAnimation _scaleAnimation = CurvedAnimation(
    parent: _scaleController,
    curve: Curves.easeInOut,
  );
  late Timer timer;
  @override
  void initState() {
    AdOpenApp.load();
    getTo10Users();
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      try {
        getTo10Users();
      } catch (e) {}
    });
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  void getTo10Users() {
    http
        .get(Uri.parse(
            "${top10UsersUrl}?name=${prefs.getString("name")}&password=${prefs.getString("password")}"))
        .then((value) {
      try {
        final body = json.decode(value.body);
        top10Users.clear();
        List tops = body["top10Users"];
        top10Users = tops;
        if (body["ok"] == 0) {
          return Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Login()));
        }
        setState(() {});
      } catch (e) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (RawKeyEvent event) {
        //Move the tile with the arrows on the keyboard on Desktop
        if (ref.read(boardManager.notifier).onKey(event)) {
          _moveController.forward(from: 0.0);
        }
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  AdOpenApp.load();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Scores(),
                  ));
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.only(top: 7, bottom: 7, right: 7, left: 15)),
                  backgroundColor: MaterialStateProperty.all<Color>(scoreColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .the_highest_score_in_the_game,
                            style:
                                const TextStyle(fontSize: 18.0, color: color2),
                          ),
                          top10Users != null
                              ? Text(
                                  "${top10Users[0]["name"] ?? "00000"} : ${top10Users[0]["score"] ?? "00000"}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                )
                              : const Text(
                                  "00000 : 000000",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                )
                        ]),
                    Icon(
                      Icons.open_in_new_sharp,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '2048',
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 52.0),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const ScoreBoard(),
                          Container(
                            margin: EdgeInsets.all(20),
                            width: 130,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                ref.read(boardManager.notifier).newGame();
                                IO.io(serverUrl).emit("logout", {
                                  "name": prefs.getString("name"),
                                  "password": prefs.getString("password"),
                                });
                                prefs.clear();
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => Login(),
                                ));
                              },
                              child: Text(
                                AppLocalizations.of(context)!.logout,
                                style: TextStyle(color: backgroundColor),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(scoreColor)),
                            ),
                          ),
                          Row(
                            children: [
                              ButtonWidget(
                                icon: Icons.undo,
                                onPressed: () {
                                  //Undo the round.
                                  ref.read(boardManager.notifier).undo();
                                },
                              ),
                              const SizedBox(
                                width: 16.0,
                              ),
                              ButtonWidget(
                                icon: Icons.refresh,
                                onPressed: () {
                                  //Restart the game
                                  ref.read(boardManager.notifier).newGame();
                                },
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                SwipeDetector(
                  onSwipe: (direction, offset) {
                    if (ref.read(boardManager.notifier).move(direction)) {
                      _moveController.forward(from: 0.0);
                    }
                  },
                  child: Stack(
                    children: [
                      const EmptyBoardWidget(),
                      TileBoardWidget(
                          moveAnimation: _moveAnimation,
                          scaleAnimation: _scaleAnimation)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //Save current state when the app becomes inactive
    if (state == AppLifecycleState.inactive) {
      ref.read(boardManager.notifier).save();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    //Remove the Observer for the Lifecycles of the App
    WidgetsBinding.instance.removeObserver(this);

    //Dispose the animations.
    _moveAnimation.dispose();
    _scaleAnimation.dispose();
    _moveController.dispose();
    _scaleController.dispose();
    timer.cancel();
    super.dispose();
  }
}
