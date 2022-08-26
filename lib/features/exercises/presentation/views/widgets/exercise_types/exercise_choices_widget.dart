import 'package:flutter/material.dart';

class ExerciseChoiceWidget extends StatelessWidget {
  const ExerciseChoiceWidget({
    Key? key,
    required this.id,
    required this.content,
    required this.items,
    required this.anwser,
    required this.onSelected,
    this.selectedItem,
    required this.done,
  }) : super(key: key);

  final String id;
  final List<String> items;
  final String content, anwser;
  final String? selectedItem;
  final Function(String value) onSelected;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _content(context),
          const SizedBox(height: 60),
          Expanded(child: _listAnwser(context)),
          const SizedBox(height: 30),
        ],
      ),
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
    return GestureDetector(
      onTap: done ? null : () => onSelected(items[index]),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: items[index] == selectedItem
                ? Border.all(
                    color: !done
                        ? Colors.blue
                        : selectedItem != anwser
                            ? Colors.red
                            : Colors.green,
                    width: 1,
                  )
                : null,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 0,
                color: Colors.grey.shade100,
              ),
            ]),
        child: Text(
          items[index],
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: items[index] == selectedItem
                ? !done
                    ? Colors.blue
                    : selectedItem != anwser
                        ? Colors.red
                        : Colors.green
                : null,),
        ),
      ),
    );
  }

  Text _content(BuildContext context) => Text(
        'Câu $id: Choos the best word to complete the sentence: "$content"',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blue),
      );
}
