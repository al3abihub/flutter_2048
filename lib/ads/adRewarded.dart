import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'adsHelper.dart';

class AdRewarded {
  static var isStopped = false;

  static Future<void> loadOnReplay() {
    if (isStopped) {
      return Future.delayed(Duration.zero);
    }
    return RewardedAd.load(
        adUnitId: AdsHelper.replayAd,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            ad.show(
                onUserEarnedReward:
                    (AdWithoutView ad, RewardItem rewardItem) {});
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
          },
        ));
  }

  static Future<void> loadOnShowScores() {
    if (isStopped) {
      return Future.delayed(Duration.zero);
    }
    return RewardedAd.load(
        adUnitId: AdsHelper.scoresAd,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            ad.show(
                onUserEarnedReward:
                    (AdWithoutView ad, RewardItem rewardItem) {});
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
          },
        ));
  }
}
