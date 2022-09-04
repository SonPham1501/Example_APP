import 'dart:convert';

class TestChoosePartModel {
  final String type;
  final String value;
  final int indexType;
  final String? correction;
  TestChoosePartModel({
    required this.type,
    required this.value,
    required this.indexType,
    this.correction,
  });

  @override
  String toString() {
    return 'TestChoosePartModel(type: $type, value: $value, indexType: $indexType, correction: $correction)';
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'value': value,
      'indexType': indexType,
      'correction': correction,
    };
  }

  factory TestChoosePartModel.fromMap(Map<String, dynamic> map) {
    return TestChoosePartModel(
      type: map['type'] ?? '',
      value: map['value'] ?? '',
      indexType: map['indexType']?.toInt() ?? 0,
      correction: map['correction'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TestChoosePartModel.fromJson(String source) =>
      TestChoosePartModel.fromMap(json.decode(source));
}

class TestChooseExtraDataModel {
  final String text;
  final List<TestChoosePartModel> parts;
  TestChooseExtraDataModel({
    this.text = '',
    this.parts = const [],
  });

  @override
  String toString() => 'TestChooseExtraDataModel(text: $text, parts: $parts)';

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  factory TestChooseExtraDataModel.fromMap(Map<String, dynamic> map) {
    return TestChooseExtraDataModel(
      text: map['text'] ?? '',
      parts: List<TestChoosePartModel>.from(
          map['parts']?.map((x) => TestChoosePartModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TestChooseExtraDataModel.fromJson(String source) =>
      TestChooseExtraDataModel.fromMap(json.decode(source));
}
