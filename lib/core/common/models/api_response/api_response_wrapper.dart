import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../error/failure.dart';

class ApiResponseWrapper<T> {
  final int status;
  final String message;
  final Map<String, dynamic> data;
  final String? errorCode;
  ApiResponseWrapper({
    required this.status,
    this.message = "",
    this.errorCode,
    this.data = const {},
  });

  factory ApiResponseWrapper.fromJson(Map<String, dynamic> json) =>
      ApiResponseWrapper(
          status: json["status"],
          message: json["message"] ?? "",
          data: json["data"] ?? {},
          errorCode: json["errorCode"]);

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": jsonEncode(data),
        "errorCode": errorCode,
      };

  bool isSuccess() => status == 1;
  bool isFailed() => status == 0;
  bool isError() => status == -1;
  bool isSpecial() => status > 1;

  Either<Failure, T> getFailure() {
    if (isFailed()) {
      if (errorCode != null) {
        return left(CommonFailure.apiFailureWithErrorCode(errorCode!));
      }
      return left(CommonFailure.apiFailure(message));
    } else {
      return left(const CommonFailure.serverFailure());
    }
  }

  @override
  String toString() =>
      'ApiResponseWrapper(status: $status, message: $message, data: $data, errorCode: $errorCode)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiResponseWrapper<T> &&
        other.status == status &&
        other.message == message &&
        other.errorCode == errorCode &&
        mapEquals(other.data, data);
  }

  @override
  int get hashCode =>
      status.hashCode ^ message.hashCode ^ data.hashCode ^ errorCode.hashCode;
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
