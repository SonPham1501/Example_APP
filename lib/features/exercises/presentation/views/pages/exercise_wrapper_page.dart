import 'package:flutter/material.dart';
import 'package:test_app/core/widgets/empty_widget.dart';
import 'package:test_app/features/exercises/domain/section_types/choices.dart';
import 'package:test_app/features/exercises/domain/enums/exercise_type_enum.dart';

import '../../../data/mocks/dummy_data.dart';
import '../../../domain/base_exercise_model.dart';
import '../widgets/buttons/contained_button.dart';
import '../widgets/exercise_types/exercise_choices_widget.dart';
import '../widgets/page_slider.dart';
import '../widgets/time_count_down_widget.dart';

class ExerciseWrapperPage extends StatefulWidget {
  final BaseExerciseModel model;
  const ExerciseWrapperPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  // const ExerciseWrapperPage({
  //   Key? key,
  // }) : super(key: key);

  @override
  State<ExerciseWrapperPage> createState() => _ExerciseWrapperPageState();
}

class _ExerciseWrapperPageState extends State<ExerciseWrapperPage> {
  final _pageController = PageController();
  int _currentPage = 0;
  final _result = <String, String>{};
  bool _done = false;
  int time = 60;

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var element in data.questions!) {
        _result[element.id!] = '';
      }
    });
  }

  @override
  void dispose() {
    // widget.model.dataType
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _done || _currentPage == data.questions!.length - 1
          ? _buildFloatingActionButtonEndPage()
          : _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: _buildAppBar(),
      body: Builder(
        builder: (context) {
          switch (widget.model.dataType) {
            case ExerciseTypeEnum.choices:
              final data = widget.model.data as ChoicesExerciseData;
              return PageSlider(
                pageController: _pageController,
                onPageChanged: (value) {
                  _currentPage = value;
                  setState(() {});
                },
                page: data.questions!.map((e) {
                  //TODO: Phần này lấy từ param truyền vào
                  return ExerciseChoiceWidget(
                    id: e.index.toString(),
                    content: e.content!,
                    items: e.options!.map((elem) => elem.content!).toList(),
                    anwser: e.correctOption!,
                    done: _done,
                    onSelected: (value) {
                      // _result[e.index!.toString()] = value;
                      // setState(() {});
                    },
                    //selectedItem: _result[e.id!] == '' ? null : _result[e.id!],
                  );
                }).toList(),
              );
            default:
              return const EmptyWidget();
          }
        }
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
        // leading: const Icon(Icons.close, color: Colors.blue),
        actions: _actionAppBar,
      );

  List<Widget> get _actionAppBar => [
        _donotAction(),
        const SizedBox(width: 10),
        _downTime(),
        const SizedBox(width: 10),
      ];

  Widget _donotAction() {
    return GestureDetector(
      onTap: () {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        _currentPage = _pageController.page!.toInt() + 1;
        setState(() {});
      },
      child: Chip(
        label: Text(
          "I don't known",
          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _downTime() {
    return Chip(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(16),
      ),
      label: CountDownTimer(time, finish: (value) {
        time = 0;
        _done = true;
        setState(() {});
      }),
    );
  }

  Widget _buildFloatingActionButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ContainedButton(
              text: 'Quay lại',
              size: const Size(0, 45),
              radius: 10,
              color: Colors.white,
              textColor: Colors.blue,
              press: () async {
                _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
                _currentPage = _pageController.page!.toInt() - 1;
                setState(() {});
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ContainedButton(
              text: 'Tiếp theo',
              size: const Size(0, 45),
              radius: 10,
              color: Colors.purple,
              press: () async {
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
                _currentPage = _pageController.page!.toInt() + 1;
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButtonEndPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ContainedButton(
        text: _done ? 'Làm lại' : 'Nộp bài',
        size: const Size(double.infinity, 45),
        radius: 10,
        color: Colors.white,
        textColor: Colors.green,
        press: () async {
          //log(time.toString());
          if (_done) {
            _done = false;
            time = 60;
            setState(() {});
            _pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
            return;
          }
          int right = 0;
          for (var e in data.questions!) {
            if (e.answer == _result[e.id!]) right++;
          }

          String message = 'Câu trả lời đúng: $right/${data.questions!.length}';
          await showSimpleDialog(message);
          _done = true;
          setState(() {});
        },
      ),
    );
  }

  Future<void> showSimpleDialog(String message) async {
    return await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
