import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:dartz/dartz.dart' as dartz;

import '../common/error/failure.dart';
import '../common/models/api_response/api_list_response_wrapper.dart';
import '../ultis/ui/dialog_service.dart';
import '../ultis/ui/services.dart';

class BaseCommonMethodMixin {
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

  void pagingControllerOnLoadWrap<T>(
    int page,
    PagingController<int, T> pagingController,
    dartz.Either<Failure, ApiListResponseWrapper<T>> either, [
    int limit = 10,
    String? errorMessage,
  ]) {
    either.fold(
      (l) => pagingController.error = errorMessage ?? this.getErrorMessages(l),
      (r) {
        final isLastPage = r.items.length < limit;
        if (isLastPage) {
          pagingController.appendLastPage(r.items);
        } else {
          final nextPageKey = page + r.items.length;
          pagingController.appendPage(r.items, nextPageKey);
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

  void pagingControllerUpdateItem<T>(
    PagingController<int, T> pagingController,
    int index,
    T newItem,
  ) {
    final oldList = pagingController.itemList;
    if (oldList == null) return;
    final newList = List.of(oldList);
    newList[index] = newItem;
    pagingController.itemList = newList;
  }

  void pagingControllerAddItem<T>(
    PagingController<int, T> pagingController,
    T item, [
    int index = 0,
  ]) {
    final oldList = pagingController.itemList;
    if (oldList == null) return;
    final newList = List.of(oldList);
    newList.insert(index, item);
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
    int delayTimeInMiliseconds = 300,
    SnackBarPosition position = SnackBarPosition.top,
  ]) async {
    await _delay(delayTimeInMiliseconds);
    SnackBarService.showSuccess(
      msgText,
      position: SnackBarPosition.top,
    );
  }

  Future<void> showInfoMessage([
    String msgText = "Thông tin",
    int delayTimeInMiliseconds = 300,
    SnackBarPosition position = SnackBarPosition.top,
  ]) async {
    await _delay(delayTimeInMiliseconds);
    SnackBarService.showInfo(msgText, position: position);
  }

  void showErrorMessage(
    Failure failure, {
    SnackBarPosition position = SnackBarPosition.top,
  }) async {
    SnackBarService.showError(getErrorMessages(failure), position: position);
  }

  Future<void> showErrorMessageStr(
    String message, [
    int delayTimeInMiliseconds = 300,
    SnackBarPosition position = SnackBarPosition.top,
  ]) async {
    await _delay(delayTimeInMiliseconds);
    SnackBarService.showError(
      message,
      position: position,
    );
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

  Future<void> showBanner(
    String msgText, {
    bool isWarning = false,
    bool autoClose = true,
  }) async {
    if (isWarning) {
      MaterialBannerService.showWarningBanner(message: msgText);
    } else
      MaterialBannerService.showBanner([], msgText);
    if (autoClose) {
      await Future.delayed(Duration(seconds: 5));
      MaterialBannerService.hideBanner();
    }
  }
}
