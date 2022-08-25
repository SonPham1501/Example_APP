import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/models/common_filter_list_item/common_filter_list_item.dart';
import '../../../../config/app_text_style.dart';
import '../../../../config/palette.dart';
import '../../../../widgets/app_buttons.dart';
import '../../custom_animated_routes.dart';
import '../action_sheet_service.dart';

class BottomSheetFilterModalWidget extends StatefulWidget {
  final String? title;
  final String? description;
  final VoidCallback onSubmit;
  final VoidCallback onClear;
  final bool isRadio;
  final List<ActionSheetFilterItemModel> arguments;
  final List<dynamic>? selections;
  final VoidCallback onClose;
  final bool closeOnClear;
  final bool closeOnSelect;
  BottomSheetFilterModalWidget({
    this.title,
    this.description,
    required this.onSubmit,
    this.isRadio = false,
    required this.arguments,
    required this.onClear,
    required this.onClose,
    this.selections,
    this.closeOnClear = false,
    this.closeOnSelect = false,
  });

  @override
  State<BottomSheetFilterModalWidget> createState() =>
      BottomSheetFilterModalWidgetState();
}

class BottomSheetFilterModalWidgetState
    extends State<BottomSheetFilterModalWidget> {
  late FloatingScrollController? floatingController;
  late List<dynamic> selections;

  @override
  void initState() {
    super.initState();
    this.selections = widget.selections ??
        List.generate(widget.arguments.length,
            (index) => widget.arguments[index].isCheckBox ? false : null);
  }

  @override
  Widget build(BuildContext context) {
    this.floatingController = FloatingScrollController.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      //  controller: FloatingScrollController.of(context)?.scrollController,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //46
          Container(
            height: 46,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: widget.onClose,
                icon: CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.text300,
                  child: Icon(
                    Icons.close,
                    color: AppColors.text700,
                    size: 15,
                  ),
                ),
              ),
            ),
          ),
          //70
          Container(
            height: 70,
            child: Column(
              children: [
                Text(
                  widget.title ?? 'Bộ lọc',
                  style: AppTextStyle.w700(
                    fontSize: 20,
                    color: AppColors.text900,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  widget.description ?? 'Cuộn để chọn và áp dụng bộ lọc',
                  style: AppTextStyle.w400(
                    color: AppColors.text700,
                  ),
                ),
              ],
            ),
          ),
          ...List.generate(widget.arguments.length, (index) {
            final item = widget.arguments[index];

            return item.isCheckBox
                ? _ItemFilterCheckBoxWidget(
                    height: 60,
                    title: item.title,
                    selected: this.selections[index] ?? false,
                    onChanged: (val) {
                      widget.arguments[index].onValueChanged(val);
                      setState(() {
                        if (widget.isRadio)
                          widget.arguments.asMap().entries.forEach((element) {
                            if (element.value.isCheckBox) {
                              selections[element.key] = false;
                            }
                          });
                        this.selections[index] = val;
                      });
                      if (widget.closeOnSelect) {
                        widget.onClose();
                        widget.onSubmit();
                      }
                    },
                  )
                : _ItemFilterWidget(
                    height: 60,
                    title: item.title,
                    scrollController: floatingController?.scrollController,
                    items: item.items,
                    selectedItem: selections[index]
                        as CommonFilterListItemGeneric<dynamic>?,
                    asyncItems: item.asyncItems,
                    onSelectionChanged: (val) {
                      widget.arguments[index].onValueChanged(val);
                      setState(() {
                        this.selections[index] = val;
                      });
                      if (widget.closeOnSelect) {
                        widget.onClose();
                        widget.onSubmit();
                      }
                    },
                  );
          }),
          if (!widget.closeOnSelect) ...[
            const Divider(
              color: AppColors.text300,
              height: 1,
            ),
            //80
            const SizedBox(
              height: 12,
            ),

            Container(
              height: 80,
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Flexible(
                    child: AppButtons.rounded(
                      label: 'Xóa lọc',
                      backgroundColor: AppColors.text300,
                      onPressed: () {
                        setState(() {
                          this.selections = List.generate(
                              widget.arguments.length, (index) => null);
                        });

                        this.widget.onClear();
                        if (widget.closeOnClear) {
                          this.widget.onClose();
                        }
                      },
                      buttonSize: AppButtonSize.big,
                      borderRadius: 100,
                      textStyle: AppTextStyle.w600(color: AppColors.text900),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: AppButtons.rounded(
                      label: 'Áp dụng',
                      backgroundColor: AppColors.primaryDark,
                      buttonSize: AppButtonSize.big,
                      borderRadius: 100,
                      textStyle: AppTextStyle.w600(
                        color: Colors.white,
                      ),
                      onPressed: this.widget.onSubmit,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ItemFilterWidget extends StatelessWidget {
  final String title;
  final List<CommonFilterListItemGeneric<dynamic>> items;
  final double height;
  final ScrollController? scrollController;
  final ValueChanged<CommonFilterListItemGeneric<dynamic>> onSelectionChanged;
  final CommonFilterListItemGeneric<dynamic>? selectedItem;
  final Future<List<CommonFilterListItemGeneric<dynamic>>> Function(
      int, int, String?)? asyncItems;
  const _ItemFilterWidget({
    Key? key,
    required this.items,
    required this.title,
    this.height = 65,
    this.scrollController,
    required this.onSelectionChanged,
    this.selectedItem,
    this.asyncItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this.onSelecting(context),
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.w700(
                  color: AppColors.text900,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: null,
              child: Row(
                children: [
                  Text(
                    selectedItem?.name ?? 'Tất cả',
                    style: AppTextStyle.w700(
                      color: selectedItem == null
                          ? AppColors.text700
                          : AppColors.primary,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Icon(
                    CupertinoIcons.chevron_forward,
                    size: 16,
                    color: selectedItem == null
                        ? AppColors.text700
                        : AppColors.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onAsyncSelecting(BuildContext context) async {
    if (this.asyncItems != null) {
      ActionSheetService.showAsyncList<dynamic>(
        context,
        title: title,
        getItemsAsync: this.asyncItems!,
        scrollController: scrollController,
      ).then((value) {
        if (value != null) {
          if (value != null) {
            this.onSelectionChanged(value);
          }
          //print(FloatingScrollController.of(context));
          DraggableScrollableActuator.reset(
            FloatingScrollController.of(context)!.draggableSheetContext,
          );
        }
      });
    }
  }

  Future<void> onSelecting(BuildContext context) async {
    if (this.asyncItems != null) {
      onAsyncSelecting(context);
      return;
    }
    Navigator.of(context)
        .push(
      CustomRouteTransition.leftToRight(
        title: 'Chọn $title',
        child: Expanded(
          child: ListView.separated(
            controller: scrollController,
            separatorBuilder: (ctx, index) => Divider(
              height: 1,
              color: AppColors.text300,
            ),
            itemBuilder: (ctx, index) {
              bool isSelected = selectedItem == null
                  ? false
                  : selectedItem?.id == items[index].id;
              return ListTile(
                // trailing:
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
                title: Text(
                  items[index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: isSelected ? AppColors.primary : AppColors.text900,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop(items[index]);
                },
                // tileColor: AppColors.text900,
                // selectedTileColor: AppColors.primary,
                selected: isSelected,
                trailing: isSelected
                    ? Icon(
                        CupertinoIcons.check_mark,
                        color: AppColors.primary,
                      )
                    : null,
                //onTap: ()=>data.onClick(),
              );
            },
            itemCount: items.length,
          ),
        ),
      ),
    )
        .then((value) {
      if (value != null) {
        this.onSelectionChanged(value);
      }
      //print(FloatingScrollController.of(context));
      DraggableScrollableActuator.reset(
        FloatingScrollController.of(context)!.draggableSheetContext,
      );
    });
  }
}

class _ItemFilterCheckBoxWidget extends StatelessWidget {
  final String title;
  final double height;
  final ValueChanged<bool?> onChanged;
  final bool selected;
  const _ItemFilterCheckBoxWidget({
    Key? key,
    required this.title,
    this.height = 65,
    required this.onChanged,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.onChanged(!this.selected),
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.w700(
                  color: AppColors.text900,
                ),
              ),
            ),
            // InkWell(
            //   onTap: () => onChanged(!selected),
            //   child: Container(
            //     width: 24,
            //     height: 24,
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         color: selected ? Palette.semantic_500 : Palette.iconInactive,
            //       ),
            //       shape: BoxShape.circle,
            //       color: selected ? Palette.semantic_500 : Colors.white,
            //     ),
            //     child: Center(
            //       child: Center(
            //         child: selected
            //             ? Icon(
            //                 Icons.check,
            //                 size: 18.0,
            //                 color: Colors.white,
            //               )
            //             : SizedBox.shrink(),
            //       ),
            //     ),
            //   ),
            // ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: selected ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  color: selected ? AppColors.primary : Color(0xffD7D6DB),
                  width: 2,
                ),
              ),
              height: 24,
              width: 24,
              child: Checkbox(
                // splashRadius: 20,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                activeColor: Colors.transparent,
                checkColor: Colors.white,
                value: selected,
                onChanged: this.onChanged,
                side: BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
                shape: CircleBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
