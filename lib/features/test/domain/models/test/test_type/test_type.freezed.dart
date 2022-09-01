// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'test_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TestType _$TestTypeFromJson(Map<String, dynamic> json) {
  return _TestType.fromJson(json);
}

/// @nodoc
mixin _$TestType {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  int get totalQuestions => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'rankings', fromJson: _getTestUsersFromJson)
  ApiListResponseWrapper<TestUserType> get rankings =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'testHistories', fromJson: _getTestUsersFromJson)
  ApiListResponseWrapper<TestUserType> get testHistories =>
      throw _privateConstructorUsedError;
  TestStatsType? get stats => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;
  int? get testVersion => throw _privateConstructorUsedError;
  List<TestSectionType> get sections => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestTypeCopyWith<TestType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestTypeCopyWith<$Res> {
  factory $TestTypeCopyWith(TestType value, $Res Function(TestType) then) =
      _$TestTypeCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String title,
      DateTime? createdAt,
      int totalQuestions,
      int duration,
      @JsonKey(name: 'rankings', fromJson: _getTestUsersFromJson)
          ApiListResponseWrapper<TestUserType> rankings,
      @JsonKey(name: 'testHistories', fromJson: _getTestUsersFromJson)
          ApiListResponseWrapper<TestUserType> testHistories,
      TestStatsType? stats,
      int? categoryId,
      int? testVersion,
      List<TestSectionType> sections});

  $TestStatsTypeCopyWith<$Res>? get stats;
}

/// @nodoc
class _$TestTypeCopyWithImpl<$Res> implements $TestTypeCopyWith<$Res> {
  _$TestTypeCopyWithImpl(this._value, this._then);

  final TestType _value;
  // ignore: unused_field
  final $Res Function(TestType) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
    Object? totalQuestions = freezed,
    Object? duration = freezed,
    Object? rankings = freezed,
    Object? testHistories = freezed,
    Object? stats = freezed,
    Object? categoryId = freezed,
    Object? testVersion = freezed,
    Object? sections = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalQuestions: totalQuestions == freezed
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      rankings: rankings == freezed
          ? _value.rankings
          : rankings // ignore: cast_nullable_to_non_nullable
              as ApiListResponseWrapper<TestUserType>,
      testHistories: testHistories == freezed
          ? _value.testHistories
          : testHistories // ignore: cast_nullable_to_non_nullable
              as ApiListResponseWrapper<TestUserType>,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as TestStatsType?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      testVersion: testVersion == freezed
          ? _value.testVersion
          : testVersion // ignore: cast_nullable_to_non_nullable
              as int?,
      sections: sections == freezed
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<TestSectionType>,
    ));
  }

  @override
  $TestStatsTypeCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $TestStatsTypeCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value));
    });
  }
}

/// @nodoc
abstract class _$$_TestTypeCopyWith<$Res> implements $TestTypeCopyWith<$Res> {
  factory _$$_TestTypeCopyWith(
          _$_TestType value, $Res Function(_$_TestType) then) =
      __$$_TestTypeCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String title,
      DateTime? createdAt,
      int totalQuestions,
      int duration,
      @JsonKey(name: 'rankings', fromJson: _getTestUsersFromJson)
          ApiListResponseWrapper<TestUserType> rankings,
      @JsonKey(name: 'testHistories', fromJson: _getTestUsersFromJson)
          ApiListResponseWrapper<TestUserType> testHistories,
      TestStatsType? stats,
      int? categoryId,
      int? testVersion,
      List<TestSectionType> sections});

  @override
  $TestStatsTypeCopyWith<$Res>? get stats;
}

