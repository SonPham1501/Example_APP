import 'package:flutter/material.dart';

import '../../widgets/layouts/adaptive_loading_widget.dart';
import '../base_bloc.dart';
import 'base_view.dart';

class BaseStreamWidget<S> extends StatelessWidget {
  final Stream<S> stream;
  final S? initalData;
  final Widget? initalWidget;
  final Widget Function(BuildContext context, S data) builder;
  BaseStreamWidget({
    required this.stream,
    required this.builder,
    this.initalData,
    this.initalWidget,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<S>(
      initialData: initalData,
      stream: stream,
      builder: (ctx, AsyncSnapshot<S> snapshot) {
        if ((snapshot.connectionState == ConnectionState.active) ||
            (snapshot.connectionState == ConnectionState.done)) {
          if ((snapshot.hasData) && (snapshot.data != null)) {
            return builder(ctx, snapshot.data!);
          }
          if (snapshot.hasError) {
            return const Text('Something went worng');
          }
        }
        return initalWidget ?? const ApdaptiveLoadingWidget();
      },
    );
  }
}

class RxWidget<B extends BaseBloc> extends StatelessWidget {
  final B? controller;
  final Widget Function(BuildContext context, B controller) builder;
  RxWidget._({
    required this.controller,
    required this.builder,
  });
  factory RxWidget({
    B? controller,
    required Widget Function(BuildContext context, B controller) builder,
  }) {
    return RxWidget._(
      controller: controller,
      builder: builder,
    );
  }
  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      this.controller ?? BaseViewController.of<B>(context).controller,
    );
  }
}
