import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;

import '../file_attachment/file_attachment.dart';
part 'app_file_attachment.freezed.dart';

part 'app_file_attachment.g.dart';

@freezed
class AppFileAttachmentType with _$AppFileAttachmentType {
  const AppFileAttachmentType._();

  const factory AppFileAttachmentType({
    String? path,
    String? id,
    String? name,
    String? contentType,
    String? resourceType,
    double? size,
  }) = _AppFileAttachmentType;

  factory AppFileAttachmentType.fromJson(Map<String, dynamic> json) =>
      _$AppFileAttachmentTypeFromJson(json);

  factory AppFileAttachmentType.fromFileAttachment(FileAttachment attachment) =>
      AppFileAttachmentType(
        id: attachment.id,
        path: attachment.path,
        name: attachment.name,
        contentType: attachment.contentType,
        resourceType: attachment.resourceType,
        size: attachment.size,
      );

  @JsonKey(ignore: true)
  String? get profileThumbnail => _getThumb();

  @JsonKey(ignore: true)
  String? get newfeedThumbnail => _getThumb(600);

  @JsonKey(ignore: true)
  String? get videoThumbnail => _getVideoThumb();

  String? _getThumb([int width = 120]) {
    if (this.path == null) return this.path;
    if (this.path!.isEmpty) return this.path;
    final _name = this.path!.split('/').last;
    return path!.replaceAll(_name, "${width}x$width/$_name");

    // if (this.name == null) return this.path;
    // String _name = name!;
    // return path!.replaceAll(_name, "100x100/$_name");
  }

  String? _getVideoThumb() {
    try {
      if (this.path == null) return null;
      if (this.path!.isEmpty) return null;
      String _name = p.basenameWithoutExtension(this.path!);
      String _thumbnail = p.setExtension(_name, '.png');
      String _replaceName = this.path!.split('/').last;
      return path!
          .replaceAll('/videos/$_replaceName', '/thumbnails/$_thumbnail');
    } catch (_) {
      return null;
    }
  }

  static String? thumbnailWithCustomWidth(
    String? path, {
    int width = 120,
  }) {
    if (path == null) return path;
    if (path.isEmpty) return path;
    final _name = path.split('/').last;
    return path.replaceAll(_name, "${width}x$width/$_name");
  }
}
