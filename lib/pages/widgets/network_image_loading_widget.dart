import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  CachedNetworkImageWidget({
    Key? key,
    required this.imageUrl,
    required this.placeholderHeight,
    required this.placeholderWidth,
    this.imageBuilder,
  }) : super(key: key);
  final String imageUrl;
  final double placeholderHeight;
  final double placeholderWidth;
  final ImageWidgetBuilder? imageBuilder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: placeholderHeight,
      width: placeholderWidth,
      fit: BoxFit.fill,
      alignment: Alignment.center,
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageBuilder: imageBuilder,
    );
  }
}
