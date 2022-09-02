import 'package:flutter/material.dart';
import 'package:test_app/core/config/index.dart';
import '../../../features/test/domain/models/test/quill_content/quill_content.dart';

class QuillContentWidget extends StatelessWidget {
  final List<QuillOperation> operations;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextSpan? prefix;
  QuillContentWidget(
    this.operations, {
    this.fontSize,
    this.color,
    this.fontWeight,
    this.prefix,
  });
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
          // style: TextStyle(),
          // style: DefaultTextStyle.of(context).style,
          children: [
            if (prefix != null) ...[prefix!],
            ...List.generate(
              this.operations.length,
              (index) {
                // var what = ;
                // if (what.content != null) {
                //   if (what.content!.startsWith('Tuan can play')) print(what);
                // }

                // if (what.type == QuillContentTypeEnum.Text) {
                //   if ((what.content ?? '').trim().length == 0)
                //     return WidgetSpan(child: SizedBox.shrink());
                // }
                return _buildSpan(this.operations[index]);
              },
            ),
          ]),
    );
  }

  InlineSpan _buildSpan(QuillOperation operation) {
    return TextSpan(
      text: operation.content,
      style: _getStyle(operation.attributes),
    );

    // operation.type == QuillContentTypeEnum.Text
    //     ? TextSpan(
    //         text: operation.content,
    //         style: _getStyle(operation.attributes),
    //       )
    //     : WidgetSpan(
    //         alignment: PlaceholderAlignment.middle,
    //         child: ClipRect(
    //           child: SingleChildScrollView(
    //             scrollDirection: Axis.horizontal,
    //             //color: Colors.orange,
    //             //width: 300,
    //             child: Math.tex(
    //               operation.content ?? '',
    //               mathStyle: MathStyle.display,
    //               textStyle: TextStyle(
    //                 color: this.color ?? Palette.textBlack,
    //                 fontSize: this.fontSize ?? 14,
    //                 fontWeight: fontWeight,
    //                 overflow: TextOverflow.clip,
    //                 fontFamily: 'Roboto',
    //                 height: 1.5,
    //               ),
    //               onErrorFallback: (e) => SizedBox.shrink(),
    //             ),
    //           ),
    //         ),
    //       );
  }

  TextStyle? _getStyle(Map<String, dynamic>? attributes) {
    if (attributes == null) {
      return TextStyle(
        color: color ?? Palette.textBlack,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight,
        fontFamily: 'Roboto',
        height: 1.5,
      );
    }
    // final Map<String, dynamic> attributes = jsonDecode(attributeString);
    // print(attributes);
    // return null;
    return TextStyle(
      color: color ?? AppColors.text900,
      decoration: attributes.containsKey('underline')
          ? TextDecoration.underline
          : attributes.containsKey('strike')
              ? TextDecoration.lineThrough
              : null,
      fontSize: fontSize ?? 14,
      height: 1.5,
      fontWeight:
          attributes.containsKey('bold') ? FontWeight.w700 : FontWeight.normal,
      fontStyle: attributes.containsKey('italic')
          ? FontStyle.italic
          : FontStyle.normal,
      fontFamily: 'Roboto',
    );
  }
}
