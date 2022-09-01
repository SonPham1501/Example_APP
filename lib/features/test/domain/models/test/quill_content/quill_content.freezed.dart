// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quill_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuillOperation _$QuillOperationFromJson(Map<String, dynamic> json) {
  return _QuillOperation.fromJson(json);
}

/// @nodoc
mixin _$QuillOperation {
  String? get content => throw _privateConstructorUsedError;
  QuillContentTypeEnum get type => throw _privateConstructorUsedError;
  Map<String, dynamic>? get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuillOperationCopyWith<QuillOperation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuillOperationCopyWith<$Res> {
  factory $QuillOperationCopyWith(
          QuillOperation value, $Res Function(QuillOperation) then) =
      _$QuillOperationCopyWithImpl<$Res>;
  $Res call(
      {String? content,
      QuillContentTypeEnum type,
      Map<String, dynamic>? attributes});
}

/// @nodoc
class _$QuillOperationCopyWithImpl<$Res>
    implements $QuillOperationCopyWith<$Res> {
  _$QuillOperationCopyWithImpl(this._value, this._then);

  final QuillOperation _value;
  // ignore: unused_field
  final $Res Function(QuillOperation) _then;

  @override
  $Res call({
    Object? content = freezed,
    Object? type = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuillContentTypeEnum,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$$_QuillOperationCopyWith<$Res>
    implements $QuillOperationCopyWith<$Res> {
  factory _$$_QuillOperationCopyWith(
          _$_QuillOperation value, $Res Function(_$_QuillOperation) then) =
      __$$_QuillOperationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? content,
      QuillContentTypeEnum type,
      Map<String, dynamic>? attributes});
}

/// @nodoc
class __$$_QuillOperationCopyWithImpl<$Res>
    extends _$QuillOperationCopyWithImpl<$Res>
    implements _$$_QuillOperationCopyWith<$Res> {
  __$$_QuillOperationCopyWithImpl(
      _$_QuillOperation _value, $Res Function(_$_QuillOperation) _then)
      : super(_value, (v) => _then(v as _$_QuillOperation));

  @override
  _$_QuillOperation get _value => super._value as _$_QuillOperation;

  @override
  $Res call({
    Object? content = freezed,
    Object? type = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$_QuillOperation(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuillContentTypeEnum,
      attributes: attributes == freezed
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuillOperation implements _QuillOperation {
  const _$_QuillOperation(
      {this.content,
      required this.type,
      final Map<String, dynamic>? attributes})
      : _attributes = attributes;

  factory _$_QuillOperation.fromJson(Map<String, dynamic> json) =>
      _$$_QuillOperationFromJson(json);

  @override
  final String? content;
  @override
  final QuillContentTypeEnum type;
  final Map<String, dynamic>? _attributes;
  @override
  Map<String, dynamic>? get attributes {
    final value = _attributes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'QuillOperation(content: $content, type: $type, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuillOperation &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(_attributes));

  @JsonKey(ignore: true)
  @override
  _$$_QuillOperationCopyWith<_$_QuillOperation> get copyWith =>
      __$$_QuillOperationCopyWithImpl<_$_QuillOperation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuillOperationToJson(
      this,
    );
  }
}

abstract class _QuillOperation implements QuillOperation {
  const factory _QuillOperation(
      {final String? content,
      required final QuillContentTypeEnum type,
      final Map<String, dynamic>? attributes}) = _$_QuillOperation;

  factory _QuillOperation.fromJson(Map<String, dynamic> json) =
      _$_QuillOperation.fromJson;

  @override
  String? get content;
  @override
  QuillContentTypeEnum get type;
  @override
  Map<String, dynamic>? get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_QuillOperationCopyWith<_$_QuillOperation> get copyWith =>
      throw _privateConstructorUsedError;
}

QuillContent _$QuillContentFromJson(Map<String, dynamic> json) {
  return _QuillContent.fromJson(json);
}

/// @nodoc
mixin _$QuillContent {
  List<QuillOperation> get operations => throw _privateConstructorUsedError;
  String? get html => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuillContentCopyWith<QuillContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuillContentCopyWith<$Res> {
  factory $QuillContentCopyWith(
          QuillContent value, $Res Function(QuillContent) then) =
      _$QuillContentCopyWithImpl<$Res>;
  $Res call({List<QuillOperation> operations, String? html});
}

/// @nodoc
class _$QuillContentCopyWithImpl<$Res> implements $QuillContentCopyWith<$Res> {
  _$QuillContentCopyWithImpl(this._value, this._then);

  final QuillContent _value;
  // ignore: unused_field
  final $Res Function(QuillContent) _then;

  @override
  $Res call({
    Object? operations = freezed,
    Object? html = freezed,
  }) {
    return _then(_value.copyWith(
      operations: operations == freezed
          ? _value.operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<QuillOperation>,
      html: html == freezed
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_QuillContentCopyWith<$Res>
    implements $QuillContentCopyWith<$Res> {
  factory _$$_QuillContentCopyWith(
          _$_QuillContent value, $Res Function(_$_QuillContent) then) =
      __$$_QuillContentCopyWithImpl<$Res>;
  @override
  $Res call({List<QuillOperation> operations, String? html});
}

/// @nodoc
class __$$_QuillContentCopyWithImpl<$Res>
    extends _$QuillContentCopyWithImpl<$Res>
    implements _$$_QuillContentCopyWith<$Res> {
  __$$_QuillContentCopyWithImpl(
      _$_QuillContent _value, $Res Function(_$_QuillContent) _then)
      : super(_value, (v) => _then(v as _$_QuillContent));

  @override
  _$_QuillContent get _value => super._value as _$_QuillContent;

  @override
  $Res call({
    Object? operations = freezed,
    Object? html = freezed,
  }) {
    return _then(_$_QuillContent(
      operations: operations == freezed
          ? _value._operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<QuillOperation>,
      html: html == freezed
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuillContent implements _QuillContent {
  const _$_QuillContent(
      {final List<QuillOperation> operations = const [], this.html})
      : _operations = operations;

  factory _$_QuillContent.fromJson(Map<String, dynamic> json) =>
      _$$_QuillContentFromJson(json);

  final List<QuillOperation> _operations;
  @override
  @JsonKey()
  List<QuillOperation> get operations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_operations);
  }

  @override
  final String? html;

  @override
  String toString() {
    return 'QuillContent(operations: $operations, html: $html)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuillContent &&
            const DeepCollectionEquality()
                .equals(other._operations, _operations) &&
            const DeepCollectionEquality().equals(other.html, html));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_operations),
      const DeepCollectionEquality().hash(html));

  @JsonKey(ignore: true)
  @override
  _$$_QuillContentCopyWith<_$_QuillContent> get copyWith =>
      __$$_QuillContentCopyWithImpl<_$_QuillContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuillContentToJson(
      this,
    );
  }
}

abstract class _QuillContent implements QuillContent {
  const factory _QuillContent(
      {final List<QuillOperation> operations,
      final String? html}) = _$_QuillContent;

  factory _QuillContent.fromJson(Map<String, dynamic> json) =
      _$_QuillContent.fromJson;

  @override
  List<QuillOperation> get operations;
  @override
  String? get html;
  @override
  @JsonKey(ignore: true)
  _$$_QuillContentCopyWith<_$_QuillContent> get copyWith =>
      throw _privateConstructorUsedError;
}
