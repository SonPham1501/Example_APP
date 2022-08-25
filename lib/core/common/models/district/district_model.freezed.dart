// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'district_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DistrictModel _$DistrictModelFromJson(Map<String, dynamic> json) {
  return _DistrictModel.fromJson(json);
}

/// @nodoc
mixin _$DistrictModel {
  int get id => throw _privateConstructorUsedError;
  int get cityId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistrictModelCopyWith<DistrictModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictModelCopyWith<$Res> {
  factory $DistrictModelCopyWith(
          DistrictModel value, $Res Function(DistrictModel) then) =
      _$DistrictModelCopyWithImpl<$Res>;
  $Res call({int id, int cityId, String name});
}

/// @nodoc
class _$DistrictModelCopyWithImpl<$Res>
    implements $DistrictModelCopyWith<$Res> {
  _$DistrictModelCopyWithImpl(this._value, this._then);

  final DistrictModel _value;
  // ignore: unused_field
  final $Res Function(DistrictModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? cityId = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cityId: cityId == freezed
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DistrictModelCopyWith<$Res>
    implements $DistrictModelCopyWith<$Res> {
  factory _$$_DistrictModelCopyWith(
          _$_DistrictModel value, $Res Function(_$_DistrictModel) then) =
      __$$_DistrictModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, int cityId, String name});
}

/// @nodoc
class __$$_DistrictModelCopyWithImpl<$Res>
    extends _$DistrictModelCopyWithImpl<$Res>
    implements _$$_DistrictModelCopyWith<$Res> {
  __$$_DistrictModelCopyWithImpl(
      _$_DistrictModel _value, $Res Function(_$_DistrictModel) _then)
      : super(_value, (v) => _then(v as _$_DistrictModel));

  @override
  _$_DistrictModel get _value => super._value as _$_DistrictModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? cityId = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_DistrictModel(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cityId == freezed
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DistrictModel implements _DistrictModel {
  _$_DistrictModel(this.id, this.cityId, this.name);

  factory _$_DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$$_DistrictModelFromJson(json);

  @override
  final int id;
  @override
  final int cityId;
  @override
  final String name;

  @override
  String toString() {
    return 'DistrictModel(id: $id, cityId: $cityId, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DistrictModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.cityId, cityId) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(cityId),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_DistrictModelCopyWith<_$_DistrictModel> get copyWith =>
      __$$_DistrictModelCopyWithImpl<_$_DistrictModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DistrictModelToJson(
      this,
    );
  }
}

abstract class _DistrictModel implements DistrictModel {
  factory _DistrictModel(final int id, final int cityId, final String name) =
      _$_DistrictModel;

  factory _DistrictModel.fromJson(Map<String, dynamic> json) =
      _$_DistrictModel.fromJson;

  @override
  int get id;
  @override
  int get cityId;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_DistrictModelCopyWith<_$_DistrictModel> get copyWith =>
      throw _privateConstructorUsedError;
}
