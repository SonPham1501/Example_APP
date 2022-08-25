// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import 'package:injectable/injectable.dart';
// import 'package:yofun_app/core/common/models/api_response/api_response_wrapper.dart';
// import 'package:yofun_app/core/config/constants/api_path.dart';
// import 'package:yofun_app/core/ultis/helpers/logger.dart';
// import 'package:yofun_app/core/ultis/helpers/media_ultis.dart';
// import 'package:yofun_app/core/upload/index.dart';
// import 'package:yofun_app/injection.dart';
// import '../../common/error/exceptions.dart';
// import '../../common/services/auth/auth_controller.dart';
// import '../ui/services.dart';

// const int TIMEOUT = 15;

// @lazySingleton
// class AuthHttpClient extends http.BaseClient {
//   final http.Client client;
//   AuthHttpClient({required this.client});
//   @override
//   Future<http.StreamedResponse> send(http.BaseRequest request) async {
//     String? _accessToken = getIt<AuthController>().accessToken;
//     if (_accessToken != null) {
//       request.headers.addAll({'Authorization': 'Bearer $_accessToken'});
//       return client.send(request);
//     } else
//       return client.send(request);
//   }

//   Future<dynamic> getRequest({
//     required String url,
//     bool withCredential = true,
//     Map<String, String>? defaultHeaders,
//   }) async {
//     try {
//       if (defaultHeaders == null)
//         defaultHeaders = {'content-type': 'application/json'};

//       if (withCredential) {
//         http.Response response = await this
//             .get(Uri.parse(url), headers: defaultHeaders)
//             .timeout(const Duration(seconds: TIMEOUT));
//         if (response.statusCode == 403) {
//           if (await _requestNewToken()) {
//             response = await this
//                 .get(Uri.parse(url), headers: defaultHeaders)
//                 .timeout(const Duration(seconds: TIMEOUT));
//           }
//         }
//         return _response(response);
//       } else {
//         final http.Response response = await this
//             .client
//             .get(Uri.parse(url), headers: defaultHeaders)
//             .timeout(const Duration(seconds: TIMEOUT));
//         return _response(response);
//       }
//     } on TimeoutException {
//       _onTimeOut();
//       rethrow;
//     }
//   }

//   Future<dynamic> postRequest({
//     required String url,
//     Map<String, dynamic>? data,
//     bool withCredential = true,
//     Map<String, String>? defaultHeaders,
//   }) async {
//     try {
//       if (defaultHeaders == null)
//         defaultHeaders = {'content-type': 'application/json'};

//       if (withCredential) {
//         http.Response response = await this
//             .post(
//               Uri.parse(url),
//               headers: defaultHeaders,
//               body: data != null ? jsonEncode(data) : null,
//             )
//             .timeout(const Duration(seconds: TIMEOUT));
//         if (response.statusCode == 403) {
//           if (await _requestNewToken()) {
//             response = await this
//                 .post(
//                   Uri.parse(url),
//                   headers: defaultHeaders,
//                   body: data != null ? jsonEncode(data) : null,
//                 )
//                 .timeout(const Duration(seconds: TIMEOUT));
//           }
//         }
//         return _response(response);
//       } else {
//         final http.Response response = await this
//             .client
//             .post(
//               Uri.parse(url),
//               headers: defaultHeaders,
//               body: data != null ? jsonEncode(data) : null,
//             )
//             .timeout(const Duration(seconds: TIMEOUT));

//         return _response(response);
//       }
//     } on TimeoutException {
//       _onTimeOut();
//       rethrow;
//     } catch (e) {
//       Xlogger.d(e);
//       rethrow;
//     }
//   }

//   Future<dynamic> deleteRequest({
//     required String url,
//     Map<String, dynamic>? data,
//     bool withCredential = true,
//     Map<String, String>? defaultHeaders,
//   }) async {
//     try {
//       if (defaultHeaders == null)
//         defaultHeaders = {'content-type': 'application/json'};

