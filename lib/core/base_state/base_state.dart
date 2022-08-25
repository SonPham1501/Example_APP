import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

import '../../injection.dart';
import 'base_bloc.dart';
import 'mixins.dart';

abstract class BaseState<T extends StatefulWidget, B extends BaseBloc>
    extends State<T> with BaseCommonMethodMixin {
  final compositeSubscription = CompositeSubscription();
  final B _scope;
  B get controller => _scope;
  // final refreshController = RefreshController();
  bool get isClosed => !mounted;
  bool get autoDisposed => true;

  BaseState([B? controller]) : _scope = controller ?? getIt.get<B>();

  @override
  void initState() {
    _scope.errorNetworkStream.listen((error) {
      _scope.loadingBehavior.sink.add(false);
    }).addTo(compositeSubscription);
    _scope.onInit();
    super.initState();
  }

  @override
  void dispose() {
    if (autoDisposed) {
      _scope.dispose();
    }
    compositeSubscription.dispose();
    super.dispose();
  }
}
