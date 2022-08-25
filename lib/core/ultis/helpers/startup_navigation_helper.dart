// import 'package:flutter/material.dart';
// import 'package:yofun_app/core/auth/di.dart';
// import 'package:yofun_app/core/common/enums/app_enum.dart';
// import 'package:yofun_app/features/newsfeed/di.dart';
// import 'package:yofun_app/injection.dart';
// import '../../common/services/auth/auth_controller.dart';
// import '../../../features/notification/domain/models/enums/notification_entity_action_type_enum.dart';
// import '../../../routes/app_pages.dart';

// class StartupNavigationHelper {
//   static void navigateOnNotificationAction({
//     BuildContext? context,
//     required Map<String, dynamic> data,
//     required NotificationEntityActionTypeEnum entityActionType,
//   }) {
//     SessionUserModel? currentUser = getIt<AuthController>().currentUser;
//     try {
//       switch (entityActionType) {
//         case NotificationEntityActionTypeEnum.User_Request_Follow:
//           //print(item.dataModel);
//           // currentState?.pushNamed(
//           //   Routes.PROFILE_FOLLOW_REQUEST,
//           //   arguments: _getDataValue(data, "userId"),
//           // );
//           // Get.toNamed(
//           //   Routes.PROFILE_FOLLOW_REQUEST,
//           //   arguments: _getDataValue(data, "userId"),
//           // );
//           navigate(
//             context,
//             Routes.VIEWER_PROFILE,
//             arguments: _getDataValue(data, "userId"),
//           );

//           return;
//         case NotificationEntityActionTypeEnum.User_Accept_Follow:
//           navigate(
//             context,
//             Routes.VIEWER_PROFILE,
//             arguments: _getDataValue(data, "userId"),
//           );
//           return;
//         //timeline post
//         case NotificationEntityActionTypeEnum.Post_TimeLine_Like:
//         case NotificationEntityActionTypeEnum.Post_TimeLine_Share_Notify_Actor:
//         case NotificationEntityActionTypeEnum.Post_TimeLine_Comment:
//         case NotificationEntityActionTypeEnum.Post_TimeLine_Share_To_Follower:
//         case NotificationEntityActionTypeEnum.Post_TimeLine_Teacher_Create:

//         // case NotificationEntityActionTypeEnum.Post_TimeLine_Reply_Comment_Follower: chua lam reply
//         // case NotificationEntityActionTypeEnum.Post_Group_Reply_Comment_To_Actor: chua lam reply
//         //group post
//         case NotificationEntityActionTypeEnum.Post_Group_Comment_To_Actor:
//         case NotificationEntityActionTypeEnum.Post_Group_Comment_To_Commenters:
//         case NotificationEntityActionTypeEnum.Post_Group_Like:
//         case NotificationEntityActionTypeEnum.Post_Group_Create:

//         case NotificationEntityActionTypeEnum.Post_Class_Create:
//         case NotificationEntityActionTypeEnum.Post_Class_Like:
//         case NotificationEntityActionTypeEnum.Post_Class_Comment_To_Actor:
//         case NotificationEntityActionTypeEnum.Post_Class_Comment_To_Commenters:
//           // case NotificationEntityActionTypeEnum.Post_Group_Reply_Comment_To_Member: chua lam reply
//           // case NotificationEntityActionTypeEnum.Post_Group_Reply_Comment_To_Actor: chua lam reply
//           // currentState?.pushNamed(
//           //   Routes.POST_DETAIL,
//           //   arguments: {
//           //     "postId": _getDataValue(data, "postId"),
//           //   },
//           // );
//           // print(data);
//           // print(_getDataValue(data, "postId"));

//           navigate(
//             context,
//             Routes.POST_COMMENT,
//             arguments: {
//               //  post: null,
//               "postId": _getDataValue(data, "postId"),
//               "sourceType": NewfeedSourceTypeEnum.Detail,
//             },
//           );
//           break;

//         case NotificationEntityActionTypeEnum.Post_TimeLine_Share_To_Follower:
//           //các params khác
//           //postId => bài gốc
//           //targetType => loại bài viết (dạng số) 2=nhóm,3=lớp
//           //targetId => id của nhóm/lớp
//           navigate(
//             context,
//             Routes.POST_DETAIL,
//             arguments: {
//               //  post: null,
//               "postId": _getDataValue(data, "sharePostId"),
//             },
//           );

//           return;
//         case NotificationEntityActionTypeEnum.Group_Request_Join:
//           // currentState?.pushNamed(
//           //   Routes.GROUP_APPROVING,
//           //   arguments: _getDataValue(data, "groupId"),
//           // );
//           return;
//         case NotificationEntityActionTypeEnum.Group_Add_Member:
//         case NotificationEntityActionTypeEnum.Group_Add_Admin:
//         case NotificationEntityActionTypeEnum.Group_Invite_Member:
//           // currentState?.pushNamed(
//           //   Routes.GROUP_DETAIL,
//           //   arguments: _getDataValue(data, "groupId"),
//           // );
//           break;
//         case NotificationEntityActionTypeEnum.TestChallenge_Ended:
//           // if (data['status'] != null) {
//           //   final _status =
//           //       TestChallengeStatusEnum.Cancelled.fromString(data['status']);
//           //   if (_status == TestChallengeStatusEnum.Ended) {
//           //     currentState?.pushNamed(
//           //       Routes.TEST_CHALLENGES_FINISH_DETAIL,
//           //       arguments: _getDataValue(data, "challengeId"),
//           //     );
//           //   } else if (_status == TestChallengeStatusEnum.Cancelled) {
//           //     DialogService.showTextDialog(currentState!.context,
//           //         title: 'Thách đấu không hợp lệ',
//           //         content:
//           //             "Có vẻ như thách đấu này đã không đủ số người tham gia (từ 2 người trở lên)");
//           //   }
//           // }

