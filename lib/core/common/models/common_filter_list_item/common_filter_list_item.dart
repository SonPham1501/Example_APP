import 'dart:convert';
// class CommonFilterListItem with _$CommonFilterListItem {
//   factory CommonFilterListItem({
//     required int id,
//     required String name,
//     String? data,
//     String? description,
//     String? icon,
//     String? thumbnail,
//   }) = _CommonFilterListItem;

//   factory CommonFilterListItem.fromJson(Map<String, dynamic> json) =>
//       _$CommonFilterListItemFromJson(json);
// }
class CommonFilterListItem extends CommonFilterListItemGeneric<int> {
  final int id;
  final String name;
  final String? data;
  final String? icon;
  final String? description;
  final String? thumbnail;
  CommonFilterListItem({
    required this.id,
    required this.name,
    this.data,
    this.icon,
    this.description,
    this.thumbnail,
  }) : super(
          id: id,
          name: name,
          data: data,
          icon: icon,
          description: description,
          thumbnail: thumbnail,
        );
}

class CommonFilterListItemGeneric<T> {
  final T id;
  final String name;
  final String? data;
  final String? icon;
  final String? description;
  final String? thumbnail;

  CommonFilterListItemGeneric({
    required this.id,
    required this.name,
    this.data,
    this.icon,
    this.description,
    this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'data': data,
      'icon': icon,
      'description': description,
      'thumbnail': thumbnail,
    };
  }

  factory CommonFilterListItemGeneric.fromMap(Map<String, dynamic> map) {
    return CommonFilterListItemGeneric<T>(
      id: map['id'],
      name: map['name'],
      data: map['data'] != null ? map['data'] : null,
      icon: map['icon'] != null ? map['icon'] : null,
      description: map['description'] != null ? map['description'] : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommonFilterListItemGeneric.fromJson(String source) =>
      CommonFilterListItemGeneric.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommonFilterListItemGeneric<T> && other.id == id;
    // &&
    // other.name == name &&
    // other.data == data &&
    // other.icon == icon &&
    // other.description == description &&
    // other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        data.hashCode ^
        icon.hashCode ^
        description.hashCode ^
        thumbnail.hashCode;
  }

  @override
  String toString() {
    return 'CommonFilterListItemGeneric(id: $id, name: $name, data: $data, icon: $icon, description: $description, thumbnail: $thumbnail)';
  }
}
