// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:yofun_app/core/config/app_text_style.dart';
// import 'package:yofun_app/core/config/palette.dart';
// import 'package:yofun_app/core/ultis/helpers/data_converter.dart';
// import 'package:yofun_app/core/widgets/widgets.dart';
// import 'package:yofun_app/res.dart';

// class TestResultWrapStatsWidget extends StatelessWidget {
//   //final TestSubmitResult data;
//   final bool inline;
//   final int durationInSeconds;
//   final int index;
//   final int totalUsers;
//   final int top;
//   final int totalRight;
//   final int totalQuestions;
//   final double fontSize;
//   final double iconSize;
//   final WrapAlignment alignment;

//   const TestResultWrapStatsWidget({
//     this.inline = false,
//     required this.durationInSeconds,
//     required this.index,
//     required this.totalUsers,
//     required this.top,
//     required this.totalRight,
//     required this.totalQuestions,
//     this.fontSize = 14,
//     this.iconSize = 24,
//     this.alignment = WrapAlignment.center,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return inline
//         ? Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             // spacing: 16,
//             // runSpacing: 16,
//             // runAlignment: WrapAlignment.center,
//             // alignment: alignment,
//             children: [
//               _buildStat(
//                 label: 'Thời gian',
//                 color: AppColors.primary10,
//                 value: DataConverter.durationToString(
//                   Duration(
//                     seconds: durationInSeconds,
//                   ),
//                   true,
//                 ),
//                 icon: Icon(
//                   CupertinoIcons.clock_fill,
//                   color: AppColors.primary,
//                   size: iconSize,
//                 ),
//               ),
//               _buildStat(
//                 color: AppColors.green_100,
//                 label: 'Câu đúng',
//                 value: totalRight.toString(),
//                 // widgetValue: RichText(
//                 //   text: TextSpan(
//                 //     style: AppTextStyle.w700(
//                 //       color: Colors.black,
//                 //       fontSize: fontSize,
//                 //     ),
//                 //     text: totalRight.toString(),
//                 //     children: [
//                 //       TextSpan(
//                 //         text: '/',
//                 //         style: TextStyle(
//                 //           color: Palette.subTextColor,
//                 //         ),
//                 //       ),
//                 //       TextSpan(
//                 //         text: totalQuestions.toString(),
//                 //         style: TextStyle(
//                 //           color: Palette.subTextColor,
//                 //         ),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),

//                 icon: Icon(
//                   Icons.check_circle,
//                   color: AppColors.green,
//                   size: iconSize,
//                 ),
//               ),
//               _buildStat(
//                 color: AppColors.orange_100,
//                 label: 'Xu nhận được',
//                 value: index == 1 ? '300' : '0',
//                 icon: svgIcon(
//                   Res.ic_coin,
//                   width: iconSize,
//                 ),
//               ),
//               _buildStat(
//                 color: AppColors.red_100,
//                 label: 'Xếp hạng',
//                 value: '$top',
//                 // widgetValue: RichText(
//                 //   text: TextSpan(
//                 //     style: AppTextStyle.w700(
//                 //       color: Colors.black,
//                 //       fontSize: fontSize,
//                 //     ),
//                 //     text: top.toString(),
//                 //     children: [
//                 //       TextSpan(
//                 //         text: '/',
//                 //         style: TextStyle(
//                 //           color: Palette.subTextColor,
//                 //         ),
//                 //       ),
//                 //       TextSpan(
//                 //         text: totalUsers.toString(),
//                 //         style: TextStyle(
//                 //           color: Palette.subTextColor,
//                 //         ),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),

//                 icon: svgIcon(
//                   'assets/icons/common/ic_award.svg',
//                   width: iconSize,
//                 ),
//               )
//             ],
//           )
//         : _TestResultStatsWidget(
//             top: top,
//             durationInSeconds: durationInSeconds,
//             index: index,
//             totalQuestions: totalQuestions,
//             totalRight: totalRight,
//             totalUsers: totalUsers,
//             fontSize: fontSize,
//             iconSize: iconSize,
//           );
//   }

