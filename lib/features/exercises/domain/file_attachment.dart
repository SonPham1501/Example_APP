// class FileAttachment {
//   dynamic id;
//   String? name, resourceType, contentType, uuid;
//   num? number;
//   int? size;
//   String? path;

//   FileAttachment({
//     this.id,
//     this.contentType,
//     this.name,
//     this.number,
//     this.path,
//     this.resourceType,
//     this.size,
//     this.uuid,
//   });

//   FileAttachment.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'] as String?;
//     resourceType = json['resourceType'] as String?;
//     contentType = json['contentType'] as String?;
//     uuid = json['uuid'] as String?;
//     path = json['path'] as String?;
//     number = json['number'] as num?;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['id'] = id;
//     json['name'] = name;
//     json['resourceType'] = resourceType;
//     json['contentType'] = contentType;
//     json['uuid'] = uuid;
//     json['path'] = path;
//     json['number'] = number;
//     return json;
//   }

// }