//       if (withCredential) {
//         http.Response response = await this
//             .delete(
//               Uri.parse(url),
//               headers: defaultHeaders,
//               body: data != null ? jsonEncode(data) : null,
//             )
//             .timeout(const Duration(seconds: TIMEOUT));
//         if (response.statusCode == 403) {
//           if (await _requestNewToken()) {
//             response = await this
//                 .delete(
//                   Uri.parse(url),
//                   headers: defaultHeaders,
//                   body: data != null ? jsonEncode(data) : null,
//                 )
//                 .timeout(const Duration(seconds: TIMEOUT));
//           }
//         }
//         return _response(response);
//       } else {
//         final http.Response response = await this
//             .client
//             .delete(
//               Uri.parse(url),
//               headers: defaultHeaders,
//               body: data != null ? jsonEncode(data) : null,
//             )
//             .timeout(const Duration(seconds: TIMEOUT));
//         return _response(response);
//       }
//     } on TimeoutException {
//       _onTimeOut();
//       rethrow;
//     } catch (e) {
//       Xlogger.d(e);
//       rethrow;
//     }
//   }

//   Future<dynamic> putRequest({
//     required String url,
//     required Map<String, dynamic> data,
//     bool withCredential = true,
//     Map<String, String>? defaultHeaders,
//   }) async {
//     try {
//       if (defaultHeaders == null)
//         defaultHeaders = {'content-type': 'application/json'};

//       if (withCredential) {
//         http.Response response = await this
//             .put(
//               Uri.parse(url),
//               headers: defaultHeaders,
//               body: jsonEncode(data),
//             )
//             .timeout(const Duration(seconds: TIMEOUT));
//         if (response.statusCode == 403) {
//           if (await _requestNewToken()) {
//             response = await this
//                 .put(
//                   Uri.parse(url),
//                   headers: defaultHeaders,
//                   body: jsonEncode(data),
//                 )
//                 .timeout(const Duration(seconds: TIMEOUT));
//           }
//         }
//         return _response(response);
//       } else {
//         final http.Response response = await this
//             .client
//             .put(
//               Uri.parse(url),
//               headers: defaultHeaders,
//               body: jsonEncode(data),
//             )
//             .timeout(const Duration(seconds: TIMEOUT));
//         return _response(response);
//       }
//     } on TimeoutException {
//       _onTimeOut();
//       rethrow;
//     }
//   }

//   Future<dynamic> multipartRequest({
//     List<String>? filePaths,
//     required url,
//     required Map<String, String> fields,
//     bool isRetried = false,
//   }) async {
//     try {
//       var request = http.MultipartRequest('POST', Uri.parse(url))
//         ..fields.addAll(fields);

//       if (filePaths != null) {
//         for (var filePath in filePaths) {
//           final _file = await http.MultipartFile.fromPath(
//             "file", filePath,
//             contentType: MediaType.parse(MediaUltis.getContentType(filePath)),
//             //filename: filePath.split("/").last,
//           );
//           request.files.add(_file);
//         }
//       }

//       final http.StreamedResponse response =
//           await this.send(request).timeout(const Duration(seconds: 15));
//       var responseData = await response.stream.toBytes();
//       var responseString = Utf8Decoder().convert(responseData);
//       // print(response.statusCode);
//       // print(response.reasonPhrase);
//       // print(json.decode(responseString));
//       if (response.statusCode == 200) {
//         return json.decode(responseString);
//       } else if ((response.statusCode == 403) && (!isRetried)) {
//         if (await _requestNewToken()) {
//           return await this.multipartRequest(
//             filePaths: filePaths,
//             url: url,
//             fields: fields,
//             isRetried: true,
//           );
//         }
//       } else if (response.statusCode == 400) {
//         throw FileUploadServerException(responseString);
//       } else if (response.statusCode == 413) {
//         throw FileUploadServerException(
//             "File quá nặng, hãy chọn một file khác");
//       } else
//         throw ServerException();
//     } on TimeoutException {
//       _onTimeOut();
//       rethrow;
//     }
//   }

