import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterx2/app/core/components/image/local_image.dart';

class NetworkImage extends StatelessWidget {
  final String url;
  final String? placeholderPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final EdgeInsetsGeometry? margin;

  const NetworkImage({
    super.key,
    required this.url,
    this.placeholderPath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return _buildNetworkImage();
  }

  Widget _buildNetworkImage() {
    return Container(
      margin: margin,
      child: CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: fit,
        placeholder: placeholderPath != null
            ? (context, url) => LocalImage(
                  path: placeholderPath!,
                  width: width,
                  height: height,
                  fit: fit,
                )
            : null,
        errorWidget: placeholderPath != null
            ? (context, url, error) => LocalImage(
                  path: placeholderPath!,
                  width: width,
                  height: height,
                  fit: fit,
                )
            : null,
      ),
    );
  }
}
