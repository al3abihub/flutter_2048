// ignore_for_file: prefer_const_constructors

import 'dart:collection';
import 'package:flutter_2048/register/selectCountry.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2048/global/colors.dart';

class CountryFlag extends StatefulWidget {
  static HashSet<String> _missingFlagCountryIds = HashSet();

  static bool hasFlagIcon(String countryId) {
    countryId = countryId.toLowerCase();
    return !_missingFlagCountryIds.contains(countryId);
  }

  final String countryId;
  final String countryName;
  final double borderRadius;

  const CountryFlag(
    this.countryId,
    this.countryName, {
    Key? key,
    this.borderRadius = 2.0,
  }) : super(key: key);

  @override
  _CountryFlagState createState() => _CountryFlagState();
}

class _CountryFlagState extends State<CountryFlag> {
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
        onPressed: () {
          Navigator.of(context).pop(
              {"countryCode": widget.countryId, "country": widget.countryName});
        },
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(boardColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    _flagPath,
                    height: 50,
                    width: 50,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 150,
                  child: Text(
                    widget.countryName,
                    style: TextStyle(color: backgroundColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
