import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'adsHelper.dart';

class AdOpenApp {
  static var isStopped = false;
  static Future<void> load() {
    if (isStopped) {
      return Future.delayed(Duration.zero);
    }
    return AppOpenAd.load(
      adUnitId: AdsHelper.openAppAd,
      orientation: AppOpenAd.orientationPortrait,
      request: AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          ad.show();
        },
        onAdFailedToLoad: (error) {
          print('AppOpenAd failed to load: $error');
          // Handle the error.
        },
      ),
    );
  }
}
