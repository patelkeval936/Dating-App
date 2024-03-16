import 'package:better_player/better_player.dart';
import 'package:stroll_social_assignment/utils/app_constants.dart';

class CachedVideoInitialiser {
  late BetterPlayerController betterPlayerController;
  BetterPlayerDataSource? _betterPlayerDataSource;

  Future<void> initialise() async {
    _betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      AppConstants.backgroundVideoLink,
      cacheConfiguration: const BetterPlayerCacheConfiguration(
        useCache: true,
        preCacheSize: 2 * 1024 * 1024,
        maxCacheSize: 1000 * 1024 * 1024,
        key: "bg_video",
      ),
    );
    betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
        aspectRatio: 16 / 9,
        controlsConfiguration:
            BetterPlayerControlsConfiguration(showControls: false),
        looping: true,
      ),
    );
    await betterPlayerController.setupDataSource(_betterPlayerDataSource!);
    await betterPlayerController.setVolume(0);
  }

  Future<void> startCaching() async {
    await betterPlayerController.preCache(_betterPlayerDataSource!);
  }
}


