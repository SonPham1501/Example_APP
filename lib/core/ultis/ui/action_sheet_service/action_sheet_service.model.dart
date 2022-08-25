part of 'action_sheet_service.dart';

class ActionSheetDataModel {
  final String? title;
  final String? message;
  final bool showCancelAction;
  final List<ActionSheetItemModel> actions;

  ActionSheetDataModel({
    required this.actions,
    this.title,
    this.message,
    this.showCancelAction = false,
  });
}

class ActionSheetItemModel {
  final String actionId = KeyGenerator.getRandomKey();
  final String label;
  final dynamic value;
  final VoidCallback? onClick;
  final bool isDangerAction;
  final String? warningLabel;
  final bool isSelected;
  ActionSheetItemModel({
    required this.label,
    this.onClick,
    this.value,
    this.isDangerAction = false,
    this.isSelected = false,
    this.warningLabel = "Bạn chắc chắn chứ?",
  });

  @override
  String toString() {
    return 'ActionSheetItemModel(label: $label, value: $value, onClick: $onClick, isDangerAction: $isDangerAction, warningLabel: $warningLabel, isSelected: $isSelected)';
  }
}

// typedef FilterItemClickCallBack = Future<dynamic> Function();

// typedef FilterItemLabelBuilder = String Function(dynamic value);

class ActionSheetFilterItemModel<T> {
  final String title;
  final bool isCheckBox;
  final String Function(dynamic value)? labelBuilder;
  final ValueChanged<dynamic> onValueChanged;
  final List<CommonFilterListItemGeneric<T>> items;
  final Future<List<CommonFilterListItemGeneric<T>>> Function(
      int, int, String?)? asyncItems;
  ActionSheetFilterItemModel({
    this.isCheckBox = false,
    this.labelBuilder,
    required this.title,
    required this.onValueChanged,
    this.items = const [],
    this.asyncItems,
  });

  ActionSheetFilterItemModel copyWith(
    dynamic value,
  ) {
    return ActionSheetFilterItemModel(
      title: this.title,
      items: this.items,
      labelBuilder: this.labelBuilder,
      onValueChanged: this.onValueChanged,
      isCheckBox: this.isCheckBox,
      asyncItems: this.asyncItems,
    );
  }
}
