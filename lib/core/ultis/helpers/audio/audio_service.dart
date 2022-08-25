
// import 'package:just_audio/just_audio.dart';
// import 'package:yofun_app/core/config/constants/asset_path.dart';

// import '../../logger.dart';

// class AudioService {
//   static late AudioPlayer audioPlayer;

//   static void playSound({
//     required String url,
//     int? duration,
//   }) async {
//     try {
//       audioPlayer = AudioPlayer();
//       await audioPlayer.setUrl(url);
//       if (duration != null) audioPlayer.setClip(start: Duration(seconds: 0), end: Duration(seconds: duration));
//       audioPlayer.play();
//     } on PlayerException catch (e) {
//       // iOS/macOS: maps to NSError.code
//       // Android: maps to ExoPlayerException.type
//       // Web: maps to MediaError.code
//       print("Error code: ${e.code}");
//       // iOS/macOS: maps to NSError.localizedDescription
//       // Android: maps to ExoPlaybackException.getMessage()
//       // Web: a generic message
//       print("Error message: ${e.message}");
//     } on PlayerInterruptedException catch (e) {
//       // This call was interrupted since another audio source was loaded or the
//       // player was stopped or disposed before this audio source could complete
//       // loading.
//       print("Connection aborted: ${e.message}");
//     } catch (e) {
//       // Fallback for all errors
//       print(e);
//     }
//   }

//   static void stopSound() async {
//     try {
//       await audioPlayer.pause();
//       await audioPlayer.dispose();
//     } catch (e) {
//       Xlogger.e(e);
//     }
//   }

//   static void playClickSound() async {
//     try {
//       audioPlayer = AudioPlayer();
//       await audioPlayer.setAsset(clicking_sound);
//       audioPlayer.play();
//     } on PlayerException catch (e) {
//       // iOS/macOS: maps to NSError.code
//       // Android: maps to ExoPlayerException.type
//       // Web: maps to MediaError.code
//       print("Error code: ${e.code}");
//       // iOS/macOS: maps to NSError.localizedDescription
//       // Android: maps to ExoPlaybackException.getMessage()
//       // Web: a generic message
//       print("Error message: ${e.message}");
//     } on PlayerInterruptedException catch (e) {
//       // This call was interrupted since another audio source was loaded or the
//       // player was stopped or disposed before this audio source could complete
//       // loading.
//       print("Connection aborted: ${e.message}");
//     } catch (e) {
//       // Fallback for all errors
//       print(e);
//     }
//   }
// }
