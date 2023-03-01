// ignore_for_file: prefer_const_constructors

import 'dart:collection';
import 'dart:ffi';
import 'package:flutter_2048/global/prefs.dart';
import 'package:flutter_2048/register/selectCountry.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2048/global/colors.dart';

class ScoreItem extends StatefulWidget {
  static HashSet<String> _missingFlagCountryIds = HashSet();

  static bool hasFlagIcon(String countryId) {
    countryId = countryId.toLowerCase();
    return !_missingFlagCountryIds.contains(countryId);
  }

  final String countryId;
  final String name;
  final String score;
  final bool isOnline;
  final double borderRadius;

  const ScoreItem(
    this.countryId,
    this.name,
    this.score,
    this.isOnline, {
    Key? key,
    this.borderRadius = 2.0,
  }) : super(key: key);

  @override
  _ScoreItemState createState() => _ScoreItemState();
}

class _ScoreItemState extends State<ScoreItem> {
  String get _countryId {
    return widget.countryId.toLowerCase();
  }

  String get _flagPath {
    return 'flags/png/$_countryId.png';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ElevatedButton(
        onPressed: () {},
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(boardColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: _countryId != ""
                      ? Image.asset(
                          _flagPath,
                          height: 50,
                          width: 50,
                        )
                      : Container(height: 50, width: 50),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 150) / 2,
                  child: Text(
                    widget.name,
                    style: TextStyle(color: backgroundColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 150) / 2,
                  child: Text(
                    widget.score,
                    style: TextStyle(color: backgroundColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  color: onlineColor(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  MaterialColor onlineColor() {
    if (widget.isOnline ?? false) {
      return Colors.green;
    } else {
      if (prefs.getString("name") == widget.name) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    }
  }
}
