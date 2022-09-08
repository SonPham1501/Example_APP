// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'file_attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FileAttachment _$FileAttachmentFromJson(Map<String, dynamic> json) {
  return _FileAttachment.fromJson(json);
}

/// @nodoc
mixin _$FileAttachment {
  dynamic get id => throw _privateConstructorUsedError;
  double? get size => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get contentType => throw _privateConstructorUsedError;
  String? get resourceType => throw _privateConstructorUsedError;
  int? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileAttachmentCopyWith<FileAttachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileAttachmentCopyWith<$Res> {
  factory $FileAttachmentCopyWith(
          FileAttachment value, $Res Function(FileAttachment) then) =
      _$FileAttachmentCopyWithImpl<$Res>;
  $Res call(
      {dynamic id,
      double? size,
      String? name,
      String path,
      String contentType,
      String? resourceType,
      int? type});
}

/// @nodoc
class _$FileAttachmentCopyWithImpl<$Res>
    implements $FileAttachmentCopyWith<$Res> {
  _$FileAttachmentCopyWithImpl(this._value, this._then);

  final FileAttachment _value;
  // ignore: unused_field
  final $Res Function(FileAttachment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? size = freezed,
    Object? name = freezed,
    Object? path = freezed,
    Object? contentType = freezed,
    Object? resourceType = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: resourceType == freezed
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_FileAttachmentCopyWith<$Res>
    implements $FileAttachmentCopyWith<$Res> {
  factory _$$_FileAttachmentCopyWith(
          _$_FileAttachment value, $Res Function(_$_FileAttachment) then) =
      __$$_FileAttachmentCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic id,
      double? size,
      String? name,
      String path,
      String contentType,
      String? resourceType,
      int? type});
}

/// @nodoc
class __$$_FileAttachmentCopyWithImpl<$Res>
    extends _$FileAttachmentCopyWithImpl<$Res>
    implements _$$_FileAttachmentCopyWith<$Res> {
  __$$_FileAttachmentCopyWithImpl(
      _$_FileAttachment _value, $Res Function(_$_FileAttachment) _then)
      : super(_value, (v) => _then(v as _$_FileAttachment));

  @override
  _$_FileAttachment get _value => super._value as _$_FileAttachment;

  @override
  $Res call({
    Object? id = freezed,
    Object? size = freezed,
    Object? name = freezed,
    Object? path = freezed,
    Object? contentType = freezed,
    Object? resourceType = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_FileAttachment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: resourceType == freezed
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FileAttachment implements _FileAttachment {
  const _$_FileAttachment(
      {required this.id,
      this.size,
      this.name,
      required this.path,
      required this.contentType,
      this.resourceType,
      this.type});

  factory _$_FileAttachment.fromJson(Map<String, dynamic> json) =>
      _$$_FileAttachmentFromJson(json);

  @override
  final dynamic id;
  @override
  final double? size;
  @override
  final String? name;
  @override
  final String path;
  @override
  final String contentType;
  @override
  final String? resourceType;
  @override
  final int? type;

  @override
  String toString() {
    return 'FileAttachment(id: $id, size: $size, name: $name, path: $path, contentType: $contentType, resourceType: $resourceType, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FileAttachment &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality()
                .equals(other.contentType, contentType) &&
            const DeepCollectionEquality()
                .equals(other.resourceType, resourceType) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(path),
      const DeepCollectionEquality().hash(contentType),
      const DeepCollectionEquality().hash(resourceType),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_FileAttachmentCopyWith<_$_FileAttachment> get copyWith =>
      __$$_FileAttachmentCopyWithImpl<_$_FileAttachment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileAttachmentToJson(
      this,
    );
  }
}

abstract class _FileAttachment implements FileAttachment {
  const factory _FileAttachment(
      {required final dynamic id,
      final double? size,
      final String? name,
      required final String path,
      required final String contentType,
      final String? resourceType,
      final int? type}) = _$_FileAttachment;

  factory _FileAttachment.fromJson(Map<String, dynamic> json) =
      _$_FileAttachment.fromJson;

  @override
  dynamic get id;
  @override
  double? get size;
  @override
  String? get name;
  @override
  String get path;
  @override
  String get contentType;
  @override
  String? get resourceType;
  @override
  int? get type;
  @override
  @JsonKey(ignore: true)
  _$$_FileAttachmentCopyWith<_$_FileAttachment> get copyWith =>
      throw _privateConstructorUsedError;
}