/// @nodoc
class __$$_TestTypeCopyWithImpl<$Res> extends _$TestTypeCopyWithImpl<$Res>
    implements _$$_TestTypeCopyWith<$Res> {
  __$$_TestTypeCopyWithImpl(
      _$_TestType _value, $Res Function(_$_TestType) _then)
      : super(_value, (v) => _then(v as _$_TestType));

  @override
  _$_TestType get _value => super._value as _$_TestType;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
    Object? totalQuestions = freezed,
    Object? duration = freezed,
    Object? rankings = freezed,
    Object? testHistories = freezed,
    Object? stats = freezed,
    Object? categoryId = freezed,
    Object? testVersion = freezed,
    Object? sections = freezed,
  }) {
    return _then(_$_TestType(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalQuestions: totalQuestions == freezed
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      rankings: rankings == freezed
          ? _value.rankings
          : rankings // ignore: cast_nullable_to_non_nullable
              as ApiListResponseWrapper<TestUserType>,
      testHistories: testHistories == freezed
          ? _value.testHistories
          : testHistories // ignore: cast_nullable_to_non_nullable
              as ApiListResponseWrapper<TestUserType>,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as TestStatsType?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      testVersion: testVersion == freezed
          ? _value.testVersion
          : testVersion // ignore: cast_nullable_to_non_nullable
              as int?,
      sections: sections == freezed
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<TestSectionType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TestType implements _TestType {
  _$_TestType(
      {required this.id,
      required this.title,
      this.createdAt,
      this.totalQuestions = 0,
      this.duration = 0,
      @JsonKey(name: 'rankings', fromJson: _getTestUsersFromJson)
          this.rankings = const ApiListResponseWrapper<TestUserType>(),
      @JsonKey(name: 'testHistories', fromJson: _getTestUsersFromJson)
          this.testHistories = const ApiListResponseWrapper<TestUserType>(),
      this.stats,
      this.categoryId,
      this.testVersion,
      final List<TestSectionType> sections = const []})
      : _sections = sections;

  factory _$_TestType.fromJson(Map<String, dynamic> json) =>
      _$$_TestTypeFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final DateTime? createdAt;
  @override
  @JsonKey()
  final int totalQuestions;
  @override
  @JsonKey()
  final int duration;
  @override
  @JsonKey(name: 'rankings', fromJson: _getTestUsersFromJson)
  final ApiListResponseWrapper<TestUserType> rankings;
  @override
  @JsonKey(name: 'testHistories', fromJson: _getTestUsersFromJson)
  final ApiListResponseWrapper<TestUserType> testHistories;
  @override
  final TestStatsType? stats;
  @override
  final int? categoryId;
  @override
  final int? testVersion;
  final List<TestSectionType> _sections;
  @override
  @JsonKey()
  List<TestSectionType> get sections {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  String toString() {
    return 'TestType(id: $id, title: $title, createdAt: $createdAt, totalQuestions: $totalQuestions, duration: $duration, rankings: $rankings, testHistories: $testHistories, stats: $stats, categoryId: $categoryId, testVersion: $testVersion, sections: $sections)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TestType &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.totalQuestions, totalQuestions) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.rankings, rankings) &&
            const DeepCollectionEquality()
                .equals(other.testHistories, testHistories) &&
            const DeepCollectionEquality().equals(other.stats, stats) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality()
                .equals(other.testVersion, testVersion) &&
            const DeepCollectionEquality().equals(other._sections, _sections));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(totalQuestions),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(rankings),
      const DeepCollectionEquality().hash(testHistories),
      const DeepCollectionEquality().hash(stats),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(testVersion),
      const DeepCollectionEquality().hash(_sections));

  @JsonKey(ignore: true)
  @override
  _$$_TestTypeCopyWith<_$_TestType> get copyWith =>
      __$$_TestTypeCopyWithImpl<_$_TestType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TestTypeToJson(
      this,
    );
  }
}

abstract class _TestType implements TestType {
  factory _TestType(
      {required final int id,
      required final String title,
      final DateTime? createdAt,
      final int totalQuestions,
      final int duration,
      @JsonKey(name: 'rankings', fromJson: _getTestUsersFromJson)
          final ApiListResponseWrapper<TestUserType> rankings,
      @JsonKey(name: 'testHistories', fromJson: _getTestUsersFromJson)
          final ApiListResponseWrapper<TestUserType> testHistories,
      final TestStatsType? stats,
      final int? categoryId,
      final int? testVersion,
      final List<TestSectionType> sections}) = _$_TestType;

  factory _TestType.fromJson(Map<String, dynamic> json) = _$_TestType.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  DateTime? get createdAt;
  @override
  int get totalQuestions;
  @override
  int get duration;
  @override
  @JsonKey(name: 'rankings', fromJson: _getTestUsersFromJson)
  ApiListResponseWrapper<TestUserType> get rankings;
  @override
  @JsonKey(name: 'testHistories', fromJson: _getTestUsersFromJson)
  ApiListResponseWrapper<TestUserType> get testHistories;
  @override
  TestStatsType? get stats;
  @override
  int? get categoryId;
  @override
  int? get testVersion;
  @override
  List<TestSectionType> get sections;
  @override
  @JsonKey(ignore: true)
  _$$_TestTypeCopyWith<_$_TestType> get copyWith =>
      throw _privateConstructorUsedError;
}

TestSectionType _$TestSectionTypeFromJson(Map<String, dynamic> json) {
  return _TestSectionType.fromJson(json);
}

/// @nodoc
mixin _$TestSectionType {
  int get id => throw _privateConstructorUsedError;
  QuillContent get name => throw _privateConstructorUsedError;
  TestQuestionTypeEnum? get type => throw _privateConstructorUsedError;
  String? get extraData => throw _privateConstructorUsedError;
  QuillContent? get note => throw _privateConstructorUsedError;
  QuillContent? get paragraph => throw _privateConstructorUsedError;
  double get totalScore => throw _privateConstructorUsedError;
  List<TestQuestionType> get questions => throw _privateConstructorUsedError;
  List<AppFileAttachmentType>? get images => throw _privateConstructorUsedError;
  List<AppFileAttachmentType>? get audios => throw _privateConstructorUsedError;
  List<String>? get words => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestSectionTypeCopyWith<TestSectionType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestSectionTypeCopyWith<$Res> {
  factory $TestSectionTypeCopyWith(
          TestSectionType value, $Res Function(TestSectionType) then) =
      _$TestSectionTypeCopyWithImpl<$Res>;
  $Res call(
      {int id,
      QuillContent name,
      TestQuestionTypeEnum? type,
      String? extraData,
      QuillContent? note,
      QuillContent? paragraph,
      double totalScore,
      List<TestQuestionType> questions,
      List<AppFileAttachmentType>? images,
      List<AppFileAttachmentType>? audios,
      List<String>? words});

  $QuillContentCopyWith<$Res> get name;
  $QuillContentCopyWith<$Res>? get note;
  $QuillContentCopyWith<$Res>? get paragraph;
}

/// @nodoc
class _$TestSectionTypeCopyWithImpl<$Res>
    implements $TestSectionTypeCopyWith<$Res> {
  _$TestSectionTypeCopyWithImpl(this._value, this._then);

  final TestSectionType _value;
  // ignore: unused_field
  final $Res Function(TestSectionType) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? extraData = freezed,
    Object? note = freezed,
    Object? paragraph = freezed,
    Object? totalScore = freezed,
    Object? questions = freezed,
    Object? images = freezed,
    Object? audios = freezed,
    Object? words = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as QuillContent,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TestQuestionTypeEnum?,
      extraData: extraData == freezed
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as QuillContent?,
      paragraph: paragraph == freezed
          ? _value.paragraph
          : paragraph // ignore: cast_nullable_to_non_nullable
              as QuillContent?,
      totalScore: totalScore == freezed
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as double,
      questions: questions == freezed
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<TestQuestionType>,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<AppFileAttachmentType>?,
      audios: audios == freezed
          ? _value.audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<AppFileAttachmentType>?,
      words: words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }

  @override
  $QuillContentCopyWith<$Res> get name {
    return $QuillContentCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value));
    });
  }

  @override
  $QuillContentCopyWith<$Res>? get note {
    if (_value.note == null) {
      return null;
    }

    return $QuillContentCopyWith<$Res>(_value.note!, (value) {
      return _then(_value.copyWith(note: value));
    });
  }

  @override
  $QuillContentCopyWith<$Res>? get paragraph {
    if (_value.paragraph == null) {
      return null;
    }

    return $QuillContentCopyWith<$Res>(_value.paragraph!, (value) {
      return _then(_value.copyWith(paragraph: value));
    });
  }
}

