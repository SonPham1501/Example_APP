import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_app/core/common/models/app_file_attachment/app_file_attachment.dart';

import '../../../../../../core/common/models/api_response/api_list_response_wrapper.dart';
import '../../../enums/test_question_type_enum.dart';
import '../quill_content/quill_content.dart';
import '../test_user_type/test_user_type.dart';

part 'test_type.freezed.dart';
part 'test_type.g.dart';

@freezed
class TestType with _$TestType {
  factory TestType({
    required int id,
    required String title,
    DateTime? createdAt,
    @Default(0) int totalQuestions,
    @Default(0) int duration,
    @Default(const ApiListResponseWrapper<TestUserType>())
    @JsonKey(name: 'rankings', fromJson: _getTestUsersFromJson)
        ApiListResponseWrapper<TestUserType> rankings,
    @Default(const ApiListResponseWrapper<TestUserType>())
    @JsonKey(name: 'testHistories', fromJson: _getTestUsersFromJson)
        ApiListResponseWrapper<TestUserType> testHistories,
    TestStatsType? stats,
    int? categoryId,
    int? testVersion,
    @Default([]) List<TestSectionType> sections,
  }) = _TestType;

  factory TestType.fromJson(Map<String, dynamic> json) =>
      _$TestTypeFromJson(json);

  static String graphQuery(String key) {
    switch (key) {
      case 'stats':
        return TestStatsType.graphQuery;

      case 'rankings':
        {
          return """
            rankings(start:0,limit:3){
              total,
              items{
                userId,
                testId,
                index,
                totalRightAnswer,
                durationInSeconds,
                rankingPoint,
                top,
                user{
                  id,
                  role,
                  fullName,
                  profilePicture{
                    path
                  }
                }
                testArchived{
                  author{
                    id,
                    role,
                    fullName,
                    address,
                    profilePicture{
                      name,
                      path,
                    }
                  },
                  createdAt,
                  description,
                  duration,
                  grade,
                  id,
                  systemRewardPoint,
                  testId,
                  title,
                  totalQuestions,
                }
              }
            },
          """;
        }
      case 'comments':
        {
          return """
           comments(start: 0, limit: 3){
              total,
              items{
                id,
                text,
                createdAt,
                author{
                  id,
                  role,
                  fullName,
                  profilePicture{
                    name,
                    path,
                  },
                }
              }
            },
          """;
        }
      case "testHistories":
        {
          return """
          testHistories(start:0, limit: 1){
            total,
            items{
              testArchivedId,
              testId,
              userId,
              status,
              durationInSeconds,
              totalRewardCoin,
              finishedAt,
              startAt,
              totalScore,
              totalRightAnswer,
              top,
              index
              }
            }
          """;
        }
      default:
        return "";
    }
  }

  // factory TestType.fromClassTest(ClassTestType item) {
  //   return TestType(
  //     id: item.id,
  //     title: item.title ?? "",
  //     createdAt: item.createdAt ?? DateTime.now(),
  //     author: UserCardModel(
  //       id: item.owner?.id ?? 0,
  //       fullName: item.owner?.fullName ?? "",
  //     ),
  //     totalQuestions: item.testArchived?.totalQuestions ?? 0,
  //     grade: item.testArchived?.grade,
  //     duration: item.duration,
  //     stats: TestStatsType(
  //       totalUser: item.totalUserFinished,
  //     ),
  //   );
  // }

  // factory TestType.fromTestArchived(TestArchivedType model) {
  //   return TestType(
  //     id: model.testId!,
  //     title: model.title,
  //     systemRewardPoint: DataConverter.doubleToInt(model.systemRewardPoint),
  //     totalQuestions: model.totalQuestions,
  //     grade: model.grade,
  //     stats: TestStatsType(),
  //     createdAt: model.createdAt ?? DateTime.now(),
  //     duration: model.duration,
  //     author: UserCardModel(
  //       id: model.author!.id,
  //       fullName: model.author!.fullName,
  //       profilePicture: model.author!.profilePicture,
  //     ),
  //   );
  // }

