import 'package:flutter_2048/ads/adsHelper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdInterstitial {
  static Future<void> load() {
    return InterstitialAd.load(
        adUnitId: AdsHelper.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            ad.show();
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }
}
