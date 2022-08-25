import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../common/error/failure.dart';
import '../dialog_service.dart';
import '../snackbar_service.dart';

// mixin CommonControllerMethodMixin on BaseState {
//   void pagingControllerOnLoad<T>(
//     int page,
//     PagingController<int, T> pagingController,
//     dartz.Either<Failure, List<T>> either, [
//     int limit = 10,
//     String? errorMessage,
//   ]) {
//     either.fold(
//       (l) => pagingController.error = errorMessage ?? this.getErrorMessages(l),
//       (r) {
//         if (this.isClosed) return;
//         final isLastPage = r.length < limit;
//         if (isLastPage) {
//           pagingController.appendLastPage(r);
//         } else {
//           final nextPageKey = page + r.length;
//           pagingController.appendPage(r, nextPageKey);
//         }
//       },
//     );
//   }

//   void pagingControllerRemoveItem<T>(
//     PagingController<int, T> pagingController,
//     int index,
//   ) {
//     final oldList = pagingController.itemList;
//     if (oldList == null) return;
//     final newList = List.of(oldList);
//     newList.removeAt(index);
//     pagingController.itemList = newList;
//   }

//   void pagingControllerUpdateItem<T>(
//     PagingController<int, T> pagingController,
//     int index,
//     T newItem,
//   ) {
//     final oldList = pagingController.itemList;
//     if (oldList == null) return;
//     final newList = List.of(oldList);
//     newList[index] = newItem;
//     pagingController.itemList = newList;
//   }

//   void pagingControllerAddItem<T>(
//     PagingController<int, T> pagingController,
//     T item, [
//     int index = 0,
//   ]) {
//     final oldList = pagingController.itemList;
//     if (oldList == null) return;
//     final newList = List.of(oldList);
//     newList.insert(index, item);
//     pagingController.itemList = newList;
//   }

//   void showLoading([String label = "Vui lòng đợi"]) {
//     DialogService.showLoading();
//   }

//   void closeLoading() {
//     DialogService.closeLoading();
//   }

//   Future<void> showSuccessMessage([
//     String msgText = "Thành công",
//     int delayTimeInMiliseconds = 500,
//     SnackBarPosition position = SnackBarPosition.top,
//   ]) async {
//     await _delay(delayTimeInMiliseconds);
//     SnackBarService.showSuccess(msgText, position: position);
//   }

//   void showInfoMessage([
//     String msgText = "Thông tin",
//     int delayTimeInMiliseconds = 500,
//     SnackBarPosition position = SnackBarPosition.top,
//   ]) {
//     SnackBarService.showInfo(msgText, position: position);
//   }

//   Future<void> showBanner(
//     String msgText, {
//     bool isWarning = false,
//     bool autoClose = true,
//   }) async {
//     if (isWarning) {
//       MaterialBannerService.showWarningBanner(message: msgText);
//     } else
//       MaterialBannerService.showBanner([], msgText);
//     if (autoClose) {
//       await Future.delayed(Duration(seconds: 5));
//       MaterialBannerService.hideBanner();
//     }
//   }

//   void showErrorMessage(
//     Failure failure, [
//     Duration duration = const Duration(seconds: 3),
//     SnackBarPosition position = SnackBarPosition.top,
//   ]) async {
//     SnackBarService.showError(getErrorMessages(failure),
//         duration: duration, position: position);
//   }

//   void showErrorMessageStr(
//     String message, [
//     int delayTimeInMiliseconds = 500,
//     SnackBarPosition position = SnackBarPosition.bottom,
//   ]) {
//     SnackBarService.showError(
//       message,
//       position: position,
//     );
//   }

//   String getErrorMessages(Failure failure) {
//     String msgText = "Có lỗi xảy ra. Vui lòng thử lại sau";
//     if (failure is ApiFailure) msgText = failure.message;
//     if (failure is ServerValidationFailure) {
//       msgText = failure.e.body.getMessageAsString();
//     } else if (failure is NoInternetFailure)
//       msgText = "Tải dữ liệu không thành công, hãy kiểm tra lại kết nối mạng";
//     else if (failure is TimeoutFailure)
//       msgText = "Thời gian tải quá lâu, vui lòng thử lại";
//     return msgText;
//     //SnackBarService.showError(msgText);
//   }

//   Future<void> _delay([int durationInMilliseconds = 500]) async =>
//       await Future.delayed(Duration(milliseconds: durationInMilliseconds));

//   void excuteFutureResponse(VoidCallback callback) {
//     if (!this.isClosed) callback();
//   }
// }

mixin CommonStateMethodMixin<T extends StatefulWidget> on State<T> {
  void pagingControllerOnLoad<T>(
    int page,
    PagingController<int, T> pagingController,
    dartz.Either<Failure, List<T>> either, [
    int limit = 10,
    String? errorMessage,
  ]) {
    either.fold(
      (l) => pagingController.error = errorMessage ?? this.getErrorMessages(l),
      (r) {
        print(r.first);
        final isLastPage = r.length < limit;
        if (isLastPage) {
          pagingController.appendLastPage(r);
        } else {
          final nextPageKey = page + r.length;
          pagingController.appendPage(r, nextPageKey);
        }
      },
    );
  }

  void pagingControllerRemoveItem<T>(
    PagingController<int, T> pagingController,
    int index,
  ) {
    final oldList = pagingController.itemList;
    if (oldList == null) return;
    final newList = List.of(oldList);
    newList.removeAt(index);
    pagingController.itemList = newList;
  }

  void showLoading([String label = "Vui lòng đợi"]) {
    DialogService.showLoading();
  }

  void closeLoading() {
    DialogService.closeLoading();
  }

  Future<void> showSuccessMessage([
    String msgText = "Thành công",
    int delayTimeInMiliseconds = 500,
  ]) async {
    await _delay(delayTimeInMiliseconds);
    SnackBarService.showSuccess(msgText);
  }

  void showInfoMessage([
    String msgText = "Thông tin",
    int delayTimeInMiliseconds = 500,
  ]) {
    SnackBarService.showInfo(msgText, position: SnackBarPosition.top);
  }

  void showErrorMessage(Failure failure) async {
    SnackBarService.showError(getErrorMessages(failure),
        position: SnackBarPosition.top);
  }

  void showErrorMessageStr(
    String message, [
    int delayTimeInMiliseconds = 500,
  ]) {
    SnackBarService.showError(message);
  }

  String getErrorMessages(Failure failure) {
    String msgText = "Có lỗi xảy ra. Vui lòng thử lại sau";
    if (failure is ApiFailure) msgText = failure.message;
    if (failure is ServerValidationFailure) {
      msgText = failure.e.body.getMessageAsString();
    } else if (failure is NoInternetFailure)
      msgText = "Tải dữ liệu không thành công, hãy kiểm tra lại kết nối mạng";
    else if (failure is TimeoutFailure)
      msgText = "Thời gian tải quá lâu, vui lòng thử lại";
    return msgText;
    //SnackBarService.showError(msgText);
  }

  Future<void> _delay([int durationInMilliseconds = 500]) async =>
      await Future.delayed(Duration(milliseconds: durationInMilliseconds));
}
