import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/config/app_text_style.dart';
import '../../../../../../core/config/palette.dart';
import '../../../../../../core/ultis/ui/action_sheet_service/action_sheet_service.dart';
import '../../../../../../core/widgets/svg_picture_widget.dart';

class WriteAnswerBoxWidget extends StatelessWidget {
  final String answered;
  final ValueChanged<String> onSubmit;
  WriteAnswerBoxWidget({
    this.answered = '',
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: answered.length > 0 ? Color(0xffF1F3FF) : Palette.input_bg,
        borderRadius: BorderRadius.circular(10),
        border: answered.length > 0
            ? Border.all(color: AppColors.primary, width: 1)
            : null,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
        ),
        onPressed: () {
          ActionSheetService.showBottomSheet(
            context,
            expand: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
            ),
            builder: (context) {
              return _PopupAnswerTextField(
                initalValue: answered,
              );
            },
          ).then((value) {
            print(value);
            if (value is String) {
              this.onSubmit(value);
            }
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    svgIcon(
                      'assets/icons/test/ic_answer_bubble.svg',
                      width: 24,
                      color: AppColors.primary,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      answered.length > 0
                          ? 'Bạn đã trả lời: '
                          : 'Điền câu trả lời của bạn...',
                      style: AppTextStyle.w400(
                        fontSize: DefaultTextStyle.of(context).style.fontSize,
                        fontFamily:
                            DefaultTextStyle.of(context).style.fontFamily,
                        color: answered.length > 0
                            ? Palette.textBlack
                            : Palette.subTextColor,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: answered.length > 0
                        ? AppColors.primary
                        : Palette.commonBorder,
                    size: 16,
                  ),
                ),
              ],
            ),
            if (answered.length > 0) ...[
              const SizedBox(
                height: 8,
              ),
              Text(
                answered,
                style: AppTextStyle.w400(
                  color: Palette.textBlack,
                  lineHeight: 1.5,
                  fontSize: DefaultTextStyle.of(context).style.fontSize,
                  fontFamily: DefaultTextStyle.of(context).style.fontFamily,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class _PopupAnswerTextField extends StatefulWidget {
  final String initalValue;
  _PopupAnswerTextField({
    this.initalValue = '',
  });

  @override
  State<_PopupAnswerTextField> createState() => _PopupAnswerTextFieldState();
}

class _PopupAnswerTextFieldState extends State<_PopupAnswerTextField> {
  final _textController = TextEditingController();
  @override
  void initState() {
    _textController.text = widget.initalValue;
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: WillPopScope(
        onWillPop: () async {
          bool shouldClose = true;
          // await showCupertinoDialog(
          //     context: context,
          //     builder: (context) => CupertinoAlertDialog(
          //           title: Text('Should Close?'),
          //           actions: <Widget>[
          //             CupertinoButton(
          //               child: Text('Yes'),
          //               onPressed: () {
          //                 shouldClose = true;
          //                 Navigator.of(context).pop();
          //               },
          //             ),
          //             CupertinoButton(
          //               child: Text('No'),
          //               onPressed: () {
          //                 shouldClose = false;
          //                 Navigator.of(context).pop();
          //               },
          //             ),
          //           ],
          //         ));
          return shouldClose;
          //return true;
        },
        child: SingleChildScrollView(
          child: AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 100),
            curve: Curves.decelerate,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nhập câu trả lời của bạn',
                        style: AppTextStyle.w500(
                          fontFamily: 'GoogleSans',
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                        width: 70,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            // minimumSize: Size(0, 0),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .maybePop(_textController.text);
                          },
                          child: Text(
                            'Xong',
                            style: AppTextStyle.w700(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CupertinoTextField(
                    controller: _textController,
                    minLines: 1,
                    maxLines: 4,
                    showCursor: true,
                    autofocus: true,
                    placeholder: 'Nhập đáp án...',
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Palette.input_bg,
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(
                      //   color: Palette.commonBorder,
                      // ),
                    ),
                    onSubmitted: (val) => Navigator.of(context).maybePop(val),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
