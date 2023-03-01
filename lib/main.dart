import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_2048/global/prefs.dart';
import 'package:flutter_2048/register/register.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'global/urls.dart';
import 'login/login.dart';
import 'models/board_adapter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'game.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  //Allow only portrait mode on Android & iOS
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  //Make sure Hive is initialized first and only after register the adapter.
  await Hive.initFlutter();
  Hive.registerAdapter(BoardAdapter());
  prefs = await SharedPreferences.getInstance();

  // await MobileAds.instance.initialize();
  var socket = IO.io(serverUrl, <String, dynamic>{
    'autoConnect': false,
    'transports': ['websocket'],
  });
  socket.connect();
  socket.onConnect((_) {
    print('Connection established');
    IO.io(serverUrl).emit("enterApp", {
      "name": prefs.getString("name"),
      "password": prefs.getString("password"),
    });
  });
  socket.onDisconnect((_) => print('Connection Disconnection'));
  socket.onConnectError((err) => print(err));
  socket.onError((err) => print(err));
  runApp(ProviderScope(
    child: MaterialApp(
        title: '2048',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('en'), Locale('ar')],
        home: Builder(builder: (context) {
          if (prefs.getString("name") == null ||
              prefs.getString("password") == null) {
            return Login();
          } else {
            return Game();
          }
        })),
  ));
}
