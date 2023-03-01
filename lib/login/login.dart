// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, sort_child_properties_last

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_2048/ads/adOpenApp.dart';
import 'package:flutter_2048/global/colors.dart';
import 'package:flutter_2048/global/urls.dart';
import 'package:flutter_2048/countrySelector/country_flag.dart';
import 'package:flutter_2048/countrySelector/country_selected.dart';
import 'package:flutter_2048/game.dart';
import 'package:flutter_2048/register/register.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

import '../global/prefs.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    AdOpenApp.load();
    super.initState();
  }

  String random(int min, int max) {
    return (min + Random().nextInt(max - min)).toString();
  }

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoading
          ? Container(
              color: backgroundColor,
              height: double.infinity,
              child: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Field(
                            controller: nameController,
                            labelText2: AppLocalizations.of(context)!.name,
                            hintText2: AppLocalizations.of(context)!
                                .enter_a_name_for_the_palyer),
                        Field(
                          labelText2: AppLocalizations.of(context)!.password,
                          hintText2:
                              AppLocalizations.of(context)!.enter_your_password,
                          controller: passwordController,
                          isScure: true,
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              isLoading = true;
                              setState(() {});
                              var url =
                                  "${loginUrl}?name=${nameController.text.trim()}&password=${passwordController.text}";
                              print(url);
                              http.get(Uri.parse(url)).then((value) {
                                try {
                                  prefs.setString(
                                      "name", nameController.text.trim());
                                  prefs.setString(
                                      "password", passwordController.text);
                                  final body = json.decode(value.body);
                                  if (body["ok"] == 1) {
                                    return Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) => Game()));
                                  }
                                  isLoading = false;
                                  setState(() {});
                                  Fluttertoast.showToast(
                                    context,
                                    msg: AppLocalizations.of(context)!
                                        .check_data_entered,
                                    gravity: ToastGravity.CENTER,
                                  );
                                } catch (e) {
                                  isLoading = false;
                                  setState(() {});
                                  Fluttertoast.showToast(
                                    context,
                                    msg: AppLocalizations.of(context)!
                                        .check_data_entered,
                                    gravity: ToastGravity.CENTER,
                                  );
                                }
                              });
                            },
                            child: Text(
                              AppLocalizations.of(context)!.login,
                              style: TextStyle(color: backgroundColor),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(scoreColor)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Register()));
                            },
                            child: Text(
                              AppLocalizations.of(context)!.new_account,
                              style: TextStyle(color: scoreColor),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(backgroundColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              color: backgroundColor,
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: backgroundColor,
                  color: scoreColor,
                ),
              ),
            ),
    );
  }
}

class Field extends StatelessWidget {
  const Field(
      {Key? key,
      required this.labelText2,
      required this.hintText2,
      this.type,
      this.isScure,
      this.controller})
      : super(key: key);

  final String labelText2;
  final String hintText2;
  final TextEditingController? controller;
  final TextInputType? type;
  final bool? isScure;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: boardColor,
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: SizedBox(
        height: 95,
        child: TextField(
          maxLength: 20,
          controller: controller,
          keyboardType: type,
          obscureText: isScure ?? false,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: backgroundColor)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: backgroundColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: backgroundColor)),
              labelStyle: TextStyle(color: Colors.white),
              labelText: labelText2,
              hintText: hintText2),
        ),
      ),
    );
  }
}
