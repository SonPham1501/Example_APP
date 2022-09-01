// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_file_attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppFileAttachmentType _$AppFileAttachmentTypeFromJson(
    Map<String, dynamic> json) {
  return _AppFileAttachmentType.fromJson(json);
}

/// @nodoc
mixin _$AppFileAttachmentType {
  String? get path => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get contentType => throw _privateConstructorUsedError;
  String? get resourceType => throw _privateConstructorUsedError;
  double? get size => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppFileAttachmentTypeCopyWith<AppFileAttachmentType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFileAttachmentTypeCopyWith<$Res> {
  factory $AppFileAttachmentTypeCopyWith(AppFileAttachmentType value,
          $Res Function(AppFileAttachmentType) then) =
      _$AppFileAttachmentTypeCopyWithImpl<$Res>;
  $Res call(
      {String? path,
      String? id,
      String? name,
      String? contentType,
      String? resourceType,
      double? size});
}

/// @nodoc
class _$AppFileAttachmentTypeCopyWithImpl<$Res>
    implements $AppFileAttachmentTypeCopyWith<$Res> {
  _$AppFileAttachmentTypeCopyWithImpl(this._value, this._then);

  final AppFileAttachmentType _value;
  // ignore: unused_field
  final $Res Function(AppFileAttachmentType) _then;

  @override
  $Res call({
    Object? path = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? contentType = freezed,
    Object? resourceType = freezed,
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      resourceType: resourceType == freezed
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String?,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_AppFileAttachmentTypeCopyWith<$Res>
    implements $AppFileAttachmentTypeCopyWith<$Res> {
  factory _$$_AppFileAttachmentTypeCopyWith(_$_AppFileAttachmentType value,
          $Res Function(_$_AppFileAttachmentType) then) =
      __$$_AppFileAttachmentTypeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? path,
      String? id,
      String? name,
      String? contentType,
      String? resourceType,
      double? size});
}

/// @nodoc
class __$$_AppFileAttachmentTypeCopyWithImpl<$Res>
    extends _$AppFileAttachmentTypeCopyWithImpl<$Res>
    implements _$$_AppFileAttachmentTypeCopyWith<$Res> {
  __$$_AppFileAttachmentTypeCopyWithImpl(_$_AppFileAttachmentType _value,
      $Res Function(_$_AppFileAttachmentType) _then)
      : super(_value, (v) => _then(v as _$_AppFileAttachmentType));

  @override
  _$_AppFileAttachmentType get _value =>
      super._value as _$_AppFileAttachmentType;

  @override
  $Res call({
    Object? path = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? contentType = freezed,
    Object? resourceType = freezed,
    Object? size = freezed,
  }) {
    return _then(_$_AppFileAttachmentType(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      resourceType: resourceType == freezed
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String?,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppFileAttachmentType extends _AppFileAttachmentType {
  const _$_AppFileAttachmentType(
      {this.path,
      this.id,
      this.name,
      this.contentType,
      this.resourceType,
      this.size})
      : super._();

  factory _$_AppFileAttachmentType.fromJson(Map<String, dynamic> json) =>
      _$$_AppFileAttachmentTypeFromJson(json);

  @override
  final String? path;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? contentType;
  @override
  final String? resourceType;
  @override
  final double? size;

  @override
  String toString() {
    return 'AppFileAttachmentType(path: $path, id: $id, name: $name, contentType: $contentType, resourceType: $resourceType, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppFileAttachmentType &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.contentType, contentType) &&
            const DeepCollectionEquality()
                .equals(other.resourceType, resourceType) &&
            const DeepCollectionEquality().equals(other.size, size));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(path),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(contentType),
      const DeepCollectionEquality().hash(resourceType),
      const DeepCollectionEquality().hash(size));

  @JsonKey(ignore: true)
  @override
  _$$_AppFileAttachmentTypeCopyWith<_$_AppFileAttachmentType> get copyWith =>
      __$$_AppFileAttachmentTypeCopyWithImpl<_$_AppFileAttachmentType>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppFileAttachmentTypeToJson(
      this,
    );
  }
}

abstract class _AppFileAttachmentType extends AppFileAttachmentType {
  const factory _AppFileAttachmentType(
      {final String? path,
      final String? id,
      final String? name,
      final String? contentType,
      final String? resourceType,
      final double? size}) = _$_AppFileAttachmentType;
  const _AppFileAttachmentType._() : super._();

  factory _AppFileAttachmentType.fromJson(Map<String, dynamic> json) =
      _$_AppFileAttachmentType.fromJson;

  @override
  String? get path;
  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get contentType;
  @override
  String? get resourceType;
  @override
  double? get size;
  @override
  @JsonKey(ignore: true)
  _$$_AppFileAttachmentTypeCopyWith<_$_AppFileAttachmentType> get copyWith =>
      throw _privateConstructorUsedError;
}
