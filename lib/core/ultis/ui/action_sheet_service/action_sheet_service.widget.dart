part of 'action_sheet_service.dart';

class AppActionSheetWidget extends StatelessWidget {
  final ActionSheetDataModel data;

  const AppActionSheetWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoActionSheetModel(this.data)
        : MaterialActionSheetModal(this.data);
  }
}

class CupertinoActionSheetModel extends StatelessWidget {
  final ActionSheetDataModel data;

  CupertinoActionSheetModel(this.data);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: data.title == null ? null : Text(data.title!),
      message: data.message == null ? null : Text(data.message!),
      actions: List.generate(
        data.actions.length,
        (index) => CupertinoActionSheetAction(
          child: Text(data.actions[index].label),
          onPressed: () async {
            Navigator.of(context).pop(data.actions[index].actionId);
          },
          isDestructiveAction: data.actions[index].isDangerAction,
          isDefaultAction: data.actions[index].isSelected,
        ),
      ),
      cancelButton: data.showCancelAction
          ? CupertinoActionSheetAction(
              child: const Text('Hủy'),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
    );
  }
}

class MaterialActionSheetModal extends StatelessWidget {
  final ActionSheetDataModel data;

  MaterialActionSheetModal(this.data);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              data.actions.length,
              (index) => ListTile(
                title: Text(
                  data.actions[index].label,
                  style: TextStyle(
                    fontSize: 16,
                    color: data.actions[index].isDangerAction
                        ? Palette.fourthColor
                        : AppColors.text900,
                  ),
                ),
                trailing:
                    data.actions[index].isSelected ? Icon(Icons.check) : null,
                selected: data.actions[index].isSelected,
                onTap: () {
                  Navigator.of(context).pop(data.actions[index].actionId);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
--------------------------------------------------
*/

class AppActionSheetFilterWidget extends StatefulWidget {
  final String? title;
  final VoidCallback onSubmit;
  final VoidCallback onClear;
  final List<ActionSheetFilterItemModel> arguments;

  AppActionSheetFilterWidget({
    this.title,
    required this.onSubmit,
    required this.arguments,
    required this.onClear,
  });

  @override
  _AppActionSheetFilterWidgetState createState() =>
      _AppActionSheetFilterWidgetState();
}

class _AppActionSheetFilterWidgetState
    extends State<AppActionSheetFilterWidget> {
  late List<ActionSheetFilterItemModel> _args;

  @override
  void initState() {
    _args = widget.arguments;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // return Material(
    //   child: SafeArea(
    //     top: false,
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Container(
    //           constraints: BoxConstraints(minHeight: 48),
    //           child: Row(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
    //                 child: Text(
    //                   widget.title ?? 'Bộ lọc',
    //                   style: TextStyle(
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.bold,
    //                     color: Palette.neutral_800,
    //                   ),
    //                 ),
    //               ),
    //               InkWell(
    //                 onTap: () {
    //                   setState(
    //                     () {
    //                       for (var i = 0; i < _args.length; i++) {
    //                         _args[i] = _args[i].copyWith(null);
    //                       }
    //                       this.widget.onClear();
    //                     },
    //                   );
    //                 },
    //                 child: Padding(
    //                   padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
    //                   child: Text(
    //                     'Xóa bộ lọc',
    //                     style: TextStyle(
    //                       fontSize: 14,
    //                       fontWeight: FontWeight.normal,
    //                       color: Palette.primaryColor_700,
    //                     ),
    //                   ),
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //         Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: List.generate(
    //             _args.length,
    //             (index) => _args[index].isCheckBox
    //                 ? ItemFilterSwitchWidget(
    //                     initValue: _args[index].value == null
    //                         ? false
    //                         : _args[index].value as bool,
    //                     filterName: _args[index].title,
    //                     onCheckChange: (value) {
    //                       setState(() {
    //                         _args[index] = _args[index].copyWith(value);
    //                       });
    //                       widget.arguments[index].onValueChanged(value);
    //                     },
    //                   )
    //                 : _ItemFilterType(
    //                     filterName: _args[index].title,
    //                     data: _args[index],
    //                     onClick: () async {
    //                       final result =
    //                           await widget.arguments[index].onClick();
    //                       setState(() {
    //                         _args[index] = _args[index].copyWith(result);
    //                       });
    //                       widget.arguments[index].onValueChanged(result);
    //                     }),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.fromLTRB(16.0, 10, 16, 20),
    //           child: AppFlatButtonWidget(
    //             title: 'Xem kết quả',
    //             backgroundColor: Palette.primaryColor_700,
    //             textColor: Colors.white,
    //             fontSize: 16,
    //             fontWeight: FontWeight.bold,
    //             onClick: widget.onSubmit,
    //             //widget.onClickFilter(widget.testFilterArgument),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class FloatingModal extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final double screenPadding;
  final double? maxHeight;
  const FloatingModal({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.screenPadding = 24,
    this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenPadding,
          vertical: screenPadding,
        ),
        child: Material(
          color: backgroundColor,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(35),
          child: child,
        ),
      ),
    );
  }
}

class FloatingScrollableModal extends StatelessWidget {
  final WidgetBuilder widgetBuilder;
  final Color? backgroundColor;
  final double screenPadding;
  final double? maxHeight;
  const FloatingScrollableModal({
    Key? key,
    required this.widgetBuilder,
    this.backgroundColor,
    this.screenPadding = 24,
    this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: LayoutBuilder(builder: (layoutBuilderCtx, size) {
        final double? _calculatedHeight = this.maxHeight == null
            ? null
            : this.maxHeight! + this.screenPadding * 2;
        final double _childSize = _calculatedHeight == null
            ? 0.5
            : (_calculatedHeight / size.maxHeight);

        return DraggableScrollableActuator(
          child: DraggableScrollableSheet(
            initialChildSize: _childSize,
            expand: false,
            maxChildSize: .9,
            minChildSize: _childSize,
            builder:
                (BuildContext sheetContext, ScrollController scrollController) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenPadding,
                  vertical: screenPadding,
                ),
                child: Material(
                  color: backgroundColor,
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(35),
                  child: FloatingScrollController(
                    draggableSheetContext: sheetContext,
                    scrollController: scrollController,
                    child: Builder(
                      builder: widgetBuilder,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

class FloatingScrollController extends InheritedWidget {
  const FloatingScrollController({
    Key? key,
    required this.scrollController,
    required this.draggableSheetContext,
    required Widget child,
  }) : super(key: key, child: child);

  final BuildContext draggableSheetContext;
  final ScrollController scrollController;

  static FloatingScrollController? of(BuildContext context) {
    final FloatingScrollController? result =
        context.dependOnInheritedWidgetOfExactType<FloatingScrollController>();
    //assert(result != null, 'No FrogColor found in context');
    return result;
  }

  @override
  bool updateShouldNotify(FloatingScrollController old) =>
      scrollController != old.scrollController &&
      draggableSheetContext != old.draggableSheetContext;
}

class AsyncListBottomSheetWidget<T> extends StatefulWidget {
  final String title;
  final T? selectedId;
  final ScrollController? scrollController;
  final Future<List<CommonFilterListItemGeneric<T>>> Function(
    int start,
    int limit,
    String? keyword,
  ) getItems;

  AsyncListBottomSheetWidget({
    required this.title,
    required this.getItems,
    this.selectedId,
    this.scrollController,
  });

  @override
  State<AsyncListBottomSheetWidget<T>> createState() =>
      _AsyncListBottomSheetWidgetState<T>();
}

class _AsyncListBottomSheetWidgetState<T>
    extends State<AsyncListBottomSheetWidget<T>> {
  int _start = -1;
  int _limit = 25;
  String? _textSearch;
  T? _selectedId;
  final PagingController<int, CommonFilterListItemGeneric<T>>
      _pagingController = PagingController<int, CommonFilterListItemGeneric<T>>(
    firstPageKey: 0,
  );

  final _searchObs = RxDart.BehaviorSubject<String>();
  Future<void> _onPaging(
    int start,
  ) async {
    final _data = await widget.getItems(start, _limit, _textSearch);
    this._pagingControllerOnLoad(start, _data);
  }

  void _pagingControllerOnLoad(
      int page, List<CommonFilterListItemGeneric<T>> data) {
    if (_start == page) return;
    _start = page;
    final isLastPage = data.length < _limit;
    if (isLastPage) {
      this._pagingController.appendLastPage(data);
    } else {
      final nextPageKey = page + data.length;
      this._pagingController.appendPage(data, nextPageKey);
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedId = widget.selectedId;
    this._pagingController.addPageRequestListener(_onPaging);
    _searchObs.debounceTime(Duration(milliseconds: 500)).switchMap(
      (keyword) async* {
        if (keyword.trim().length == 0) {
          if (this._textSearch?.length == 0) {
            return;
          }
        }
        this._textSearch = keyword.trim();
        _start = -1;
        //_onPaging(0);
        _pagingController.refresh();
      },
    ).listen((data) {});
  }

  @override
  void dispose() {
    super.dispose();
    this._pagingController.dispose();
    this._searchObs.close();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Container(
          height: 65,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
                icon: Icon(
                  CupertinoIcons.chevron_back,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: AppSearchInputFieldwidget(
                    backgroundColor: Palette.input_bg,
                    placeholder: 'Tìm kiếm',
                    onChanged: (value) {
                      _searchObs.add(value);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: CustomListViewSeparated<CommonFilterListItemGeneric<T>>(
            padding: EdgeInsets.zero,
            //shrinkWrap: true,
            scrollController: widget.scrollController,
            controller: _pagingController,
            builder: (context, item, index) {
              final isSelected = _selectedId == item.id;
              String _name = item.name;
              if (item.description != null) {
                _name = "${item.description} $_name";
              }
              return ListTile(
                onTap: () async {
                  Navigator.of(context).pop(item);
                },
                title: Text(
                  _name,
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected ? AppColors.primary : AppColors.text900,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) => Divider(
              height: 1,
              color: Palette.neutral_200,
            ),
          ),
        ),
      ],
    );
  }
}
