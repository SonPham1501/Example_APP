class TestDropListItemModel<T> {
  final int index;
  final T value;
  final dynamic selected;
  TestDropListItemModel({
    required this.index,
    required this.value,
    this.selected,
  });

  TestDropListItemModel<T> copyWith({
    int? index,
    T? value,
    dynamic selected,
  }) {
    return TestDropListItemModel<T>(
      index: index ?? this.index,
      value: value ?? this.value,
      selected: selected,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TestDropListItemModel<T> &&
        other.index == index &&
        other.value == value &&
        other.selected == selected;
  }

  @override
  int get hashCode => index.hashCode ^ value.hashCode ^ selected.hashCode;

  @override
  String toString() =>
      'TestDropListItemModel(index: $index, value: $value, selected: $selected)';
}

class TestDragListItemModel<T> {
  final int index;
  final T value;
  final int? selected;
  TestDragListItemModel({
    required this.index,
    required this.value,
    this.selected,
  });

  TestDragListItemModel<T> copyWith({
    int? index,
    T? value,
    int? selected,
  }) {
    return TestDragListItemModel<T>(
      index: index ?? this.index,
      value: value ?? this.value,
      selected: selected,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TestDragListItemModel<T> &&
        other.index == index &&
        other.value == value &&
        other.selected == selected;
  }

  @override
  int get hashCode => index.hashCode ^ value.hashCode ^ selected.hashCode;

  @override
  String toString() =>
      'TestDragListItemModel(index: $index, value: $value, selected: $selected)';
}