/// @nodoc
abstract class _$$_TestSectionTypeCopyWith<$Res>
    implements $TestSectionTypeCopyWith<$Res> {
  factory _$$_TestSectionTypeCopyWith(
          _$_TestSectionType value, $Res Function(_$_TestSectionType) then) =
      __$$_TestSectionTypeCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      QuillContent name,
      TestQuestionTypeEnum? type,
      String? extraData,
      QuillContent? note,
      QuillContent? paragraph,
      double totalScore,
      List<TestQuestionType> questions,
      List<AppFileAttachmentType>? images,
      List<AppFileAttachmentType>? audios,
      List<String>? words});

  @override
  $QuillContentCopyWith<$Res> get name;
  @override
  $QuillContentCopyWith<$Res>? get note;
  @override
  $QuillContentCopyWith<$Res>? get paragraph;
}

/// @nodoc
class __$$_TestSectionTypeCopyWithImpl<$Res>
    extends _$TestSectionTypeCopyWithImpl<$Res>
    implements _$$_TestSectionTypeCopyWith<$Res> {
  __$$_TestSectionTypeCopyWithImpl(
      _$_TestSectionType _value, $Res Function(_$_TestSectionType) _then)
      : super(_value, (v) => _then(v as _$_TestSectionType));

  @override
  _$_TestSectionType get _value => super._value as _$_TestSectionType;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? extraData = freezed,
    Object? note = freezed,
    Object? paragraph = freezed,
    Object? totalScore = freezed,
    Object? questions = freezed,
    Object? images = freezed,
    Object? audios = freezed,
    Object? words = freezed,
  }) {
    return _then(_$_TestSectionType(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as QuillContent,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TestQuestionTypeEnum?,
      extraData: extraData == freezed
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as QuillContent?,
      paragraph: paragraph == freezed
          ? _value.paragraph
          : paragraph // ignore: cast_nullable_to_non_nullable
              as QuillContent?,
      totalScore: totalScore == freezed
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as double,
      questions: questions == freezed
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<TestQuestionType>,
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<AppFileAttachmentType>?,
      audios: audios == freezed
          ? _value._audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<AppFileAttachmentType>?,
      words: words == freezed
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TestSectionType implements _TestSectionType {
  const _$_TestSectionType(
      {required this.id,
      required this.name,
      this.type,
      this.extraData,
      this.note,
      this.paragraph,
      this.totalScore = 0,
      final List<TestQuestionType> questions = const [],
      final List<AppFileAttachmentType>? images,
      final List<AppFileAttachmentType>? audios,
      final List<String>? words})
      : _questions = questions,
        _images = images,
        _audios = audios,
        _words = words;

  factory _$_TestSectionType.fromJson(Map<String, dynamic> json) =>
      _$$_TestSectionTypeFromJson(json);

  @override
  final int id;
  @override
  final QuillContent name;
  @override
  final TestQuestionTypeEnum? type;
  @override
  final String? extraData;
  @override
  final QuillContent? note;
  @override
  final QuillContent? paragraph;
  @override
  @JsonKey()
  final double totalScore;
  final List<TestQuestionType> _questions;
  @override
  @JsonKey()
  List<TestQuestionType> get questions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  final List<AppFileAttachmentType>? _images;
  @override
  List<AppFileAttachmentType>? get images {
    final value = _images;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AppFileAttachmentType>? _audios;
  @override
  List<AppFileAttachmentType>? get audios {
    final value = _audios;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _words;
  @override
  List<String>? get words {
    final value = _words;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TestSectionType(id: $id, name: $name, type: $type, extraData: $extraData, note: $note, paragraph: $paragraph, totalScore: $totalScore, questions: $questions, images: $images, audios: $audios, words: $words)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TestSectionType &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.extraData, extraData) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.paragraph, paragraph) &&
            const DeepCollectionEquality()
                .equals(other.totalScore, totalScore) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._audios, _audios) &&
            const DeepCollectionEquality().equals(other._words, _words));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(extraData),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(paragraph),
      const DeepCollectionEquality().hash(totalScore),
      const DeepCollectionEquality().hash(_questions),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_audios),
      const DeepCollectionEquality().hash(_words));

  @JsonKey(ignore: true)
  @override
  _$$_TestSectionTypeCopyWith<_$_TestSectionType> get copyWith =>
      __$$_TestSectionTypeCopyWithImpl<_$_TestSectionType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TestSectionTypeToJson(
      this,
    );
  }
}

