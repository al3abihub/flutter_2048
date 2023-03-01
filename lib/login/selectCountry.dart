// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_2048/global/colors.dart';
import 'package:flutter_2048/countrySelector/countriesFlags.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../countrySelector/country_flag.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  late List<Map<String, dynamic>> conutries;

  @override
  void initState() {
    resetData();

    super.initState();
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
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: boardColor,
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: SizedBox(
                      height: 60,
                      child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: backgroundColor)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: backgroundColor)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: backgroundColor)),
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: AppLocalizations.of(context)!.search,
                              hintText: AppLocalizations.of(context)!
                                  .enter_your_country_name),
                          onChanged: (value) {
                            conutries = searchCountries(value);
                            if (conutries.isEmpty) {
                              resetData();
                            }
                            setState(() {});
                          }))),
              Expanded(
                child: ListView.builder(
                  itemCount: conutries.length,
                  itemBuilder: (context, index) {
                    var flag = conutries[index];
                    return CountryFlag(flag["countryCode"], flag["country"]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
