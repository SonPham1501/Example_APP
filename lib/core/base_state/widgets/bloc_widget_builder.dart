import 'package:flutter/material.dart';
import '../../../injection.dart';
import '../base_bloc.dart';

class BaseBlocBuilder<B extends BaseBloc> extends StatefulWidget {
  final B bloc;
  final Widget Function(BuildContext context, B controller) builder;
  final VoidCallback? onInit;
  final VoidCallback? onClose;
  final String? tag;
  final bool autoDispose;

  /// Sử dụng khi cần sử dụng lặp lại nhiều Bloc
  ///
  /// Giống với [GetX] trong [GetX]
  BaseBlocBuilder({
    required this.bloc,
    this.onInit,
    this.onClose,
    required this.builder,
    this.tag,
    this.autoDispose = true,
  }) {
    if (!getIt.isRegistered<B>(instanceName: tag)) {
      getIt.registerFactory<B>(() => bloc, instanceName: tag);
    }
  }

  @override
  State<BaseBlocBuilder> createState() => _BaseBlocBuilderState<B>(
        builder: builder,
        bloc: bloc,
        onClose: onClose,
        onInit: onInit,
        autoDispose: autoDispose,
      );
}

class _BaseBlocBuilderState<B extends BaseBloc>
    extends State<BaseBlocBuilder<B>> {
  final B bloc;
  final Widget Function(BuildContext context, B controller) builder;
  final VoidCallback? onInit;
  final VoidCallback? onClose;
  final String? tag;
  final bool autoDispose;
  _BaseBlocBuilderState({
    required this.bloc,
    this.onInit,
    this.onClose,
    required this.builder,
    this.tag,
    required this.autoDispose,
  });

  @override
  void initState() {
    if (onInit != null) onInit!();
    bloc.onInit();
    super.initState();
  }

  @override
  void dispose() {
    if (onClose != null) onClose!();
    if (autoDispose) {
      bloc.dispose();
      if (getIt.isRegistered<B>(instanceName: tag)) {
        getIt.unregister<B>(instanceName: tag);
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return builder(context, bloc);
  }
}
