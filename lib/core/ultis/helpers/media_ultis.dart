// import 'dart:io';
import 'package:http_parser/src/media_type.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:mime/mime.dart';

class MediaUltis {
  bool validateImagePath(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    final contentType = MediaUltis.getContentType(value);
    return supportedImages.contains(contentType);
  }

  // static const List<String> supportedImages = [
  //   "image/png",
  //   "image/jpg",
  //   "image/jpeg"
  // ];

  static const List<String> supportedImages = [
    "image/png",
    "image/jpg",
    "image/jpeg"
  ];
  static const List<String> supportedVideos = [
    "video/mp4",
    "video/x-msvideo",
    "video/3gpp",
    "video/quicktime",
    "video/x-quicktime"
  ];

  // static Future<CroppedFile?> cropImage(String path) async {
  //   return await ImageCropper().cropImage(
  //     sourcePath: path,
  //     aspectRatioPresets: [
  //       CropAspectRatioPreset.square,
  //       CropAspectRatioPreset.ratio3x2,
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.ratio4x3,
  //       CropAspectRatioPreset.ratio16x9
  //     ],
  //     uiSettings: [
  //       AndroidUiSettings(
  //           toolbarTitle: 'Cropper',
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           lockAspectRatio: false),
  //       IOSUiSettings(
  //         minimumAspectRatio: 1.0,
  //       )
  //     ],
  //   );
  // }

  static String getContentType(String filePath) =>
      lookupMimeType(filePath) ?? '';

  static String getFileName(String filePath) => filePath.split('/').last;

  static MediaType getMediaType(String filePath) =>
      MediaType.parse(getContentType(filePath));
}
