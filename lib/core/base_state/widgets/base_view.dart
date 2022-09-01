import 'package:flutter/material.dart';
import '../../../injection.dart';
import '../base_bloc.dart';
import '../base_state.dart';

class BaseViewController<B extends BaseBloc> extends InheritedWidget {
  const BaseViewController({
    Key? key,
    required this.controller,
    required Widget child,
  }) : super(key: key, child: child);

  final B controller;

  static BaseViewController<B> of<B extends BaseBloc>(BuildContext context) {
    final BaseViewController<B>? result =
        context.dependOnInheritedWidgetOfExactType<BaseViewController<B>>();
    assert(result != null, 'No BaseViewController found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(BaseViewController oldWidget) =>
      controller != oldWidget.controller;
}

abstract class BaseView<B extends BaseBloc> extends StatefulWidget {
  /// Sử dụng để wrap statfullwidget mà có basestate với bloc
  ///
  /// Giống với [GetView] trong [GetX]
  BaseView({Key? key}) : super(key: key);
  onInit() {}
  onClose() {}
  @override
  State<BaseView> createState() => _BaseViewState<B>(controller);

  Widget build(BuildContext context);

  final B controller = getIt.get<B>();
}

class _BaseViewState<B extends BaseBloc> extends BaseState<BaseView, B> {
  //final Widget Function(BuildContext context) sourceBuilder;
  _BaseViewState(B controller) : super(controller);

  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  void dispose() {
    widget.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseViewController<B>(
      child: widget.build(context),
      controller: controller,
    );
  }
}


// class BaseBlocController<B extends BaseBloc> extends InheritedWidget {
//   const BaseBlocController({
//     Key? key,
//     required this.controller,
//     required Widget child,
//   }) : super(key: key, child: child);

//   final B controller;

//   static BaseBlocController<B> of<B extends BaseBloc>(BuildContext context) {
//     final BaseBlocController<B>? result =
//         context.dependOnInheritedWidgetOfExactType<BaseBlocController<B>>();
//     assert(result != null, 'No FrogColor found in context');
//     return result!;
//   }

//   @override
//   bool updateShouldNotify(BaseBlocController old) =>
//       controller != old.controller;
// }

// class InheritedBaseStreamWidget<B extends BaseBloc> extends StatefulWidget {
//   @override
//   State<InheritedBaseStreamWidget> createState() =>
//       _InheritedBaseStreamWidgetState<B>();
// }

// class _InheritedBaseStreamWidgetState<B extends BaseBloc>
//     extends State<InheritedBaseStreamWidget> {
//   B? controller;

//   @override
//   Widget build(BuildContext context) {
//     controller = BaseBlocController.of<B>(context).controller;
//     return StreamBuilder(
//       builder: (_, snapshot) => sourceBuilder(context, controller),
//     );
//   }
// }
