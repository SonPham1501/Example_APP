import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImagekWidget extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final Widget? errorWidget;

  final Widget Function(
    BuildContext context,
    ImageProvider imageProvider,
  )? imageBuilder;
  final Widget Function(
    BuildContext context,
    String url,
  )? placeholder;

  const CachedNetworkImagekWidget({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.fitWidth,
    this.width,
    this.imageBuilder,
    this.placeholder,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      errorWidget: (context, url, error) =>
          errorWidget ?? const Icon(Icons.error),
      imageBuilder: imageBuilder,
      placeholder: placeholder ?? (_, url) => const Icon(Icons.image),
    );
  }
}