//   Widget _buildStat({
//     required String label,
//     required String value,
//     required Widget icon,
//     required Color color,
//     Widget? widgetValue,
//   }) {
//     return Flexible(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           CircleAvatar(
//             radius: 28,
//             backgroundColor: color,
//             child: icon,
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           SizedBox(
//             height: fontSize + 5,
//             child: widgetValue ??
//                 Text(
//                   value,
//                   style: AppTextStyle.w700(
//                     fontSize: fontSize,
//                   ),
//                 ),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Text(
//             label,
//             style: AppTextStyle.w400(
//               color: AppColors.text800,
//               fontSize: 13,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _TestResultStatsWidget extends StatelessWidget {
//   final int durationInSeconds;
//   final int index;
//   final int totalUsers;
//   final int top;
//   final int totalRight;
//   final int totalQuestions;
//   final double fontSize;
//   final double iconSize;
//   const _TestResultStatsWidget({
//     required this.durationInSeconds,
//     required this.index,
//     required this.totalUsers,
//     required this.top,
//     required this.totalRight,
//     required this.totalQuestions,
//     this.fontSize = 14,
//     this.iconSize = 16,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Flexible(
//               flex: 1,
//               child: _StatCardWidget(
//                 label: 'Thời gian',
//                 icon: Icon(
//                   CupertinoIcons.clock_fill,
//                   color: AppColors.primary,
//                   size: iconSize,
//                 ),
//                 value: DataConverter.durationToString(
//                   Duration(
//                     seconds: durationInSeconds,
//                   ),
//                   true,
//                 ),
//                 fontSize: fontSize,
//               ),
//             ),
//             const SizedBox(
//               width: 15,
//             ),
//             Flexible(
//               flex: 1,
//               child: _StatCardWidget(
//                 label: 'Xu nhận',
//                 icon: svgIcon(
//                   Res.ic_coin,
//                   width: iconSize,
//                 ),
//                 value: index == 1 ? '300' : '0',
//                 fontSize: fontSize,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 16,
//         ),
//         Row(
//           children: [
//             Flexible(
//               flex: 1,
//               child: _StatCardWidget(
//                 label: 'Câu đúng',
//                 icon: Icon(
//                   Icons.check_circle,
//                   color: AppColors.green,
//                   size: iconSize,
//                 ),
//                 value: '$totalRight/$totalQuestions',
//                 fontSize: fontSize,
//               ),
//             ),
//             const SizedBox(
//               width: 15,
//             ),
//             Flexible(
//               flex: 1,
//               child: _StatCardWidget(
//                 label: 'Xếp hạng',
//                 icon: svgIcon(
//                   Res.ic_trophy_1,
//                   width: iconSize,
//                 ),
//                 value: '$top/$totalUsers',
//                 fontSize: fontSize,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class _StatCardWidget extends StatelessWidget {
//   final String label;
//   final String value;
//   final Widget? widgetValue;
//   final Widget icon;
//   final double fontSize;
//   _StatCardWidget({
//     required this.label,
//     required this.value,
//     required this.icon,
//     this.widgetValue,
//     required this.fontSize,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Color.fromRGBO(17, 42, 80, 0.03),
//             spreadRadius: 25,
//             blurRadius: 4,
//             offset: Offset(0, 0),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           icon,
//           SizedBox(
//             width: 16,
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   label,
//                   style: AppTextStyle.w400(
//                     color: Palette.subTextColor,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 3,
//                 ),
//                 if (widgetValue != null) ...[
//                   widgetValue!
//                 ] else ...[
//                   Text(
//                     value,
//                     style: AppTextStyle.w700(
//                       fontSize: fontSize,
//                     ),
//                   ),
//                 ]
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
