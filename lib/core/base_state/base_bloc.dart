import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import '../../injection.dart';
import '../common/error/failure.dart';
import 'bloc_state.dart';
import 'mixins.dart';

abstract class IDisposable {
  void dispose();
}

abstract class BaseBloc<T> with BaseCommonMethodMixin implements IDisposable {
  final compositeSubscription = CompositeSubscription();

  // appRouter.arguments == null ? null : appRouter.arguments as T;
  final loadingBehavior = BehaviorSubject<bool>.seeded(false);
  final erbString = BehaviorSubject<String>();
  final successString = BehaviorSubject<String>();
  final BehaviorSubject<T> successData = BehaviorSubject<T>();
  final erbFailure = BehaviorSubject<Failure?>();
  final navigatorBehavior = BehaviorSubject<String>();
  final _state = BehaviorSubject<BlocState>.seeded(const BlocState.init());

  //final localStorage = getIt<LocalStorageImpl>();

  Stream<BlocState> get stateStream => _state.stream;

  BlocState get state => _state.value;

  static T find<T extends Object>() => getIt<T>();

  Stream<bool?> get loadingStream => loadingBehavior.stream;

  Stream<String> get errorNetworkStream => erbString.stream;

  Stream<String> get successStringStream => successString.stream;

  bool get isLoading => loadingBehavior.value;

  bool get isClosed => compositeSubscription.isDisposed;

  void onInit() {}

  void setLoading() {
    this._state.add(BlocState.loading());
  }

  void setSuccess<T>(T data) {
    this._state.add(BlocState.data(data));
  }

  void reset() {
    _state.add(BlocState.init());
  }

  void setError(Failure failure) {
    this._state.add(BlocState.error(failure));
  }

  @override
  @mustCallSuper
  void dispose() {
    loadingBehavior.close();
    navigatorBehavior.close();
    successData.close();
    successString.close();
    //
    _state.close();
    //
    erbString.close();
    erbFailure.close();

    compositeSubscription.dispose();
  }
}

extension FutureExtensions on Failure {
  String get getErrorMessages {
    String msgText = "Có lỗi xảy ra. Vui lòng thử lại sau";
    if (this is ApiFailure) {
      msgText = (this as ApiFailure).message;
    }
    if (this is ServerValidationFailure) {
      msgText = (this as ServerValidationFailure).e.body.getMessageAsString();
    } else if (this is NoInternetFailure) {
      msgText = "Tải dữ liệu không thành công, hãy kiểm tra lại kết nối mạng";
    } else if (this is TimeoutFailure) {
      msgText = "Thời gian tải quá lâu, vui lòng thử lại";
    }
    return msgText;
  }
}