abstract class _TestSectionType implements TestSectionType {
  const factory _TestSectionType(
      {required final int id,
      required final QuillContent name,
      final TestQuestionTypeEnum? type,
      final String? extraData,
      final QuillContent? note,
      final QuillContent? paragraph,
      final double totalScore,
      final List<TestQuestionType> questions,
      final List<AppFileAttachmentType>? images,
      final List<AppFileAttachmentType>? audios,
      final List<String>? words}) = _$_TestSectionType;

  factory _TestSectionType.fromJson(Map<String, dynamic> json) =
      _$_TestSectionType.fromJson;

  @override
  int get id;
  @override
  QuillContent get name;
  @override
  TestQuestionTypeEnum? get type;
  @override
  String? get extraData;
  @override
  QuillContent? get note;
  @override
  QuillContent? get paragraph;
  @override
  double get totalScore;
  @override
  List<TestQuestionType> get questions;
  @override
  List<AppFileAttachmentType>? get images;
  @override
  List<AppFileAttachmentType>? get audios;
  @override
  List<String>? get words;
  @override
  @JsonKey(ignore: true)
  _$$_TestSectionTypeCopyWith<_$_TestSectionType> get copyWith =>
      throw _privateConstructorUsedError;
}

TestQuestionType _$TestQuestionTypeFromJson(Map<String, dynamic> json) {
  return _TestQuestionType.fromJson(json);
}

/// @nodoc
mixin _$TestQuestionType {
  String get id => throw _privateConstructorUsedError;
  QuillContent? get name => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;
  TestQuestionTypeEnum get type => throw _privateConstructorUsedError;
  String? get extraData => throw _privateConstructorUsedError;
  QuillContent? get note => throw _privateConstructorUsedError;
  int get testSectionId => throw _privateConstructorUsedError;
  List<TestQuestionAnswerType> get answers =>
      throw _privateConstructorUsedError;
  List<AppFileAttachmentType>? get images => throw _privateConstructorUsedError;
  List<AppFileAttachmentType>? get audios => throw _privateConstructorUsedError;
  List<String>? get words => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestQuestionTypeCopyWith<TestQuestionType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestQuestionTypeCopyWith<$Res> {
  factory $TestQuestionTypeCopyWith(
          TestQuestionType value, $Res Function(TestQuestionType) then) =
      _$TestQuestionTypeCopyWithImpl<$Res>;
  $Res call(
      {String id,
      QuillContent? name,
      double? score,
      TestQuestionTypeEnum type,
      String? extraData,
      QuillContent? note,
      int testSectionId,
      List<TestQuestionAnswerType> answers,
      List<AppFileAttachmentType>? images,
      List<AppFileAttachmentType>? audios,
      List<String>? words});

  $QuillContentCopyWith<$Res>? get name;
  $QuillContentCopyWith<$Res>? get note;
}

/// @nodoc
class _$TestQuestionTypeCopyWithImpl<$Res>
    implements $TestQuestionTypeCopyWith<$Res> {
  _$TestQuestionTypeCopyWithImpl(this._value, this._then);

  final TestQuestionType _value;
  // ignore: unused_field
  final $Res Function(TestQuestionType) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? score = freezed,
    Object? type = freezed,
    Object? extraData = freezed,
    Object? note = freezed,
    Object? testSectionId = freezed,
    Object? answers = freezed,
    Object? images = freezed,
    Object? audios = freezed,
    Object? words = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as QuillContent?,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TestQuestionTypeEnum,
      extraData: extraData == freezed
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as QuillContent?,
      testSectionId: testSectionId == freezed
          ? _value.testSectionId
          : testSectionId // ignore: cast_nullable_to_non_nullable
              as int,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<TestQuestionAnswerType>,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<AppFileAttachmentType>?,
      audios: audios == freezed
          ? _value.audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<AppFileAttachmentType>?,
      words: words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }

  @override
  $QuillContentCopyWith<$Res>? get name {
    if (_value.name == null) {
      return null;
    }

    return $QuillContentCopyWith<$Res>(_value.name!, (value) {
      return _then(_value.copyWith(name: value));
    });
  }

  @override
  $QuillContentCopyWith<$Res>? get note {
    if (_value.note == null) {
      return null;
    }

    return $QuillContentCopyWith<$Res>(_value.note!, (value) {
      return _then(_value.copyWith(note: value));
    });
  }
}

