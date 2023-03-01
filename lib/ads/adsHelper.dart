import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io' show Platform;

class AdsHelper {
  static const bool isTest = true;
  static String get openAppAd {
    if (Platform.isAndroid) {
      if (isTest) {
        return "ca-app-pub-3940256099942544/3419835294";
      }
      return ""; // put your ad id for android
    }
    if (isTest) {
      return "ca-app-pub-3940256099942544/5662855259"; // ios
    }
    return ""; // put your ad id for ios
  }

  static String get replayAd {
    if (isTest) {
      return "ca-app-pub-3940256099942544/5224354917";
    }
    if (Platform.isAndroid) {
      return ""; // put your ad id for android
    }
    return ""; // put your ad id for android
  }

  static String get scoresAd {
    if (isTest) {
      return "ca-app-pub-3940256099942544/5224354917";
    }
    if (Platform.isAndroid) {
      return ""; // put your ad id for android
    }
    return ""; // put your ad id for ios
  }

  static String get interstitialAdUnitId {
    if (isTest) {
      return "ca-app-pub-3940256099942544/1033173712";
    }
    if (Platform.isAndroid) {
      return ""; // put your ad id for android
    }
    return ""; // put your ad id for ios
  }
}
