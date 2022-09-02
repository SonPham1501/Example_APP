class DragListItemModel<T> {
  final ItemValue<T> text;
  final ItemValue<T>? linkText;
  DragListItemModel({
    required this.text,
    this.linkText,
  });
  factory DragListItemModel.fromQuestion({
    required int index,
    required T text,
    required String id,
  }) =>
      DragListItemModel(
        text: ItemValue(index: index, text: text, id: id),
      );

  // static List<DragListItemModel> get questions => [
  //       DragListItemModel.fromQuestion(0, 'Please pick me up early'),
  //       DragListItemModel.fromQuestion(1, 'We can also reuse plastic bag'),
  //       DragListItemModel.fromQuestion(2, 'I can\'t buy a new jacket'),
  //       DragListItemModel.fromQuestion(3, 'Although the film is late'),
  //     ];
  // static List<ItemValue> get answers => [
  //       ItemValue(0, 'Please pick me up early'),
  //       ItemValue(1, 'We can also reuse plastic bag'),
  //       ItemValue(2, 'I can\'t buy a new jacket'),
  //       ItemValue(3, 'Although the film is late'),
  //     ];

  @override
  String toString() => 'DragListItemModel(text: $text, linkText: $linkText)';

  DragListItemModel<T> copyWith({
    ItemValue<T>? text,
    ItemValue<T>? linkText,
  }) {
    return DragListItemModel<T>(
      text: text ?? this.text,
      linkText: linkText,
    );
  }
}

class ItemValue<T> {
  final int index;
  final T text;
  final String id;
  ItemValue({
    required this.index,
    required this.text,
    required this.id,
  });

  @override
  String toString() => 'ItemValue(index: $index, text: $text, id: $id)';
}