/// @nodoc
abstract class _$$_TestQuestionTypeCopyWith<$Res>
    implements $TestQuestionTypeCopyWith<$Res> {
  factory _$$_TestQuestionTypeCopyWith(
          _$_TestQuestionType value, $Res Function(_$_TestQuestionType) then) =
      __$$_TestQuestionTypeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      QuillContent? name,
      double? score,
      TestQuestionTypeEnum type,
      String? extraData,
      QuillContent? note,
      int testSectionId,
      List<TestQuestionAnswerType> answers,
      List<AppFileAttachmentType>? images,
      List<AppFileAttachmentType>? audios,
      List<String>? words});

  @override
  $QuillContentCopyWith<$Res>? get name;
  @override
  $QuillContentCopyWith<$Res>? get note;
}

/// @nodoc
class __$$_TestQuestionTypeCopyWithImpl<$Res>
    extends _$TestQuestionTypeCopyWithImpl<$Res>
    implements _$$_TestQuestionTypeCopyWith<$Res> {
  __$$_TestQuestionTypeCopyWithImpl(
      _$_TestQuestionType _value, $Res Function(_$_TestQuestionType) _then)
      : super(_value, (v) => _then(v as _$_TestQuestionType));

  @override
  _$_TestQuestionType get _value => super._value as _$_TestQuestionType;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? score = freezed,
    Object? type = freezed,
    Object? extraData = freezed,
    Object? note = freezed,
    Object? testSectionId = freezed,
    Object? answers = freezed,
    Object? images = freezed,
    Object? audios = freezed,
    Object? words = freezed,
  }) {
    return _then(_$_TestQuestionType(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as QuillContent?,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TestQuestionTypeEnum,
      extraData: extraData == freezed
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as QuillContent?,
      testSectionId: testSectionId == freezed
          ? _value.testSectionId
          : testSectionId // ignore: cast_nullable_to_non_nullable
              as int,
      answers: answers == freezed
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<TestQuestionAnswerType>,
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<AppFileAttachmentType>?,
      audios: audios == freezed
          ? _value._audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<AppFileAttachmentType>?,
      words: words == freezed
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TestQuestionType implements _TestQuestionType {
  const _$_TestQuestionType(
      {required this.id,
      this.name,
      this.score,
      required this.type,
      this.extraData,
      this.note,
      required this.testSectionId,
      final List<TestQuestionAnswerType> answers = const [],
      final List<AppFileAttachmentType>? images,
      final List<AppFileAttachmentType>? audios,
      final List<String>? words})
      : _answers = answers,
        _images = images,
        _audios = audios,
        _words = words;

  factory _$_TestQuestionType.fromJson(Map<String, dynamic> json) =>
      _$$_TestQuestionTypeFromJson(json);

  @override
  final String id;
  @override
  final QuillContent? name;
  @override
  final double? score;
  @override
  final TestQuestionTypeEnum type;
  @override
  final String? extraData;
  @override
  final QuillContent? note;
  @override
  final int testSectionId;
  final List<TestQuestionAnswerType> _answers;
  @override
  @JsonKey()
  List<TestQuestionAnswerType> get answers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  final List<AppFileAttachmentType>? _images;
  @override
  List<AppFileAttachmentType>? get images {
    final value = _images;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AppFileAttachmentType>? _audios;
  @override
  List<AppFileAttachmentType>? get audios {
    final value = _audios;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _words;
  @override
  List<String>? get words {
    final value = _words;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TestQuestionType(id: $id, name: $name, score: $score, type: $type, extraData: $extraData, note: $note, testSectionId: $testSectionId, answers: $answers, images: $images, audios: $audios, words: $words)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TestQuestionType &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.extraData, extraData) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality()
                .equals(other.testSectionId, testSectionId) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._audios, _audios) &&
            const DeepCollectionEquality().equals(other._words, _words));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(extraData),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(testSectionId),
      const DeepCollectionEquality().hash(_answers),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_audios),
      const DeepCollectionEquality().hash(_words));

  @JsonKey(ignore: true)
  @override
  _$$_TestQuestionTypeCopyWith<_$_TestQuestionType> get copyWith =>
      __$$_TestQuestionTypeCopyWithImpl<_$_TestQuestionType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TestQuestionTypeToJson(
      this,
    );
  }
}

abstract class _TestQuestionType implements TestQuestionType {
  const factory _TestQuestionType(
      {required final String id,
      final QuillContent? name,
      final double? score,
      required final TestQuestionTypeEnum type,
      final String? extraData,
      final QuillContent? note,
      required final int testSectionId,
      final List<TestQuestionAnswerType> answers,
      final List<AppFileAttachmentType>? images,
      final List<AppFileAttachmentType>? audios,
      final List<String>? words}) = _$_TestQuestionType;

  factory _TestQuestionType.fromJson(Map<String, dynamic> json) =
      _$_TestQuestionType.fromJson;

  @override
  String get id;
  @override
  QuillContent? get name;
  @override
  double? get score;
  @override
  TestQuestionTypeEnum get type;
  @override
  String? get extraData;
  @override
  QuillContent? get note;
  @override
  int get testSectionId;
  @override
  List<TestQuestionAnswerType> get answers;
  @override
  List<AppFileAttachmentType>? get images;
  @override
  List<AppFileAttachmentType>? get audios;
  @override
  List<String>? get words;
  @override
  @JsonKey(ignore: true)
  _$$_TestQuestionTypeCopyWith<_$_TestQuestionType> get copyWith =>
      throw _privateConstructorUsedError;
}

