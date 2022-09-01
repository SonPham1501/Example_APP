import 'package:freezed_annotation/freezed_annotation.dart';
import '../test_type/test_type.dart';

part 'test_archived_type.freezed.dart';
part 'test_archived_type.g.dart';

@freezed
class TestArchivedType with _$TestArchivedType {
  const factory TestArchivedType({
    required int id,
    required String title,
    int? testId,
    DateTime? createdAt,
    @Default(0) int totalQuestions,
    String? description,
    @Default(0) int duration,
    @Default(0) double systemRewardPoint,
    @Default([]) List<TestSectionType> sections,
  }) = _TestArchivedType;

  static String get graphQuery => """
    testArchived{
      id,
      testId,
      title,
      totalQuestions,
      duration,
      createdAt,
      grade,
      
      author{
        id,
        role,
        fullName,
        address,
        profilePicture{
          path,
        }
      },
      sections{
        id,
        type,
        extraData,
        words,
        name{
          operations{
            content,
            type,
            attributes{
              bold,
              underline,
              strike,
              italic
            }
          }
        },
        note{
          operations{
            content,
            type,
            attributes{
              bold,
              underline,
              strike,
              italic
            }
          }
        },
        paragraph{
          operations{
            content,
            type,
            attributes{
              bold,
              underline,
              strike,
              italic
            }
          }
        },
        images{
          id,
          contentType,
          path
        },
        audios{
          id,
          contentType,
          path
        },
        questions{
          id,
          name{
            operations{
            	content,
              type,
              attributes{
                bold,
                underline,
                strike,
                italic
              }
            }
          },
          extraData,
          type,
          note{
            operations{
            	content,
              type,
              attributes{
                bold,
                underline,
                strike,
                italic
              }
            }
          },
          testSectionId,
          images{
            id,
            contentType,
            path
          },
          audios{
            id,
            contentType,
            path
          },
          answers{
            id,
            content{
              operations{
                content,
                type,
                attributes{
                  bold,
                  underline,
                  strike,
                  italic
                }
              }
            },
            detail{
              operations{
                content,
                type,
                attributes{
                  bold,
                  underline,
                  strike,
                  italic
                }
              }
            },
            isCorrect,
            hint{
              operations{
                content,
                type,
                attributes{
                  bold,
                  underline,
                  strike,
                  italic
                }
              }
            },
          }
        }
      }
    }
  """;

  factory TestArchivedType.fromJson(Map<String, dynamic> json) =>
      _$TestArchivedTypeFromJson(json);
}
