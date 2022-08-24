

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_app/mooks_data/mooks_data.dart';
import 'package:test_app/widgets/buttons/contained_button.dart';
import 'package:test_app/widgets/fill_in_the_blank.dart';
import 'package:test_app/widgets/page_slider.dart';
import 'package:test_app/widgets/time_count_down_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      for (var element in data.questions!) {
        _result[element.id!] = '';
      }
    });
  }

  @override
  void dispose() {
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
      body: PageSlider(
        pageController: _pageController,
        onPageChanged: (value) {
          _currentPage = value;
          setState(() {});
        },
        page: data.questions!.map((e) {
          return FillInTheBlank(
            id: e.id!,
            content: e.content!,
            items: e.choices!,
            anwser: e.answer!,
            done: _done,
            onSelected: (value) {
              _result[e.id!] = value;
              setState(() {});
            },
            selectedItem: _result[e.id!] == '' ? null : _result[e.id!],
          );
        }).toList(),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
    leading: const Icon(Icons.close, color: Colors.blue),
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
        _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        _currentPage = _pageController.page!.toInt() + 1;
        setState(() { });
      },
      child: const Chip(
        label: Text(
          "I don't known",
          style: TextStyle(color: Colors.white),
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
                _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
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
                _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                _currentPage = _pageController.page!.toInt() + 1;
                setState(() { });
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
          log(time.toString());
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