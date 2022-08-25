// import 'package:flutter/material.dart';

// import '../../../../injection.dart';
// import '../../../common/enums/app_enum.dart';
// import '../../../common/models/arguments/arguments.dart';
// import '../../../common/models/common_filter_list_item/common_filter_list_item.dart';
// import '../../../common/repositories/common_use_repository.dart';
// import '../../../widgets/select_list/popup_select_list_widget.dart';
// import '../action_sheet_service/action_sheet_service.dart';

// class CommonListSelectService1 {
//   static Future<List<CommonFilterListItem>?> showUserFollowList(
//     BuildContext context, {
//     String title = "Danh sách kết nối",
//     String buttonTitle = "Chọn",
//     int limit = 10,
//     bool multipleSelect = false,
//     List<UserFollowStatusEnum> status = const [UserFollowStatusEnum.Accepted],
//     List<int> inGroupIds = const [],
//     List<int> notInGroupIds = const [],
//     List<UserRoleEnum> userRoles = const [],
//     List<int> finishedTestIds = const [],
//     List<int> notFinishedTestIds = const [],
//     List<int> excludeInvitedForChallengeIds = const [],
//   }) async {
//     final CommonUseRepository _repository = getIt<CommonUseRepository>();
//     return await ActionSheetService.showBottomSheet<List<CommonFilterListItem>>(
//       context,
//       backgroundColor: Colors.transparent,
//       builder: (ctx) => PopupSelectListWidget(
//         title: title,
//         selectButtonTitle: buttonTitle,
//         isMultipleSelect: multipleSelect,
//         onDataLoad: (page, keyword) async {
//           return await _repository.getFollowings(
//             start: page,
//             limit: limit,
//             args: UserFollowFilterArgument(
//               keyword: keyword,
//               status: status,
//               inGroupIds: inGroupIds,
//               notInGroupIds: notInGroupIds,
//               userRoles: userRoles,
//               finishedTestIds: finishedTestIds,
//               notFinishedTestIds: notFinishedTestIds,
//               excludeInvitedForChallengeIds: excludeInvitedForChallengeIds,
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // static Future<List<CommonFilterListItem>?> showGroupList(
//   //   BuildContext context, {
//   //   String title = "Danh sách nhóm",
//   //   String buttonTitle = "Chọn",
//   //   int limit = 10,
//   //   bool multipleSelect = false,
//   // }) async {
//   //   final CommonUseRepository _repository = getIt<CommonUseRepository>();
//   //   return await ActionSheetService.showBottomSheet<List<CommonFilterListItem>>(
//   //     context,
//   //     backgroundColor: Colors.transparent,
//   //     builder: (ctx) => PopupSelectListWidget(
//   //       title: title,
//   //       selectButtonTitle: buttonTitle,
//   //       isMultipleSelect: multipleSelect,
//   //       onDataLoad: (page, keyword) async {
//   //         return await _repository.getMyGroups(
//   //           start: page,
//   //           limit: limit,
//   //           args:
//   //               MyGroupFilterArgumentModel.inital().copyWith(keyword: keyword),
//   //         );
//   //       },
//   //     ),
//   //   );
//   // }
// }
