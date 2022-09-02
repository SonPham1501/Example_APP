// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'test_user_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TestUserType _$TestUserTypeFromJson(Map<String, dynamic> json) {
  return _TestUserType.fromJson(json);
}

/// @nodoc
mixin _$TestUserType {
  int get testArchivedId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  int? get testId => throw _privateConstructorUsedError;
  double get rankingPoint => throw _privateConstructorUsedError;
  int get totalRightAnswer => throw _privateConstructorUsedError;
  double get durationInSeconds => throw _privateConstructorUsedError;
  double get totalScore => throw _privateConstructorUsedError;
  double get totalRewardCoin => throw _privateConstructorUsedError;
  int? get testChallengeId => throw _privateConstructorUsedError;
  int? get top => throw _privateConstructorUsedError;
  DateTime? get finishedAt => throw _privateConstructorUsedError;
  DateTime? get startAt => throw _privateConstructorUsedError;
  TestStatsType? get testStats => throw _privateConstructorUsedError;
  TestArchivedType? get testArchived => throw _privateConstructorUsedError;
  Map<String, TestSubmitResultAnswerType> get result =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestUserTypeCopyWith<TestUserType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestUserTypeCopyWith<$Res> {
  factory $TestUserTypeCopyWith(
          TestUserType value, $Res Function(TestUserType) then) =
      _$TestUserTypeCopyWithImpl<$Res>;
  $Res call(
      {int testArchivedId,
      int userId,
      int index,
      int? testId,
      double rankingPoint,
      int totalRightAnswer,
      double durationInSeconds,
      double totalScore,
      double totalRewardCoin,
      int? testChallengeId,
      int? top,
      DateTime? finishedAt,
      DateTime? startAt,
      TestStatsType? testStats,
      TestArchivedType? testArchived,
      Map<String, TestSubmitResultAnswerType> result});

  $TestStatsTypeCopyWith<$Res>? get testStats;
  $TestArchivedTypeCopyWith<$Res>? get testArchived;
}

/// @nodoc
class _$TestUserTypeCopyWithImpl<$Res> implements $TestUserTypeCopyWith<$Res> {
  _$TestUserTypeCopyWithImpl(this._value, this._then);

  final TestUserType _value;
  // ignore: unused_field
  final $Res Function(TestUserType) _then;

  @override
  $Res call({
    Object? testArchivedId = freezed,
    Object? userId = freezed,
    Object? index = freezed,
    Object? testId = freezed,
    Object? rankingPoint = freezed,
    Object? totalRightAnswer = freezed,
    Object? durationInSeconds = freezed,
    Object? totalScore = freezed,
    Object? totalRewardCoin = freezed,
    Object? testChallengeId = freezed,
    Object? top = freezed,
    Object? finishedAt = freezed,
    Object? startAt = freezed,
    Object? testStats = freezed,
    Object? testArchived = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      testArchivedId: testArchivedId == freezed
          ? _value.testArchivedId
          : testArchivedId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      testId: testId == freezed
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as int?,
      rankingPoint: rankingPoint == freezed
          ? _value.rankingPoint
          : rankingPoint // ignore: cast_nullable_to_non_nullable
              as double,
      totalRightAnswer: totalRightAnswer == freezed
          ? _value.totalRightAnswer
          : totalRightAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      durationInSeconds: durationInSeconds == freezed
          ? _value.durationInSeconds
          : durationInSeconds // ignore: cast_nullable_to_non_nullable
              as double,
      totalScore: totalScore == freezed
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as double,
      totalRewardCoin: totalRewardCoin == freezed
          ? _value.totalRewardCoin
          : totalRewardCoin // ignore: cast_nullable_to_non_nullable
              as double,
      testChallengeId: testChallengeId == freezed
          ? _value.testChallengeId
          : testChallengeId // ignore: cast_nullable_to_non_nullable
              as int?,
      top: top == freezed
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as int?,
      finishedAt: finishedAt == freezed
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startAt: startAt == freezed
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      testStats: testStats == freezed
          ? _value.testStats
          : testStats // ignore: cast_nullable_to_non_nullable
              as TestStatsType?,
      testArchived: testArchived == freezed
          ? _value.testArchived
          : testArchived // ignore: cast_nullable_to_non_nullable
              as TestArchivedType?,
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Map<String, TestSubmitResultAnswerType>,
    ));
  }

  @override
  $TestStatsTypeCopyWith<$Res>? get testStats {
    if (_value.testStats == null) {
      return null;
    }

    return $TestStatsTypeCopyWith<$Res>(_value.testStats!, (value) {
      return _then(_value.copyWith(testStats: value));
    });
  }

  @override
  $TestArchivedTypeCopyWith<$Res>? get testArchived {
    if (_value.testArchived == null) {
      return null;
    }

    return $TestArchivedTypeCopyWith<$Res>(_value.testArchived!, (value) {
      return _then(_value.copyWith(testArchived: value));
    });
  }
}

