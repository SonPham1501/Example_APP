
class ExtraContent {
  String? value, position;

  ExtraContent({this.value, this.position});

  ExtraContent.fromJson(Map<String, dynamic> json) {
    value = json['value'] as String?;
    position = json['position'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['value'] = value;
    json['position'] = position;
    return json;
  }
}