TestQuestionAnswerType _$TestQuestionAnswerTypeFromJson(
    Map<String, dynamic> json) {
  return _TestQuestionAnswerType.fromJson(json);
}

/// @nodoc
mixin _$TestQuestionAnswerType {
  String get id => throw _privateConstructorUsedError;
  QuillContent? get hint => throw _privateConstructorUsedError;
  QuillContent? get content => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;
  QuillContent? get detail => throw _privateConstructorUsedError;
  List<AppFileAttachmentType>? get images => throw _privateConstructorUsedError;
  List<AppFileAttachmentType>? get audios => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestQuestionAnswerTypeCopyWith<TestQuestionAnswerType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestQuestionAnswerTypeCopyWith<$Res> {
  factory $TestQuestionAnswerTypeCopyWith(TestQuestionAnswerType value,
          $Res Function(TestQuestionAnswerType) then) =
      _$TestQuestionAnswerTypeCopyWithImpl<$Res>;
  $Res call(
      {String id,
      QuillContent? hint,
      QuillContent? content,
      bool isCorrect,
      QuillContent? detail,
      List<AppFileAttachmentType>? images,
      List<AppFileAttachmentType>? audios});

  $QuillContentCopyWith<$Res>? get hint;
  $QuillContentCopyWith<$Res>? get content;
  $QuillContentCopyWith<$Res>? get detail;
}

/// @nodoc
class _$TestQuestionAnswerTypeCopyWithImpl<$Res>
    implements $TestQuestionAnswerTypeCopyWith<$Res> {
  _$TestQuestionAnswerTypeCopyWithImpl(this._value, this._then);

  final TestQuestionAnswerType _value;
  // ignore: unused_field
  final $Res Function(TestQuestionAnswerType) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? hint = freezed,
    Object? content = freezed,
    Object? isCorrect = freezed,
    Object? detail = freezed,
    Object? images = freezed,
    Object? audios = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hint: hint == freezed
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as QuillContent?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as QuillContent?,
      isCorrect: isCorrect == freezed
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      detail: detail == freezed
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as QuillContent?,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<AppFileAttachmentType>?,
      audios: audios == freezed
          ? _value.audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<AppFileAttachmentType>?,
    ));
  }

  @override
  $QuillContentCopyWith<$Res>? get hint {
    if (_value.hint == null) {
      return null;
    }

    return $QuillContentCopyWith<$Res>(_value.hint!, (value) {
      return _then(_value.copyWith(hint: value));
    });
  }

  @override
  $QuillContentCopyWith<$Res>? get content {
    if (_value.content == null) {
      return null;
    }

    return $QuillContentCopyWith<$Res>(_value.content!, (value) {
      return _then(_value.copyWith(content: value));
    });
  }

  @override
  $QuillContentCopyWith<$Res>? get detail {
    if (_value.detail == null) {
      return null;
    }

    return $QuillContentCopyWith<$Res>(_value.detail!, (value) {
      return _then(_value.copyWith(detail: value));
    });
  }
}

/// @nodoc
abstract class _$$_TestQuestionAnswerTypeCopyWith<$Res>
    implements $TestQuestionAnswerTypeCopyWith<$Res> {
  factory _$$_TestQuestionAnswerTypeCopyWith(_$_TestQuestionAnswerType value,
          $Res Function(_$_TestQuestionAnswerType) then) =
      __$$_TestQuestionAnswerTypeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      QuillContent? hint,
      QuillContent? content,
      bool isCorrect,
      QuillContent? detail,
      List<AppFileAttachmentType>? images,
      List<AppFileAttachmentType>? audios});

  @override
  $QuillContentCopyWith<$Res>? get hint;
  @override
  $QuillContentCopyWith<$Res>? get content;
  @override
  $QuillContentCopyWith<$Res>? get detail;
}

