import 'package:flutter/cupertino.dart';
import '../../../../../../core/common/models/app_file_attachment/app_file_attachment.dart';
import '../../../../../../core/config/app_text_style.dart';
import '../../../../../../core/config/palette.dart';
import '../../../../../../core/widgets/app_buttons.dart';
import 'test_audio_player_modal.dart';

class TestContentAudioWidget extends StatelessWidget {
  final List<AppFileAttachmentType> attachments;
  TestContentAudioWidget(this.attachments, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        this.attachments.length,
        (index) => AppAudioPlayer(this.attachments[index]),

        // _AudioTagWidget(
        //   this.attachments[index],
        //   () {
        //     showMaterialModalBottomSheet(
        //       context: context,
        //       builder: (BuildContext context) => TestAudioPlayerModal(
        //         this.attachments[index],
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}

class _AudioTagWidget extends StatelessWidget {
  final AppFileAttachmentType file;
  final VoidCallback onClick;
  const _AudioTagWidget(this.file, this.onClick, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: AppButtons.outlined(
        label: 'Tệp âm thanh',
        textStyle: AppTextStyle.w600(
          color: AppColors.text900,
        ),
        backgroundColor: AppColors.text300,
        prefix: Icon(CupertinoIcons.music_note_2),
        onPressed: this.onClick,
      ),
    );
  }
}
