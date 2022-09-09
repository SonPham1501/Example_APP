
import 'package:flutter/material.dart';
import 'package:test_app/features/exercises/presentation/views/widgets/bottomsheet/bottomsheet_noti_result.dart';

class ExerciseChoiceWidget extends StatelessWidget {
  const ExerciseChoiceWidget({
    Key? key,
    required this.id,
    required this.content,
    required this.items,
    required this.answer,
    required this.onSelected,
    required this.onNextQuestion,
    this.selectedItem,
  }) : super(key: key);

  final int id;
  final List<String> items;
  final String content, answer;
  final String? selectedItem;
  final Function(String value) onSelected;
  final Function(int value) onNextQuestion;

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: _content(context),
        ),
        const SizedBox(height: 60),
        Expanded(child: _listAnwser(context)),
        const SizedBox(height: 30),
      ],
    );
  }

  ListView _listAnwser(BuildContext context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemCount: items.length,
    itemBuilder: (BuildContext context, int index) {
      return _itemAnwser(context, index);
    },
    separatorBuilder: (BuildContext context, int index) {
      return index == items.length - 1
        ? const SizedBox.shrink()
        : const SizedBox(height: 20);
    },
  );

  Widget _itemAnwser(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () async {
          onSelected(items[index]);
          final result = await BottomSheetNotiResultBuilder.show(
            context,
            answer: answer,
            isCorrect: answer == items[index],
          );
          if (result) {
            int nextIndex = id;
            onNextQuestion(nextIndex);
          }
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          decoration: BoxDecoration(
              color: items[index] == selectedItem
                ? answer == selectedItem
                  ? Colors.green
                  : Colors.red
                : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0),
                  blurRadius: 6,
                  spreadRadius: 0,
                  color: Theme.of(context).shadowColor,
                ),
              ]),
          child: Text(
            items[index],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(color: items[index] == selectedItem
              ? Colors.white
              : null,
            ),
          ),
        ),
      ),
    );
  }

  Text _content(BuildContext context) => Text(
        'Câu $id: Choos the best word to complete the sentence: "$content"',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blue),
      );
}