  // static String buildSubjectWithGradeString(
  //     String? subjectName, GradeEnum? grade) {
  //   if (subjectName!.isNotEmpty) {
  //     String gradeStr = grade == null ? "" : " ${grade.index + 1}";
  //     switch (subjectName.toLowerCase()) {
  //       case 'tiếng anh':
  //         return 'T.Anh$gradeStr';
  //       default:
  //         return '$subjectName$gradeStr';
  //     }
  //   }
  //   return "";
  // }
}

ApiListResponseWrapper<TestUserType> _getTestUsersFromJson(
    Map<String, dynamic>? json) {
  return ApiListResponseWrapper.fromJson(
    json,
    (items) =>
        items
            ?.map((e) => TestUserType.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

// ApiListResponseWrapper<PostCommentType> _getCommentsFromJson(
//     Map<String, dynamic>? json) {
//   return ApiListResponseWrapper.fromJson(
//     json,
//     (items) =>
//         items
//             ?.map((e) => PostCommentType.fromJson(e as Map<String, dynamic>))
//             .toList() ??
//         [],
//   );
// }

@freezed
class TestSectionType with _$TestSectionType {
  const factory TestSectionType({
    required int id,
    required QuillContent name,
    TestQuestionTypeEnum? type,
    String? extraData,
    QuillContent? note,
    QuillContent? paragraph,
    @Default(0) double totalScore,
    @Default([]) List<TestQuestionType> questions,
    List<AppFileAttachmentType>? images,
    List<AppFileAttachmentType>? audios,
    List<String>? words,
  }) = _TestSectionType;

  factory TestSectionType.fromJson(Map<String, dynamic> json) =>
      _$TestSectionTypeFromJson(json);
}

@freezed
class TestQuestionType with _$TestQuestionType {
  const factory TestQuestionType({
    required String id,
    QuillContent? name,
    double? score,
    required TestQuestionTypeEnum type,
    String? extraData,
    QuillContent? note,
    required int testSectionId,
    @Default([]) List<TestQuestionAnswerType> answers,
    List<AppFileAttachmentType>? images,
    List<AppFileAttachmentType>? audios,
    List<String>? words,
  }) = _TestQuestionType;

  factory TestQuestionType.fromJson(Map<String, dynamic> json) =>
      _$TestQuestionTypeFromJson(json);
}

@freezed
class TestQuestionAnswerType with _$TestQuestionAnswerType {
  const factory TestQuestionAnswerType({
    required String id,
    QuillContent? hint,
    QuillContent? content,
    @Default(false) bool isCorrect,
    QuillContent? detail,
    List<AppFileAttachmentType>? images,
    List<AppFileAttachmentType>? audios,
  }) = _TestQuestionAnswerType;

  factory TestQuestionAnswerType.fromJson(Map<String, dynamic> json) =>
      _$TestQuestionAnswerTypeFromJson(json);
}

@freezed
class TestStatsType with _$TestStatsType {
  const factory TestStatsType({
    @Default(0) int totalChallengeUsed,
    @Default(0) int totalComment,
    @Default(0) int totalFeedback,
    @Default(0) int totalRating,
    @Default(0) int totalUser,
    @Default(0) int totalUserRating,
  }) = _TestStatsType;

  factory TestStatsType.fromJson(Map<String, dynamic> json) =>
      _$TestStatsTypeFromJson(json);

  static String get graphKey => r"stats";
  static String get graphQuery => """
      stats{
          totalChallengeUsed,
          totalComment,
          totalFeedback,
          totalRating,
          totalUserRating,
          totalUser
        }
    """;
}


// @freezed
// class TestAttachment with _$TestAttachment {
//   const factory TestAttachment({
//     required String id,
//     required String path,
//     required String contentType,
//   }) = _TestAttachment;

//   factory TestAttachment.fromJson(Map<String, dynamic> json) =>
//       _$TestAttachmentFromJson(json);
// }
