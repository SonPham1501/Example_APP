import 'package:flutter/material.dart';
import '../../../../../../core/common/models/app_file_attachment/app_file_attachment.dart';
import '../../../../../../core/config/palette.dart';
import '../../../../../../core/widgets/gallery_view/hero_route.dart';
import '../../../../../../core/widgets/gallery_view/simple_interactive_gallery_viewer.dart';
import '../../../../../../core/widgets/layouts/cached_image_network_widget.dart';

class TestContentImageWidget extends StatelessWidget {
  final List<AppFileAttachmentType> attachments;
  const TestContentImageWidget(
    this.attachments, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.separated(
        separatorBuilder: (context, i) => const SizedBox(
          width: 8,
        ),
        itemBuilder: (context, i) => InkWell(
          onTap: () {
            _open(context, index: i, attachment: attachments[i]);
          },
          child: Hero(
            tag: attachments[i].id.toString(),
            child: CachedNetworkImagekWidget(
              fit: BoxFit.contain,
              imageUrl: attachments[i].path ?? "",
              errorWidget: AspectRatio(
                aspectRatio: 16 / 10,
                child: Container(
                  color: AppColors.text700,
                  child: Center(
                    child: Text('Hình ảnh lỗi'),
                  ),
                ),
              ),
            ),
          ),
        ),
        shrinkWrap: true,
        itemCount: attachments.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  void _open(
    context, {
    required int index,
    required AppFileAttachmentType attachment,
  }) {
    Navigator.of(context, rootNavigator: true).push(
      HeroDialogRoute<void>(
        builder: (BuildContext context) =>
            SimpleInteractiveViewerGallery<AppFileAttachmentType>(
          sources: attachments,
          initIndex: index,
          itemBuilder: (BuildContext context, int index, bool isFocus) => Hero(
            tag: attachments[index].id.toString(),
            child: CachedNetworkImagekWidget(
              fit: BoxFit.contain,
              imageUrl: attachments[index].path ?? "",
            ),
          ),
          onPageChanged: (int pageIndex) {
            // print("nell-pageIndex:$pageIndex");
          },
        ),
      ),
    );
  }
}