/// @nodoc
class __$$_TestQuestionAnswerTypeCopyWithImpl<$Res>
    extends _$TestQuestionAnswerTypeCopyWithImpl<$Res>
    implements _$$_TestQuestionAnswerTypeCopyWith<$Res> {
  __$$_TestQuestionAnswerTypeCopyWithImpl(_$_TestQuestionAnswerType _value,
      $Res Function(_$_TestQuestionAnswerType) _then)
      : super(_value, (v) => _then(v as _$_TestQuestionAnswerType));

  @override
  _$_TestQuestionAnswerType get _value =>
      super._value as _$_TestQuestionAnswerType;

  @override
  $Res call({
    Object? id = freezed,
    Object? hint = freezed,
    Object? content = freezed,
    Object? isCorrect = freezed,
    Object? detail = freezed,
    Object? images = freezed,
    Object? audios = freezed,
  }) {
    return _then(_$_TestQuestionAnswerType(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hint: hint == freezed
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as QuillContent?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as QuillContent?,
      isCorrect: isCorrect == freezed
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      detail: detail == freezed
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as QuillContent?,
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<AppFileAttachmentType>?,
      audios: audios == freezed
          ? _value._audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<AppFileAttachmentType>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TestQuestionAnswerType implements _TestQuestionAnswerType {
  const _$_TestQuestionAnswerType(
      {required this.id,
      this.hint,
      this.content,
      this.isCorrect = false,
      this.detail,
      final List<AppFileAttachmentType>? images,
      final List<AppFileAttachmentType>? audios})
      : _images = images,
        _audios = audios;

  factory _$_TestQuestionAnswerType.fromJson(Map<String, dynamic> json) =>
      _$$_TestQuestionAnswerTypeFromJson(json);

  @override
  final String id;
  @override
  final QuillContent? hint;
  @override
  final QuillContent? content;
  @override
  @JsonKey()
  final bool isCorrect;
  @override
  final QuillContent? detail;
  final List<AppFileAttachmentType>? _images;
  @override
  List<AppFileAttachmentType>? get images {
    final value = _images;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AppFileAttachmentType>? _audios;
  @override
  List<AppFileAttachmentType>? get audios {
    final value = _audios;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TestQuestionAnswerType(id: $id, hint: $hint, content: $content, isCorrect: $isCorrect, detail: $detail, images: $images, audios: $audios)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TestQuestionAnswerType &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.hint, hint) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.isCorrect, isCorrect) &&
            const DeepCollectionEquality().equals(other.detail, detail) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._audios, _audios));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(hint),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(isCorrect),
      const DeepCollectionEquality().hash(detail),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_audios));

  @JsonKey(ignore: true)
  @override
  _$$_TestQuestionAnswerTypeCopyWith<_$_TestQuestionAnswerType> get copyWith =>
      __$$_TestQuestionAnswerTypeCopyWithImpl<_$_TestQuestionAnswerType>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TestQuestionAnswerTypeToJson(
      this,
    );
  }
}

abstract class _TestQuestionAnswerType implements TestQuestionAnswerType {
  const factory _TestQuestionAnswerType(
      {required final String id,
      final QuillContent? hint,
      final QuillContent? content,
      final bool isCorrect,
      final QuillContent? detail,
      final List<AppFileAttachmentType>? images,
      final List<AppFileAttachmentType>? audios}) = _$_TestQuestionAnswerType;

  factory _TestQuestionAnswerType.fromJson(Map<String, dynamic> json) =
      _$_TestQuestionAnswerType.fromJson;

  @override
  String get id;
  @override
  QuillContent? get hint;
  @override
  QuillContent? get content;
  @override
  bool get isCorrect;
  @override
  QuillContent? get detail;
  @override
  List<AppFileAttachmentType>? get images;
  @override
  List<AppFileAttachmentType>? get audios;
  @override
  @JsonKey(ignore: true)
  _$$_TestQuestionAnswerTypeCopyWith<_$_TestQuestionAnswerType> get copyWith =>
      throw _privateConstructorUsedError;
}

TestStatsType _$TestStatsTypeFromJson(Map<String, dynamic> json) {
  return _TestStatsType.fromJson(json);
}