//           break;
//         case NotificationEntityActionTypeEnum.TestChallenge_Accepted:
//         case NotificationEntityActionTypeEnum.TestChallenge_Share:
//         case NotificationEntityActionTypeEnum.Test_Publish_To_Followers:
//         case NotificationEntityActionTypeEnum.Test_Share_Result_Group:
//         case NotificationEntityActionTypeEnum.Test_Share_Result_TimeLine:
//         case NotificationEntityActionTypeEnum.Test_Share_To_Actor:
//         case NotificationEntityActionTypeEnum.Test_Share_To_Followers:
//         case NotificationEntityActionTypeEnum.Test_Thank_To_Actor:
//         case NotificationEntityActionTypeEnum.Test_Top_Rank:
//         case NotificationEntityActionTypeEnum.Test_Comment:
//           // Navigator.of(context).pushNamed(
//           //   Routes.TEST_DETAIIL,
//           //   arguments: {
//           //     //  post: null,
//           //     "testId": _getDataValue(data, "testId"),
//           //   },
//           // );
//           navigate(
//             context,
//             Routes.TEST_DETAIIL,
//             arguments: {
//               //  post: null,
//               "testId": _getDataValue(data, "testId"),
//             },
//           );
//           // currentState?.pushNamed(
//           //   Routes.TEST_DETAIIL,
//           //   arguments: _getDataValue(data, "challengeId"),
//           // );
//           break;

//         case NotificationEntityActionTypeEnum.ClassTestAssignment_Assign:
//           if (currentUser != null && currentUser.role == UserRoleEnum.Teacher) {
//             // DialogService.showTextDialog(currentState!.context,
//             //     title: 'Giáo viên không thể tham gia thách đấu');
//           } else {
//             //print(data);
//             navigate(
//               context,
//               Routes.CLASS_ASSIGNMENT_DETAILS,
//               arguments: _getDataValue(data, "assignmentId"),
//             );
//           }
//           return;
//         case NotificationEntityActionTypeEnum.ClassTestAssignment_Finished:
//         case NotificationEntityActionTypeEnum
//             .ClassTestAssignment_All_Members_Finished:
//           navigate(
//             context,
//             Routes.CLASS_ASSIGNMENT_DETAILS,
//             arguments: _getDataValue(data, "assignmentId"),
//           );
//           return;
//         case NotificationEntityActionTypeEnum.TestChallenge_Invite_User:
//         case NotificationEntityActionTypeEnum.TestChallenge_Invite_Group:
//           // if (currentUser != null && currentUser.role == UserRoleEnum.Teacher) {
//           //   DialogService.showTextDialog(currentState!.context,
//           //       title: 'Giáo viên không thể tham gia thách đấu');
//           // } else {
//           //   Get.toNamed(Routes.TEST_CHALLENGE_INFO,
//           //       arguments: _getDataValue(data, "challengeInvitationId"));
//           //   // currentState?.pushNamed(
//           //   //   Routes.TEST_CHALLENGE_INFO,
//           //   //   arguments: _getDataValue(data, "challengeInvitationId"),
//           //   // );
//           // }
//           return;

//         default:
//           return;
//       }
//     } on Exception {
//       return;
//     }
//   }

//   static Future<void> navigateOnNotificationLunched({
//     required Map<String, dynamic> data,
//   }) async {
//     try {
//       NotificationEntityActionTypeEnum entityActionId =
//           getNotificationEntityActionTypeEnumFromString(data["entityActionId"]);

//       await Future.delayed(Duration(seconds: 1));
//       navigateOnNotificationAction(
//         data: data,
//         entityActionType: entityActionId,
//       );
//     } catch (e) {
//       print(e);
//     }
//   }

//   static void navigate(
//     BuildContext? context,
//     String routeName, {
//     Object? arguments,
//     bool popFirst = false,
//   }) {
//     context = context ?? appRouter.context;
//     if (context == null) return;
//     if (popFirst) Navigator.of(context).pop();
//     // if (popFirst) {
//     //   Navigator.of(context).popAndPushNamed(routeName, arguments: arguments);
//     // } else {
//     //   Navigator.of(context, rootNavigator: true)
//     //       .pushNamed(routeName, arguments: arguments);
//     // }
//     appRouter.pushNamed(routeName, arguments: arguments);
//   }
// }

// int _getDataValue(Map<String, dynamic> data, String key) {
//   final int? _id = data.containsKey(key) ? int.tryParse(data[key]) : null;
//   if (_id == null) throw Exception();
//   return _id;
// }
