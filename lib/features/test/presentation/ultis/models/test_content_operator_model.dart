class ITestContentOperatorModel {
  String type;
  String value;
  int? index;
  ITestContentOperatorModel({
    required this.type,
    required this.value,
    this.index,
  });

  @override
  String toString() => 'IOperator(type: $type, value: $value, index: $index)';
}
