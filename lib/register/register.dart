// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, deprecated_member_use

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_2048/global/colors.dart';
import 'package:flutter_2048/global/prefs.dart';
import 'package:flutter_2048/global/urls.dart';
import 'package:flutter_2048/countrySelector/country_flag.dart';
import 'package:flutter_2048/countrySelector/country_selected.dart';
import 'package:flutter_2048/game.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

import '../ads/adOpenApp.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    AdOpenApp.load();
    super.initState();
  }

  var code = "iq";
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
                          ],
                        ),
                        Field(
                            controller: nameController,
                            labelText2: AppLocalizations.of(context)!.name,
                            hintText2: AppLocalizations.of(context)!
                                .enter_a_name_for_the_palyer),
                        Field(
                          labelText2: AppLocalizations.of(context)!.password,
                          hintText2:
                              AppLocalizations.of(context)!.enter_your_password,
                          isScure: true,
                          controller: passwordController,
                        ),
                        CountrySelected(code, "العراق", (_code) {
                          code = _code;
                        }),
                        Container(
                          margin: EdgeInsets.all(20),
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (nameController.text.trim().isEmpty ||
                                  passwordController.text.trim().isEmpty) {
                                return Fluttertoast.showToast(
                                  context,
                                  msg: AppLocalizations.of(context)!.error,
                                  gravity: ToastGravity.CENTER,
                                );
                              }
                              isLoading = true;
                              setState(() {});
                              http
                                  .get(Uri.parse(
                                      "$registerUrl?name=${nameController.text.trim()}&password=${passwordController.text}&code=$code&isIOS=${Platform.isIOS}"))
                                  .then((value) {
                                try {
                                  final body = json.decode(value.body);
                                  if (body["ok"] == 1) {
                                    prefs.setString(
                                        "name", nameController.text.trim());
                                    prefs.setString(
                                        "password", passwordController.text);
                                    return Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Game()));
                                  }
                                  Fluttertoast.showToast(
                                    context,
                                    msg: AppLocalizations.of(context)!
                                        .name_used_by_another_user,
                                    gravity: ToastGravity.CENTER,
                                  );
                                  isLoading = false;
                                  setState(() {});
                                } catch (e) {
                                  isLoading = false;
                                  setState(() {});
                                  Fluttertoast.showToast(
                                    context,
                                    msg: AppLocalizations.of(context)!.error,
                                    gravity: ToastGravity.CENTER,
                                  );
                                }
                              });
                            },
                            child: Text(
                              AppLocalizations.of(context)!.register,
                              style: TextStyle(color: backgroundColor),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(scoreColor)),
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
