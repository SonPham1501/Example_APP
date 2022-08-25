import 'dart:io';
import 'package:rxdart/rxdart.dart' as RxDart;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../injection.dart';
import '../../../base_state/base_bloc.dart';
import '../../../common/models/common_filter_list_item/common_filter_list_item.dart';
import '../../../config/palette.dart';
import '../../../widgets/controls/app_search_input_field_widget.dart';
import '../../../widgets/layouts/custom_list_view_widget.dart';
import '../../helpers/key_generator.dart';
import '../services.dart';
import 'modals/bottom_sheet_actions_modal.dart';
import 'modals/bottom_sheet_filter_modal.dart';

part 'action_sheet_service.model.dart';

part 'action_sheet_service.widget.dart';

class ActionSheetService {
  static Future<T?> showBottomSheet<T>(
    BuildContext context, {
    required Widget Function(BuildContext) builder,
    bool expand = false,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
    ShapeBorder? shape,
  }) async {
    return await showMaterialModalBottomSheet(
      clipBehavior: shape != null ? Clip.hardEdge : Clip.none,
      expand: expand,
      context: appRouter.context ?? context,
      builder: builder,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor,
      shape: shape,
    );
  }

  // static Future<T?> showBottomSheetUserInfo<T>({
  //   required BuildContext context,
  //   required int userId,
  // }) async {
  //   return await showMaterialModalBottomSheet(
  //     clipBehavior: Clip.none,
  //     expand: false,
  //     context: appRouter.context ?? context,
  //     builder: (c) {
  //       return BottomSheetUserInfoWidget(
  //         userId: userId,
  //         onTapFollow: (int id) {},
  //         onTapReport: (int it) {},
  //       );
  //     },
  //     isDismissible: true,
  //     enableDrag: true,
  //     backgroundColor: Colors.transparent,
  //   );
  // }

  static Future<void> showConfirm<T>(
    BuildContext context,
    String title, {
    String? content,
    String okText = "Đồng ý",
    String cancelText = "Hủy",
    bool isCentered = false,
    bool? isIOS,
    VoidCallback? onOk,
    bool isDanger = false,
    String? icon,
    bool isFloating = true,
  }) async {
    ActionSheetService.showFloatingBottomSheet(
      appRouter.context ?? context,
      widgetBuilder: (context) => BottomSheetActionModal(
        isConfirm: true,
        title: title,
        description: content,
        showIcon: icon != null,
        icon: icon,
      ),
      okText: okText,
      cancelText: cancelText,
      screenPadding: isFloating ? 16 : 0,
      okButtonBackground: isDanger ? AppColors.red : AppColors.primaryDark,
      alignment:
          icon != null ? CrossAxisAlignment.center : CrossAxisAlignment.start,
    ).then((value) {
      if (value == true) {
        if (onOk != null) {
          onOk();
        }
      }
    });
  }

  static Future<void> showActions(
    BuildContext context, {
    String? title,
    String? message,
    bool showCancelAction = false,
    required List<ActionSheetItemModel> actions,
  }) async {
    final _action = await showMaterialModalBottomSheet<String>(
      expand: false,
      context: appRouter.context ?? context,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      builder: (context) => AppActionSheetWidget(
        ActionSheetDataModel(
          title: title,
          message: message,
          actions: actions,
          showCancelAction: showCancelAction,
        ),
      ),
    );

    if (_action != null) {
      final itemClicked = actions.where((x) => x.actionId == _action).first;
      if (itemClicked.onClick != null) {
        if (itemClicked.isDangerAction) {
          await DialogService.showAlertDialog(
            context,
            itemClicked.warningLabel!,
            onPressOK: () {
              itemClicked.onClick!();
            },
          );
        } else
          itemClicked.onClick!();
      }
    }
  }

  static Future<T?> showBottomSheetWithController<C extends BaseBloc, T>(
    BuildContext context, {
    required Widget Function(BuildContext context) builder,
    C? controller,
    bool expand = false,
    String? tag,
  }) async {
    if (controller != null) {
      if (getIt.isRegistered<C>(instanceName: tag)) {
        getIt.unregister<C>(instanceName: tag);
      }

      getIt.registerLazySingleton<C>(() => controller, instanceName: tag);
    }

    return await showMaterialModalBottomSheet<T>(
      expand: expand,
      context: appRouter.context ?? context,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      builder: builder,
    ).whenComplete(
      () async {
        await Future.delayed(const Duration(milliseconds: 500));
        if (getIt.isRegistered<C>(instanceName: tag)) {
          getIt.unregister<C>(instanceName: tag);
        }
      },
    );
  }

