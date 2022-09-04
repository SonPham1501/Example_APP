import 'package:flutter/material.dart';
import 'package:test_app/core/widgets/quill_content/quill_content_widget.dart';
import '../../../../../../core/config/index.dart';
import '../../../../domain/models/test/test_type/test_type.dart';
import '../../../ultis/models/drag_drop_value_model.dart';

typedef MatchChanged<T> = void Function(int index, T value);

class TestQuestionMatchWidget extends StatefulWidget {
  final TestSectionType section;
  final MatchChanged<String?> onAnswering;
  const TestQuestionMatchWidget({
    Key? key,
    required this.section,
    required this.onAnswering,
  }) : super(key: key);

  @override
  State<TestQuestionMatchWidget> createState() =>
      _TestQuestionMatchWidgetState();
}

class _TestQuestionMatchWidgetState extends State<TestQuestionMatchWidget> {
  List<TestDragListItemModel<TestQuestionAnswerType>> dragItems = [];
  List<TestDropListItemModel<TestQuestionType>> dropItems = [];
  bool isInitalized = false;
  @override
  void initState() {
    // TODO: implement initState
    genearteParts();
    super.initState();
  }

  genearteParts() {
    isInitalized = false;
    dragItems = [];
    dropItems = [];
    for (var i = 0; i < widget.section.questions.length; i++) {
      final _q = widget.section.questions[i];
      dropItems.add(TestDropListItemModel(index: i, value: _q));
      dragItems.add(TestDragListItemModel(index: i, value: _q.answers.first));
    }
    dragItems.shuffle();
    setState(() {
      isInitalized = true;
    });
  }

  selectDragItem(int index) {
    final _i = _findNext();
    if (_i != -1) {
      var tmp = dropItems[_i].copyWith(selected: dragItems[index]);
      setState(() {
        dropItems[_i] = tmp;
        dragItems[index] = dragItems[index].copyWith(selected: _i);
        widget.onAnswering(_i, dragItems[index].value.id);
      });
    }
  }

  unSelectDragItem(int index) {
    var _i = dragItems.indexWhere((element) => element.selected == index);

    if (_i != -1) {
      var tmp = dropItems[index].copyWith(selected: null);
      // Xlogger.d(tmp.selected);
      //  dragItems[_i] = dragItems[_i].copyWith(selected: null);
      setState(() {
        dropItems[index] = tmp;
        dragItems[_i] = dragItems[_i].copyWith(selected: null);
        widget.onAnswering(index, null);
      });
    }
  }

  _findNext() {
    for (var i = 0; i < dropItems.length; i++) {
      final element = dropItems[i];
      if (element.selected != null) continue;
      if (element.selected == null) return i;
      // if (!element.selected) {
      //   if (index + 1 <= this.advancedParts.length) {
      //     return index;
      //   }
      // }
    }

    return -1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ...List.generate(
          dropItems.length,
          (index) {
            final _item = dropItems[index];
            return TestMatchBoxWidget(
              child: QuillContentWidget(
                _item.value.name?.operations ?? [],
                fontSize: 16,
              ),
              selected: _item.selected == null
                  ? null
                  : GestureDetector(
                      onTap: () {
                        unSelectDragItem(index);
                      },
                      child: QuillContentWidget(
                        _item.selected?.value.content?.operations ?? [],
                        color: AppColors.primary,
                        fontSize: 16,
                      ),
                    ),
            );
          },
        ),
        const SizedBox(
          height: 35,
        ),
        ...List.generate(
          dragItems.length,
          (index) {
            final _item = dragItems[index];
            return GestureDetector(
              onTap: () {
                selectDragItem(index);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.05),
                      spreadRadius: 1,
                      blurRadius: 0,
                      offset: Offset(0, 0),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Opacity(
                  opacity: _item.selected == null ? 1 : 0,
                  child: QuillContentWidget(
                    _item.value.content?.operations ?? [],
                    fontSize: 16,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class TestMatchBoxWidget extends StatelessWidget {
  final Widget child;
  final Widget? selected;
  const TestMatchBoxWidget({
    Key? key,
    required this.child,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TestMatchPartWidget(
          child: child,
        ),
        TestMatchPartWidget(
          isTop: false,
          backgroundColor: selected == null ? AppColors.text300 : Colors.white,
          child: selected ??
              const SizedBox(
                height: 24,
              ),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}

class TestMatchPartWidget extends StatelessWidget {
  final bool isTop;
  final Widget? child;
  final Color backgroundColor;
  const TestMatchPartWidget({
    Key? key,
    this.isTop = true,
    this.backgroundColor = Colors.white,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!isTop) ...[
          RotatedBox(
            quarterTurns: 2,
            child: ClipRRect(
              child: ClipPath(
                clipper: WaveClipper(true),
                clipBehavior: Clip.hardEdge,
                child: Container(
                  height: 8,
                  width: double.infinity,
                  color: backgroundColor,
                  child: CustomPaint(
                    painter: ClipperBorderPainter(
                      fromTop: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
        Container(
          decoration: BoxDecoration(
            borderRadius: isTop
                ? const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  )
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(0, 0, 0, 0.05),
                spreadRadius: 1,
                blurRadius: 0,
                offset: Offset(0, isTop ? -1 : 1),
              ),
            ],
            color: backgroundColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.infinity,
          child: child ??
              const SizedBox(
                height: 24,
              ),
        ),
        if (isTop) ...[
          ClipRRect(
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: 8,
                width: double.infinity,
                color: backgroundColor,
                child: CustomPaint(painter: ClipperBorderPainter()),
              ),
            ),
          ),
        ]
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final bool fromTop;
  WaveClipper([this.fromTop = false]);
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    var x = 0.0;
    var numberOfWaves = 30;
    var increment = size.width / numberOfWaves;

    bool startFromTop = fromTop;

    while (x < size.width) {
      if (startFromTop) {
        path.lineTo(x, 0);
        path.cubicTo(x + increment / 2, 0, x + increment / 2, size.height,
            x + increment, size.height);
      } else {
        path.lineTo(x, size.height);
        path.cubicTo(x + increment / 2, size.height, x + increment / 2, 0,
            x + increment, 0);
      }
      x += increment;
      startFromTop = !startFromTop;
    }

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ClipperBorderPainter extends CustomPainter {
  final bool fromTop;
  final Color strokeColor;
  ClipperBorderPainter({
    this.fromTop = false,
    this.strokeColor = AppColors.text500,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = AppColors.text500;
    var path = Path();
    path.lineTo(0, size.height);
    var x = 0.0;
    var numberOfWaves = 30;
    var increment = size.width / numberOfWaves;
    bool startFromTop = fromTop;

    while (x < size.width) {
      if (startFromTop) {
        path.moveTo(x, 0);
        path.cubicTo(x + increment / 2, 0, x + increment / 2, size.height,
            x + increment, size.height);
      } else {
        path.moveTo(x, size.height);
        path.cubicTo(x + increment / 2, size.height, x + increment / 2, 0,
            x + increment, 0);
      }
      x += increment;
      startFromTop = !startFromTop;
    }

    //path.lineTo(size.width, 0);
    // path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
