import 'package:flutter/cupertino.dart';
import 'package:test_app/core/widgets/controls/app_audio_player.dart';
import '../../../../../../core/common/models/app_file_attachment/app_file_attachment.dart';

class TestContentAudioWidget extends StatelessWidget {
  final List<AppFileAttachmentType> attachments;
  const TestContentAudioWidget(this.attachments, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        attachments.length,
        (index) => AppAudioPlayer(attachments[index]),
      ),
    );
  }
}

// class _AudioTagWidget extends StatelessWidget {
//   final AppFileAttachmentType file;
//   final VoidCallback onClick;
//   const _AudioTagWidget(this.file, this.onClick, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 12),
//       child: AppButtons.outlined(
//         label: 'Tệp âm thanh',
//         textStyle: AppTextStyle.w600(
//           color: AppColors.text900,
//         ),
//         backgroundColor: AppColors.text300,
//         prefix: Icon(CupertinoIcons.music_note_2),
//         onPressed: this.onClick,
//       ),
//     );
//   }
// }
