import 'dart:convert';

class ApiException implements Exception {
  final String exceptionCode;
  final String? message;
  ApiException({
    required this.exceptionCode,
    required this.message,
  });

  @override
  String toString() =>
      'ApiException(exceptionCode: $exceptionCode, message: $message)';
}

class NotFoundException implements Exception {}

class ServerException implements Exception {}

class UnAuthorizedException implements Exception {}

class CacheException implements Exception {}

class NetWorkException implements Exception {}

class ServerValidationException implements ServerException {
  final ValidationExceptionBody body;
  ServerValidationException(this.body);
}

class ValidationExceptionBody implements Exception {
  final int? status;
  final String? type;
  final String? title;
  final Map<String, List<dynamic>> errors;

  ValidationExceptionBody({
    required this.status,
    this.type,
    this.title,
    required this.errors,
  });

  List<String> getMessages(List<String> fields) {
    List<String> messages = [];
    if (errors.isEmpty) return messages;
    for (final f in fields) {
      if (errors[f] != null) messages.add(errors[f]?.first);
    }
    return messages;
  }

  String getMessageAsString() {
    String message = '';
    for (final e in errors.values) {
      message += e.join('\n') + '\n';
    }
    return message;
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'type': type,
      'title': title,
      'errors': errors,
    };
  }

  factory ValidationExceptionBody.fromMap(Map<String, dynamic> map) {
    //  if (map == null) return null;

    return ValidationExceptionBody(
      status: map['status'],
      type: map['type'],
      title: map['title'],
      errors: Map<String, List<dynamic>>.from(
        map['errors'],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ValidationExceptionBody.fromJson(String source) =>
      ValidationExceptionBody.fromMap(json.decode(source));
}