  static Future<dynamic> showFilters(
    BuildContext context, {
    required String title,
    String? description,
    bool isRadio = false,
    required VoidCallback onSubmit,
    required List<ActionSheetFilterItemModel> arguments,
    List<dynamic>? selections,
    bool closeOnClear = false,
    bool closeOnSelect = false,
    required VoidCallback onClear,
  }) async {
    assert(selections == null || selections.length == arguments.length,
        'selections phai bang so arguments');
    return await showFloatingNavigationBottomSheet(
      appRouter.context ?? context,
      widgetBuilder: (context) => BottomSheetFilterModalWidget(
        title: title,
        isRadio: isRadio,
        onSubmit: () {
          if (!closeOnSelect) {
            Navigator.of(context).pop();
          }

          onSubmit();
        },
        description: description,
        arguments: arguments,
        selections: selections,
        onClear: onClear,
        closeOnClear: closeOnClear,
        closeOnSelect: closeOnSelect,
        onClose: () => Navigator.of(context).pop(),
      ),
      screenPadding: 8,
      maxHeight: 232 -
          (closeOnSelect ? 80 : 0) +
          (arguments.length - 1) +
          arguments.length * 60,
    );
  }

  static Future<dynamic> showFloatingBottomSheet(
    BuildContext context, {
    required WidgetBuilder widgetBuilder,
    String? cancelText,
    String? okText,
    Color? okButtonBackground,
    CrossAxisAlignment? alignment,
    double screenPadding = 24,
  }) async {
    final okButton = SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          side: BorderSide(
            color: okButtonBackground ?? Palette.primaryColor,
            width: 1,
          ),
          backgroundColor: okButtonBackground ?? Palette.primaryColor,
        ),
        child: Text(
          okText ?? 'Ok',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop(true);
        },
      ),
    );
    final cancelButton = SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          side: BorderSide(
            color: Color(0xffF4F4F4),
            width: 1,
          ),
          backgroundColor: Color(0xffF4F4F4),
        ),
        child: Text(
          cancelText ?? 'Cancel',
          style: const TextStyle(
            color: Palette.textBlack,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop(false);
        },
      ),
    );

    return await showCustomModalBottomSheet(
      context: appRouter.context ?? context,
      builder: widgetBuilder,
      containerWidget: (_, animation, child) => FloatingModal(
        screenPadding: screenPadding,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: alignment ?? CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              child,
              if (okText != null) ...[
                const SizedBox(
                  height: 24,
                ),
                okButton,
              ],
              if (cancelText != null) ...[
                const SizedBox(
                  height: 16,
                ),
                cancelButton,
              ]
            ],
          ),
        ),
      ),
      expand: false,
      bounce: true,
      useRootNavigator: true,
    );
  }

  static Future<dynamic> showFloatingNavigationBottomSheet(
    BuildContext context, {
    required WidgetBuilder widgetBuilder,
    double screenPadding = 24,
    double? maxHeight,
  }) async {
    return await showCustomModalBottomSheet(
      context: appRouter.context ?? context,
      builder: widgetBuilder,
      containerWidget: (_, animation, child) => FloatingScrollableModal(
        maxHeight: maxHeight,
        screenPadding: screenPadding,
        widgetBuilder: (ctx) => Navigator(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) => child,
            );
          },
        ),
      ),
      expand: true,
      bounce: true,
      useRootNavigator: true,
    );
  }

  static Future<dynamic> showAsyncList<T>(
    BuildContext context, {
    required String title,
    required Future<List<CommonFilterListItemGeneric<T>>> Function(
            int, int, String?)
        getItemsAsync,
    ScrollController? scrollController,
    T? selectedId,
  }) async {
    return await showMaterialModalBottomSheet(
      context: appRouter.context ?? context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (ctx) => AsyncListBottomSheetWidget(
        title: title,
        getItems: getItemsAsync,
        selectedId: selectedId,
        scrollController: scrollController,
      ),
    );
  }
}
