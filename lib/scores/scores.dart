// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_2048/global/colors.dart';
import 'package:flutter_2048/countrySelector/countriesFlags.dart';
import 'package:flutter_2048/global/top10Users.dart';
import 'package:flutter_2048/scores/scoreItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../countrySelector/country_flag.dart';
import 'package:http/http.dart' as http;

import '../global/prefs.dart';
import '../global/urls.dart';

class Scores extends StatefulWidget {
  const Scores({super.key});

  @override
  State<Scores> createState() => _ScoresState();
}

class _ScoresState extends State<Scores> {
  late List<Map<String, dynamic>> conutries;
  late Timer timer;
  @override
  void initState() {
    resetData();
    timer = Timer(
      Duration(seconds: 5),
      () {
        try {
          updateTop10Users();
        } catch (e) {}
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void resetData() {
    conutries = countriesFlags;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    width: 50,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: backgroundColor,
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(scoreColor)),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.top10scores,
                    style: TextStyle(color: scoreColor, fontSize: 24),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: top10Users.length ?? 0,
                  itemBuilder: (context, index) {
                    var flag = conutries[index];
                    return ScoreItem(
                        top10Users[index]["code"].toString(),
                        top10Users[index]["name"].toString(),
                        top10Users[index]["score"].toString(),
                        top10Users[index]["isOnline"]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateTop10Users() {
    http
        .get(Uri.parse(
            "${top10UsersUrl}?name=${prefs.getString("name")}&password=${prefs.getString("password")}"))
        .then((value) {
      try {
        final body = json.decode(value.body);
        top10Users.clear();
        List tops = body["top10Users"];
        top10Users = tops;
      } catch (e) {}
    });
    setState(() {});
  }
}
