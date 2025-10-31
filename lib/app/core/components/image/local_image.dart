import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterx2/app/core/components/image/lottie_image.dart';
import 'package:flutterx2/app/core/components/image/svg_image.dart';

class LocalImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final Color? svgColor;
  final BoxFit fit;
  final Alignment alignment;
  final EdgeInsetsGeometry? margin;
  final AnimationController? animationController;

  const LocalImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.svgColor,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.margin,
    this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    if (path.startsWith("assets/")) {
      if (path.endsWith(".svg")) {
        return SvgImage(
          path: path,
          width: width,
          height: height,
          margin: margin,
          color: svgColor,
        );
      } else if (path.endsWith(".json")) {
        return LottieImage(
          path: path,
          width: width,
          height: height,
          fit: fit,
          margin: margin,
          animationController: animationController,
        );
      } else {
        return Image.asset(
          path,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
        );
      }
    } else {
      return Image.file(
        File(path),
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
      );
    }
  }
}