//   // Future<dynamic> multipartRequest({
//   //   required List<String> filePaths,
//   //   required url,
//   //   String field = "photo",
//   //   bool isRetried = false,
//   // }) async {
//   //   try {
//   //     var request = http.MultipartRequest('POST', Uri.parse(url));

//   //     for (var filePath in filePaths) {
//   //       final _file = await http.MultipartFile.fromPath(
//   //         field, filePath,
//   //         contentType:
//   //             MediaType.parse(ImageProcessor.getContentType(filePath)!),
//   //         //filename: filePath.split("/").last,
//   //       );
//   //       request.files.add(_file);
//   //     }
//   //     final http.StreamedResponse response =
//   //         await this.send(request).timeout(const Duration(seconds: 15));
//   //     var responseData = await response.stream.toBytes();
//   //     var responseString = Utf8Decoder().convert(responseData);
//   //     if (response.statusCode == 200) {
//   //       return json.decode(responseString);
//   //     } else if ((response.statusCode == 403) && (!isRetried)) {
//   //       if (await _requestNewToken()) {
//   //         return await this.multipartRequest(
//   //           filePaths: filePaths,
//   //           url: url,
//   //           field: field,
//   //           isRetried: true,
//   //         );
//   //       }
//   //     } else if (response.statusCode == 400) {
//   //       throw InvalidFileUploadException(responseString);
//   //     } else if (response.statusCode == 413) {
//   //       throw InvalidFileUploadException(
//   //           "File quá nặng, hãy chọn một file khác");
//   //     } else
//   //       throw ServerException();
//   //   } on TimeoutException {
//   //     _onTimeOut();
//   //     rethrow;
//   //   }
//   // }

//   Future<Map<String, dynamic>> _response(http.Response response) async {
//     // print(response.request?.url);
//     // // print(response.request?.);
//     // print(response.statusCode);
//     // print(response.body);

//     if (response.statusCode != 200) {
//       print('HTTP Request Failed with status code: ${response.statusCode}');
//       print(response.request?.url);
//       print(response.reasonPhrase);
//       print(response.body);
//       Xlogger.d(response);
//     }
//     switch (response.statusCode) {
//       case 200:
//         var responseJson = json.decode(response.body.toString());
//         return responseJson;
//       case 400:
//         throw ServerValidationException(
//             ValidationExceptionBody.fromJson(response.body));
//       case 401:
//       case 403:
//         SnackBarService.showError(
//             'Phiên đăng nhập đã kết thúc, bạn cần đăng nhập lại');
//         //TODO: signout
//         //Get.find<AuthController>().signOut();
//         throw UnAuthorizedException();
//       case 500:

//       default:
//         throw ServerException();
//     }
//   }

//   _onTimeOut() {
//     //print('request is to long');
//   }

//   Future<Map<String, dynamic>?> refreshToken(String refreshToken) async {
//     try {
//       var defaultHeaders = {'content-type': 'application/json'};
//       var data = {'refreshToken': refreshToken};
//       final http.Response response = await this
//           .client
//           .post(
//             Uri.parse(Api.REFRESH_TOKEN),
//             headers: defaultHeaders,
//             body: jsonEncode(data),
//           )
//           .timeout(const Duration(seconds: TIMEOUT));
//       if (response.statusCode == 200) {
//         var responseJson = json.decode(response.body.toString());
//         var res = ApiResponseWrapper.fromJson(responseJson);
//         if (res.status == 1) {
//           return res.data;
//         }
//         return null;
//       }
//       return null;
//     } catch (e) {
//       Xlogger.d(e);

//       return null;
//     }
//   }

//   Future<bool> _requestNewToken() async {
//     //TODO: handle refresh token
//     return false;
//     // if (Get.isRegistered<AuthController>()) {
//     //   final _auth = Get.find<AuthController>();
//     //   return await _auth.refreshToken();
//     // } else
//     //   return false;
//   }
// }
