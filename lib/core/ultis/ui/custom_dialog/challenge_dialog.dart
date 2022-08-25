// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:yofun_app/core/config/palette.dart';
// import 'package:yofun_app/core/widgets/controls/app_flat_button_widget.dart';
// import 'package:yofun_app/core/widgets/controls/app_outline_button_widget.dart';

// class ChallengeDialog extends StatelessWidget {
//   final Color? color;
//   final String? okText;
//   final String? cancelText;
//   final VoidCallback? onClickOk;
//   final VoidCallback? onClickCancel;
//   final String? title;
//   final String? subtitle;
//   final String? iconPath;
//   ChallengeDialog({
//     this.color,
//     this.okText = "Đồng ý",
//     this.cancelText = "Hủy bỏ",
//     this.iconPath = '',
//     this.title,
//     this.subtitle,
//     this.onClickOk,
//     this.onClickCancel,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       insetPadding: EdgeInsets.only(left: 16, right: 16),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           // Positioned(
//           //   top: 0,
//           //   child: SvgPicture.asset(
//           //     Res.top_dialog,
//           //     width: Get.width - 32,
//           //     color: color,
//           //   ),
//           // ),
//           const SizedBox(
//             height: 16,
//           ),
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 height: (Get.width - 32) / 343 * 133 + 24,
//                 width: Get.width - 32,
//               ),
//               Text(
//                 title ?? "tham gia thách đấu".toUpperCase(),
//                 style: TextStyle(
//                   color: Palette.neutral_800,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 8),
//                 child: Text(
//                   subtitle ??
//                       "Bạn sẽ bị trừ 400 xu cược để bắt đầu. Người chiến thắng sẽ nhận được toàn bộ số xu từ tất cả những người tham gia khi kết thúc",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color(0xFF424242),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: AppOutlineButtonWidget(
//                         title: cancelText ?? "Cancel",
//                         borderColor: color ?? Palette.primaryColor_700,
//                         borderRadius: 16,
//                         textColor: color ?? Palette.primaryColor_700,
//                         onClick: onClickCancel,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 16,
//                     ),
//                     Expanded(
//                       child: AppFlatButtonWidget(
//                         backgroundColor: color ?? Palette.primaryColor_700,
//                         onClick: onClickOk,
//                         borderRadius: 16,
//                         title: okText ?? "OK",
//                         textColor: Colors.white,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//             ],
//           ),
//           // Positioned(
//           //   top: 24,
//           //   child: SvgPicture.asset(iconPath ?? Res.ic_big_battle),
//           // )
//         ],
//       ),
//     );
//   }
// }
