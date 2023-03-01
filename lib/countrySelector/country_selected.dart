// ignore_for_file: prefer_const_constructors

import 'dart:collection';
import 'package:flutter_2048/register/selectCountry.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2048/global/colors.dart';

class CountrySelected extends StatefulWidget {
  static HashSet<String> _missingFlagCountryIds = HashSet();

  static bool hasFlagIcon(String countryId) {
    countryId = countryId.toLowerCase();
    return !_missingFlagCountryIds.contains(countryId);
  }

  String countryId;
  String countryName;
  final double borderRadius;
  final Function(String code) onChange;
  CountrySelected(
    this.countryId,
    this.countryName,
    this.onChange, {
    Key? key,
    this.borderRadius = 2.0,
  }) : super(key: key);

  @override
  _CountrySelectedState createState() => _CountrySelectedState();
}

class _CountrySelectedState extends State<CountrySelected> {
  String get _countryId {
    return widget.countryId.toLowerCase();
  }

  String get _flagPath {
    return 'flags/png/$_countryId.png';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
            builder: (context) => SelectCountry(),
          ))
              .then((value) {
            try {
              widget.countryName = value["country"];
              widget.countryId = value["countryCode"];
              widget.onChange(value["countryCode"]);
              setState(() {});
            } catch (e) {}
          });
        },
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(boardColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.select_country),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 235,
                  child: Text(
                    widget.countryName,
                    style: TextStyle(color: backgroundColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    _flagPath,
                    height: 50,
                    width: 50,
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