/// @nodoc
mixin _$TestStatsType {
  int get totalChallengeUsed => throw _privateConstructorUsedError;
  int get totalComment => throw _privateConstructorUsedError;
  int get totalFeedback => throw _privateConstructorUsedError;
  int get totalRating => throw _privateConstructorUsedError;
  int get totalUser => throw _privateConstructorUsedError;
  int get totalUserRating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestStatsTypeCopyWith<TestStatsType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestStatsTypeCopyWith<$Res> {
  factory $TestStatsTypeCopyWith(
          TestStatsType value, $Res Function(TestStatsType) then) =
      _$TestStatsTypeCopyWithImpl<$Res>;
  $Res call(
      {int totalChallengeUsed,
      int totalComment,
      int totalFeedback,
      int totalRating,
      int totalUser,
      int totalUserRating});
}

/// @nodoc
class _$TestStatsTypeCopyWithImpl<$Res>
    implements $TestStatsTypeCopyWith<$Res> {
  _$TestStatsTypeCopyWithImpl(this._value, this._then);

  final TestStatsType _value;
  // ignore: unused_field
  final $Res Function(TestStatsType) _then;

  @override
  $Res call({
    Object? totalChallengeUsed = freezed,
    Object? totalComment = freezed,
    Object? totalFeedback = freezed,
    Object? totalRating = freezed,
    Object? totalUser = freezed,
    Object? totalUserRating = freezed,
  }) {
    return _then(_value.copyWith(
      totalChallengeUsed: totalChallengeUsed == freezed
          ? _value.totalChallengeUsed
          : totalChallengeUsed // ignore: cast_nullable_to_non_nullable
              as int,
      totalComment: totalComment == freezed
          ? _value.totalComment
          : totalComment // ignore: cast_nullable_to_non_nullable
              as int,
      totalFeedback: totalFeedback == freezed
          ? _value.totalFeedback
          : totalFeedback // ignore: cast_nullable_to_non_nullable
              as int,
      totalRating: totalRating == freezed
          ? _value.totalRating
          : totalRating // ignore: cast_nullable_to_non_nullable
              as int,
      totalUser: totalUser == freezed
          ? _value.totalUser
          : totalUser // ignore: cast_nullable_to_non_nullable
              as int,
      totalUserRating: totalUserRating == freezed
          ? _value.totalUserRating
          : totalUserRating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_TestStatsTypeCopyWith<$Res>
    implements $TestStatsTypeCopyWith<$Res> {
  factory _$$_TestStatsTypeCopyWith(
          _$_TestStatsType value, $Res Function(_$_TestStatsType) then) =
      __$$_TestStatsTypeCopyWithImpl<$Res>;
  @override
  $Res call(
      {int totalChallengeUsed,
      int totalComment,
      int totalFeedback,
      int totalRating,
      int totalUser,
      int totalUserRating});
}

/// @nodoc
class __$$_TestStatsTypeCopyWithImpl<$Res>
    extends _$TestStatsTypeCopyWithImpl<$Res>
    implements _$$_TestStatsTypeCopyWith<$Res> {
  __$$_TestStatsTypeCopyWithImpl(
      _$_TestStatsType _value, $Res Function(_$_TestStatsType) _then)
      : super(_value, (v) => _then(v as _$_TestStatsType));

  @override
  _$_TestStatsType get _value => super._value as _$_TestStatsType;

  @override
  $Res call({
    Object? totalChallengeUsed = freezed,
    Object? totalComment = freezed,
    Object? totalFeedback = freezed,
    Object? totalRating = freezed,
    Object? totalUser = freezed,
    Object? totalUserRating = freezed,
  }) {
    return _then(_$_TestStatsType(
      totalChallengeUsed: totalChallengeUsed == freezed
          ? _value.totalChallengeUsed
          : totalChallengeUsed // ignore: cast_nullable_to_non_nullable
              as int,
      totalComment: totalComment == freezed
          ? _value.totalComment
          : totalComment // ignore: cast_nullable_to_non_nullable
              as int,
      totalFeedback: totalFeedback == freezed
          ? _value.totalFeedback
          : totalFeedback // ignore: cast_nullable_to_non_nullable
              as int,
      totalRating: totalRating == freezed
          ? _value.totalRating
          : totalRating // ignore: cast_nullable_to_non_nullable
              as int,
      totalUser: totalUser == freezed
          ? _value.totalUser
          : totalUser // ignore: cast_nullable_to_non_nullable
              as int,
      totalUserRating: totalUserRating == freezed
          ? _value.totalUserRating
          : totalUserRating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TestStatsType implements _TestStatsType {
  const _$_TestStatsType(
      {this.totalChallengeUsed = 0,
      this.totalComment = 0,
      this.totalFeedback = 0,
      this.totalRating = 0,
      this.totalUser = 0,
      this.totalUserRating = 0});

  factory _$_TestStatsType.fromJson(Map<String, dynamic> json) =>
      _$$_TestStatsTypeFromJson(json);

  @override
  @JsonKey()
  final int totalChallengeUsed;
  @override
  @JsonKey()
  final int totalComment;
  @override
  @JsonKey()
  final int totalFeedback;
  @override
  @JsonKey()
  final int totalRating;
  @override
  @JsonKey()
  final int totalUser;
  @override
  @JsonKey()
  final int totalUserRating;

  @override
  String toString() {
    return 'TestStatsType(totalChallengeUsed: $totalChallengeUsed, totalComment: $totalComment, totalFeedback: $totalFeedback, totalRating: $totalRating, totalUser: $totalUser, totalUserRating: $totalUserRating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TestStatsType &&
            const DeepCollectionEquality()
                .equals(other.totalChallengeUsed, totalChallengeUsed) &&
            const DeepCollectionEquality()
                .equals(other.totalComment, totalComment) &&
            const DeepCollectionEquality()
                .equals(other.totalFeedback, totalFeedback) &&
            const DeepCollectionEquality()
                .equals(other.totalRating, totalRating) &&
            const DeepCollectionEquality().equals(other.totalUser, totalUser) &&
            const DeepCollectionEquality()
                .equals(other.totalUserRating, totalUserRating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalChallengeUsed),
      const DeepCollectionEquality().hash(totalComment),
      const DeepCollectionEquality().hash(totalFeedback),
      const DeepCollectionEquality().hash(totalRating),
      const DeepCollectionEquality().hash(totalUser),
      const DeepCollectionEquality().hash(totalUserRating));

  @JsonKey(ignore: true)
  @override
  _$$_TestStatsTypeCopyWith<_$_TestStatsType> get copyWith =>
      __$$_TestStatsTypeCopyWithImpl<_$_TestStatsType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TestStatsTypeToJson(
      this,
    );
  }
}

abstract class _TestStatsType implements TestStatsType {
  const factory _TestStatsType(
      {final int totalChallengeUsed,
      final int totalComment,
      final int totalFeedback,
      final int totalRating,
      final int totalUser,
      final int totalUserRating}) = _$_TestStatsType;

  factory _TestStatsType.fromJson(Map<String, dynamic> json) =
      _$_TestStatsType.fromJson;

  @override
  int get totalChallengeUsed;
  @override
  int get totalComment;
  @override
  int get totalFeedback;
  @override
  int get totalRating;
  @override
  int get totalUser;
  @override
  int get totalUserRating;
  @override
  @JsonKey(ignore: true)
  _$$_TestStatsTypeCopyWith<_$_TestStatsType> get copyWith =>
      throw _privateConstructorUsedError;
}
