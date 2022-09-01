part of 'question_match_widget.dart';

// class _DraggingListItem extends StatelessWidget {
//   final ItemValue value;
//   final GlobalKey dragKey;
//   final Color? color;
//   const _DraggingListItem({
//     Key? key,
//     required this.dragKey,
//     required this.value,
//     this.color,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: Transform.rotate(
//         angle: -5 * math.pi / 180,
//         child: ClipRRect(
//           key: dragKey,
//           borderRadius: BorderRadius.circular(10),
//           child: Container(
//             width: MediaQuery.of(context).size.width - 32,
//             decoration: BoxDecoration(
//               color: color ?? Colors.white,
//               border: Border.all(color: AppColors.primary, width: 2),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             padding: EdgeInsets.symmetric(
//               horizontal: 16,
//               vertical: 16,
//             ),

//             // height: 100,
//             child: _TextStartWithWidget(
//               index: value.index,
//               text: value.text,
//               isAnswer: true,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class _ListQuestionItem extends StatelessWidget {
  final DragListItemModel<QuillContent> item;
  final VoidCallback onUnlink;
  final List<ItemValue<QuillContent>> answers;
  final ValueChanged<ItemValue<QuillContent>> onSelected;
  const _ListQuestionItem({
    Key? key,
    required this.item,
    required this.answers,
    required this.onSelected,
    //this.draggingOverItem,
    required this.onUnlink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (item.linkText == null) {
          final maxHeight = MediaQuery.of(context).size.height;
          ActionSheetService.showBottomSheet(
            context,
            builder: (ctx) => ConstrainedBox(
              constraints: BoxConstraints(maxHeight: maxHeight * .9),
              child: _AnswerDialog(
                answers: answers,
                question: item,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: AppColors.text100,
          ).then((value) {
            if ((value != null) && (value is ItemValue<QuillContent>)) {
              onSelected(value);
            }
          });
        } else {
          onUnlink();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(
          //   color: AppColors.border,
          // ),
          boxShadow: [
            BoxShadow(
              color: AppColors.text400,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: _TextStartWithWidget(
                    index: item.text.index,
                    text: item.text.text,
                    isAnswer: false,
                  ),
                ),
                if (item.linkText == null) ...[
                  Icon(
                    CupertinoIcons.arrow_up_right,
                    size: 18,
                  ),
                ],
              ],
            ),
            if (item.linkText != null) ...[
              Container(
                width: 32,
                padding: EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.center,
                transformAlignment: Alignment.center,
                transform: Matrix4.rotationZ(90 * math.pi / 180),
                child: Icon(
                  Icons.link,
                  color: AppColors.primary,
                  size: 18,
                ),
              ),
              _TextStartWithWidget(
                index: item.linkText!.index,
                isAnswer: true,
                text: item.linkText!.text,
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class _TextStartWithWidget extends StatelessWidget {
  final int index;
  final bool isAnswer;
  final QuillContent text;
  const _TextStartWithWidget({
    Key? key,
    required this.index,
    required this.text,
    this.isAnswer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleCharacterWidget(
          text: isAnswer ? StringUltis.toABC(index) : (index + 1).toString(),
          border: Border.all(color: Color(0xffD7D6DB)),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            height: 1,
            fontSize: DefaultTextStyle.of(context).style.fontSize,
            fontFamily: DefaultTextStyle.of(context).style.fontFamily,
          ),
          backgroundColor: Colors.transparent,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: QuillContentWidget(text.operations),
        ),
      ],
    );
  }
}

class _ListAnswerItem extends StatelessWidget {
  final ItemValue value;
  final bool selected;
  _ListAnswerItem(this.value, {this.selected = false});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        //color: AppColors.text300,
        border: selected
            ? Border.all(
                color: AppColors.primary,
                width: 2,
              )
            : null,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.text400,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TextStartWithWidget(
            index: value.index,
            text: value.text,
            isAnswer: true,
          ),
        ],
      ),
    );
  }
}

class _AnswerDialog extends StatefulWidget {
  final DragListItemModel<QuillContent> question;
  final List<ItemValue<QuillContent>> answers;
  _AnswerDialog({
    Key? key,
    required this.answers,
    required this.question,
  }) : super(key: key);

  @override
  State<_AnswerDialog> createState() => _AnswerDialogState();
}

class _AnswerDialogState extends State<_AnswerDialog> {
  int? selectedIndex;

  select(int index) {
    if (mounted) {
      setState(() {
        this.selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: SafeArea(
        // top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _TextStartWithWidget(
                index: widget.question.text.index,
                text: widget.question.text.text,
                isAnswer: false,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.text400,
                      height: 36,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Nội dung cột B",
                      style: AppTextStyle.w500(
                        color: AppColors.text700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.text400,
                      height: 36,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              ...List.generate(
                widget.answers.length,
                (index) => GestureDetector(
                  onTap: () {
                    select(index);
                  },
                  child: _ListAnswerItem(
                    widget.answers[index],
                    selected: index == selectedIndex,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                color: AppColors.text300,
                padding: EdgeInsets.symmetric(vertical: 12),
                child: AppButtons.rounded(
                  label: 'Xong',
                  backgroundColor: AppColors.primary,
                  buttonSize: AppButtonSize.normal,
                  onPressed: () {
                    Navigator.of(context).pop(selectedIndex == null
                        ? null
                        : widget.answers[selectedIndex!]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
