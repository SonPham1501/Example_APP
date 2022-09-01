import 'package:freezed_annotation/freezed_annotation.dart';
part 'file_attachment.freezed.dart';
part 'file_attachment.g.dart';

@freezed
class FileAttachment with _$FileAttachment {
  const factory FileAttachment({
    required String id,
    double? size,
    String? name,
    required String path,
    required String contentType,
    String? resourceType,
    int? type,
  }) = _FileAttachment;

  factory FileAttachment.fromJson(Map<String, dynamic> json) =>
      _$FileAttachmentFromJson(json);

  // factory FileAttachment.fromPresignedFileUploadModel(
  //     PresignedFileUploadModel model) {
  //   {
  //     return FileAttachment(
  //       id: model.id.toString(),
  //       path: model.path,
  //       contentType: model.contentType,
  //       type: model.uuid != null ? 2 : 1,
  //     );
  //   }
  // }

  // factory FileAttachment.sample() => FileAttachment(
  //       id: '8ff962d4-81a7-4e52-9f99-10ef2a73ca0f',
  //       size: 5203.0,
  //       name: 'scaled_image_picker8068173721312450346.jpg',
  //       path:
  //           'https://media-eviedu.s3.ap-southeast-1.amazonaws.com/943341c8-eb86-4bea-9836-131ed4401db8/images/2021/12/1639992518-scaled_image_picker8068173721312450346.jpg',
  //       contentType: 'image/jpeg',
  //       resourceType: 'aws',
  //     );
  // static String thumbnail(FileAttachment? file, [String folder = '100x100']) {
  //   if (file != null) {
  //     if (file.name == null) return file.path;
  //     String _name = file.name!;
  //     return file.path.replaceAll(_name, "100x100/$_name");
  //   }
  //   return AppStaticData.defaultAvt;
  // }
  // @JsonKey(ignore: true)
  // String? get thumbnail => _getThumb();

  // String? _getThumb() {

  //   // if (this.name == null) return this.path;
  //   // String _name = name!;
  //   // return path.replaceAll(_name, "100x100/$_name");
  // }
}
