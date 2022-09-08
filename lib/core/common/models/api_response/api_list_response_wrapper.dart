import 'dart:convert';

class ApiListResponseWrapper<T> {
  final int? limit;
  final int? start;
  final int total;
  final List<T> items;
  const ApiListResponseWrapper({
    this.limit,
    this.start,
    this.total = 0,
    this.items = const [],
  });

  factory ApiListResponseWrapper.fromJson(Map<String, dynamic>? json,
          List<T>? Function(List<dynamic>? items) fromJson) =>
      json == null
          ? const ApiListResponseWrapper(items: [])
          : ApiListResponseWrapper(
              start: json["start"],
              limit: json["limit"],
              total: json["total"] ?? 0,
              items: json["items"] == null
                  ? []
                  : fromJson(json["items"] as List<dynamic>?) ?? [],
            );

  factory ApiListResponseWrapper.empty() => const ApiListResponseWrapper();
  Map<String, dynamic> toJson() => {
        "start": start,
        "limit": limit,
        "total": total,
        "items": jsonEncode(items),
      };

  @override
  String toString() {
    return 'ApiListResponseWrapper(limit: $limit, start: $start, total: $total, items: $items)';
  }

  ApiListResponseWrapper<T> copyWith({
    int? limit,
    int? start,
    int? total,
    List<T>? items,
  }) {
    return ApiListResponseWrapper<T>(
      limit: limit ?? this.limit,
      start: start ?? this.start,
      total: total ?? this.total,
      items: items ?? this.items,
    );
  }
}

// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// class ApiResponseModel<T> extends Equatable {
//   final int status;
//   final String message;
//   final int dataCount;
//   final int totalCount;
//   final T data;
//   ApiResponseModel(
//       {this.status, this.message, this.data, this.dataCount, this.totalCount});
//   factory ApiResponseModel.fromJson(Map<String, dynamic> json, T data) {
//     return ApiResponseModel(
//         status: json['status'],
//         message: json['message'],
//         dataCount: json['dataCount'],
//         totalCount: json['totalCount'],
//         data: data);
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'message': message,
//       'data': data,
//       'dataCount': dataCount,
//       'totalCount': totalCount
//     };
//   }

//   @override
//   // TODO: implement props
//   List<Object> get props => [status, message, data, totalCount, totalCount];
// }

// class ApiPagedResponseWrapper<T> implements _$ApiPagedResponseWrapper<T> {
//   // const ApiPagedResponseWrapper._();
//   const factory ApiPagedResponseWrapper({
//     required int status,
//     @Default("") String message,
//     @Default([]) List<dynamic> data,
//   }) = _ApiPagedResponseWrapper<T>;

//   factory ApiPagedResponseWrapper.fromJson(Map<String, dynamic> json) =>
//       _$ApiPagedResponseWrapperFromJson<T>(json);

//   // bool isSuccess() => this.status == 1;
//   // bool isFailed() => this.status == 0;
//   // bool isError() => this.status == -1;
//   // bool isSpecial() => this.status > 1;
// }