/// @nodoc
abstract class _$$_TestUserTypeCopyWith<$Res>
    implements $TestUserTypeCopyWith<$Res> {
  factory _$$_TestUserTypeCopyWith(
          _$_TestUserType value, $Res Function(_$_TestUserType) then) =
      __$$_TestUserTypeCopyWithImpl<$Res>;
  @override
  $Res call(
      {int testArchivedId,
      int userId,
      int index,
      int? testId,
      double rankingPoint,
      int totalRightAnswer,
      double durationInSeconds,
      double totalScore,
      double totalRewardCoin,
      int? testChallengeId,
      int? top,
      DateTime? finishedAt,
      DateTime? startAt,
      TestStatsType? testStats,
      TestArchivedType? testArchived,
      Map<String, TestSubmitResultAnswerType> result});

  @override
  $TestStatsTypeCopyWith<$Res>? get testStats;
  @override
  $TestArchivedTypeCopyWith<$Res>? get testArchived;
}

/// @nodoc
class __$$_TestUserTypeCopyWithImpl<$Res>
    extends _$TestUserTypeCopyWithImpl<$Res>
    implements _$$_TestUserTypeCopyWith<$Res> {
  __$$_TestUserTypeCopyWithImpl(
      _$_TestUserType _value, $Res Function(_$_TestUserType) _then)
      : super(_value, (v) => _then(v as _$_TestUserType));

  @override
  _$_TestUserType get _value => super._value as _$_TestUserType;

  @override
  $Res call({
    Object? testArchivedId = freezed,
    Object? userId = freezed,
    Object? index = freezed,
    Object? testId = freezed,
    Object? rankingPoint = freezed,
    Object? totalRightAnswer = freezed,
    Object? durationInSeconds = freezed,
    Object? totalScore = freezed,
    Object? totalRewardCoin = freezed,
    Object? testChallengeId = freezed,
    Object? top = freezed,
    Object? finishedAt = freezed,
    Object? startAt = freezed,
    Object? testStats = freezed,
    Object? testArchived = freezed,
    Object? result = freezed,
  }) {
    return _then(_$_TestUserType(
      testArchivedId: testArchivedId == freezed
          ? _value.testArchivedId
          : testArchivedId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      testId: testId == freezed
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as int?,
      rankingPoint: rankingPoint == freezed
          ? _value.rankingPoint
          : rankingPoint // ignore: cast_nullable_to_non_nullable
              as double,
      totalRightAnswer: totalRightAnswer == freezed
          ? _value.totalRightAnswer
          : totalRightAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      durationInSeconds: durationInSeconds == freezed
          ? _value.durationInSeconds
          : durationInSeconds // ignore: cast_nullable_to_non_nullable
              as double,
      totalScore: totalScore == freezed
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as double,
      totalRewardCoin: totalRewardCoin == freezed
          ? _value.totalRewardCoin
          : totalRewardCoin // ignore: cast_nullable_to_non_nullable
              as double,
      testChallengeId: testChallengeId == freezed
          ? _value.testChallengeId
          : testChallengeId // ignore: cast_nullable_to_non_nullable
              as int?,
      top: top == freezed
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as int?,
      finishedAt: finishedAt == freezed
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startAt: startAt == freezed
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      testStats: testStats == freezed
          ? _value.testStats
          : testStats // ignore: cast_nullable_to_non_nullable
              as TestStatsType?,
      testArchived: testArchived == freezed
          ? _value.testArchived
          : testArchived // ignore: cast_nullable_to_non_nullable
              as TestArchivedType?,
      result: result == freezed
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as Map<String, TestSubmitResultAnswerType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TestUserType implements _TestUserType {
  _$_TestUserType(
      {required this.testArchivedId,
      required this.userId,
      required this.index,
      this.testId,
      this.rankingPoint = 0,
      this.totalRightAnswer = 0,
      this.durationInSeconds = 0,
      this.totalScore = 0,
      this.totalRewardCoin = 0,
      this.testChallengeId,
      this.top,
      this.finishedAt,
      this.startAt,
      this.testStats,
      this.testArchived,
      final Map<String, TestSubmitResultAnswerType> result = const {}})
      : _result = result;

  factory _$_TestUserType.fromJson(Map<String, dynamic> json) =>
      _$$_TestUserTypeFromJson(json);

  @override
  final int testArchivedId;
  @override
  final int userId;
  @override
  final int index;
  @override
  final int? testId;
  @override
  @JsonKey()
  final double rankingPoint;
  @override
  @JsonKey()
  final int totalRightAnswer;
  @override
  @JsonKey()
  final double durationInSeconds;
  @override
  @JsonKey()
  final double totalScore;
  @override
  @JsonKey()
  final double totalRewardCoin;
  @override
  final int? testChallengeId;
  @override
  final int? top;
  @override
  final DateTime? finishedAt;
  @override
  final DateTime? startAt;
  @override
  final TestStatsType? testStats;
  @override
  final TestArchivedType? testArchived;
  final Map<String, TestSubmitResultAnswerType> _result;
  @override
  @JsonKey()
  Map<String, TestSubmitResultAnswerType> get result {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_result);
  }

  @override
  String toString() {
    return 'TestUserType(testArchivedId: $testArchivedId, userId: $userId, index: $index, testId: $testId, rankingPoint: $rankingPoint, totalRightAnswer: $totalRightAnswer, durationInSeconds: $durationInSeconds, totalScore: $totalScore, totalRewardCoin: $totalRewardCoin, testChallengeId: $testChallengeId, top: $top, finishedAt: $finishedAt, startAt: $startAt, testStats: $testStats, testArchived: $testArchived, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TestUserType &&
            const DeepCollectionEquality()
                .equals(other.testArchivedId, testArchivedId) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.testId, testId) &&
            const DeepCollectionEquality()
                .equals(other.rankingPoint, rankingPoint) &&
            const DeepCollectionEquality()
                .equals(other.totalRightAnswer, totalRightAnswer) &&
            const DeepCollectionEquality()
                .equals(other.durationInSeconds, durationInSeconds) &&
            const DeepCollectionEquality()
                .equals(other.totalScore, totalScore) &&
            const DeepCollectionEquality()
                .equals(other.totalRewardCoin, totalRewardCoin) &&
            const DeepCollectionEquality()
                .equals(other.testChallengeId, testChallengeId) &&
            const DeepCollectionEquality().equals(other.top, top) &&
            const DeepCollectionEquality()
                .equals(other.finishedAt, finishedAt) &&
            const DeepCollectionEquality().equals(other.startAt, startAt) &&
            const DeepCollectionEquality().equals(other.testStats, testStats) &&
            const DeepCollectionEquality()
                .equals(other.testArchived, testArchived) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(testArchivedId),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(testId),
      const DeepCollectionEquality().hash(rankingPoint),
      const DeepCollectionEquality().hash(totalRightAnswer),
      const DeepCollectionEquality().hash(durationInSeconds),
      const DeepCollectionEquality().hash(totalScore),
      const DeepCollectionEquality().hash(totalRewardCoin),
      const DeepCollectionEquality().hash(testChallengeId),
      const DeepCollectionEquality().hash(top),
      const DeepCollectionEquality().hash(finishedAt),
      const DeepCollectionEquality().hash(startAt),
      const DeepCollectionEquality().hash(testStats),
      const DeepCollectionEquality().hash(testArchived),
      const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  _$$_TestUserTypeCopyWith<_$_TestUserType> get copyWith =>
      __$$_TestUserTypeCopyWithImpl<_$_TestUserType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TestUserTypeToJson(
      this,
    );
  }
}

abstract class _TestUserType implements TestUserType {
  factory _TestUserType(
      {required final int testArchivedId,
      required final int userId,
      required final int index,
      final int? testId,
      final double rankingPoint,
      final int totalRightAnswer,
      final double durationInSeconds,
      final double totalScore,
      final double totalRewardCoin,
      final int? testChallengeId,
      final int? top,
      final DateTime? finishedAt,
      final DateTime? startAt,
      final TestStatsType? testStats,
      final TestArchivedType? testArchived,
      final Map<String, TestSubmitResultAnswerType> result}) = _$_TestUserType;

  factory _TestUserType.fromJson(Map<String, dynamic> json) =
      _$_TestUserType.fromJson;

  @override
  int get testArchivedId;
  @override
  int get userId;
  @override
  int get index;
  @override
  int? get testId;
  @override
  double get rankingPoint;
  @override
  int get totalRightAnswer;
  @override
  double get durationInSeconds;
  @override
  double get totalScore;
  @override
  double get totalRewardCoin;
  @override
  int? get testChallengeId;
  @override
  int? get top;
  @override
  DateTime? get finishedAt;
  @override
  DateTime? get startAt;
  @override
  TestStatsType? get testStats;
  @override
  TestArchivedType? get testArchived;
  @override
  Map<String, TestSubmitResultAnswerType> get result;
  @override
  @JsonKey(ignore: true)
  _$$_TestUserTypeCopyWith<_$_TestUserType> get copyWith =>
      throw _privateConstructorUsedError;
}

TestSubmitResultAnswerType _$TestSubmitResultAnswerTypeFromJson(
    Map<String, dynamic> json) {
  return _TestSubmitResultAnswerType.fromJson(json);
}

/// @nodoc
mixin _$TestSubmitResultAnswerType {
  bool get isCorrect => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestSubmitResultAnswerTypeCopyWith<TestSubmitResultAnswerType>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestSubmitResultAnswerTypeCopyWith<$Res> {
  factory $TestSubmitResultAnswerTypeCopyWith(TestSubmitResultAnswerType value,
          $Res Function(TestSubmitResultAnswerType) then) =
      _$TestSubmitResultAnswerTypeCopyWithImpl<$Res>;
  $Res call({bool isCorrect, List<String> answers});
}

/// @nodoc
class _$TestSubmitResultAnswerTypeCopyWithImpl<$Res>
    implements $TestSubmitResultAnswerTypeCopyWith<$Res> {
  _$TestSubmitResultAnswerTypeCopyWithImpl(this._value, this._then);

  final TestSubmitResultAnswerType _value;
  // ignore: unused_field
  final $Res Function(TestSubmitResultAnswerType) _then;

  @override
  $Res call({
    Object? isCorrect = freezed,
    Object? answers = freezed,
  }) {
    return _then(_value.copyWith(
      isCorrect: isCorrect == freezed
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_TestSubmitResultAnswerTypeCopyWith<$Res>
    implements $TestSubmitResultAnswerTypeCopyWith<$Res> {
  factory _$$_TestSubmitResultAnswerTypeCopyWith(
          _$_TestSubmitResultAnswerType value,
          $Res Function(_$_TestSubmitResultAnswerType) then) =
      __$$_TestSubmitResultAnswerTypeCopyWithImpl<$Res>;
  @override
  $Res call({bool isCorrect, List<String> answers});
}

/// @nodoc
class __$$_TestSubmitResultAnswerTypeCopyWithImpl<$Res>
    extends _$TestSubmitResultAnswerTypeCopyWithImpl<$Res>
    implements _$$_TestSubmitResultAnswerTypeCopyWith<$Res> {
  __$$_TestSubmitResultAnswerTypeCopyWithImpl(
      _$_TestSubmitResultAnswerType _value,
      $Res Function(_$_TestSubmitResultAnswerType) _then)
      : super(_value, (v) => _then(v as _$_TestSubmitResultAnswerType));

  @override
  _$_TestSubmitResultAnswerType get _value =>
      super._value as _$_TestSubmitResultAnswerType;

  @override
  $Res call({
    Object? isCorrect = freezed,
    Object? answers = freezed,
  }) {
    return _then(_$_TestSubmitResultAnswerType(
      isCorrect: isCorrect == freezed
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      answers: answers == freezed
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TestSubmitResultAnswerType implements _TestSubmitResultAnswerType {
  const _$_TestSubmitResultAnswerType(
      {this.isCorrect = false, final List<String> answers = const []})
      : _answers = answers;

  factory _$_TestSubmitResultAnswerType.fromJson(Map<String, dynamic> json) =>
      _$$_TestSubmitResultAnswerTypeFromJson(json);

  @override
  @JsonKey()
  final bool isCorrect;
  final List<String> _answers;
  @override
  @JsonKey()
  List<String> get answers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'TestSubmitResultAnswerType(isCorrect: $isCorrect, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TestSubmitResultAnswerType &&
            const DeepCollectionEquality().equals(other.isCorrect, isCorrect) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isCorrect),
      const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  _$$_TestSubmitResultAnswerTypeCopyWith<_$_TestSubmitResultAnswerType>
      get copyWith => __$$_TestSubmitResultAnswerTypeCopyWithImpl<
          _$_TestSubmitResultAnswerType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TestSubmitResultAnswerTypeToJson(
      this,
    );
  }
}

abstract class _TestSubmitResultAnswerType
    implements TestSubmitResultAnswerType {
  const factory _TestSubmitResultAnswerType(
      {final bool isCorrect,
      final List<String> answers}) = _$_TestSubmitResultAnswerType;

  factory _TestSubmitResultAnswerType.fromJson(Map<String, dynamic> json) =
      _$_TestSubmitResultAnswerType.fromJson;

  @override
  bool get isCorrect;
  @override
  List<String> get answers;
  @override
  @JsonKey(ignore: true)
  _$$_TestSubmitResultAnswerTypeCopyWith<_$_TestSubmitResultAnswerType>
      get copyWith => throw _privateConstructorUsedError;
}
