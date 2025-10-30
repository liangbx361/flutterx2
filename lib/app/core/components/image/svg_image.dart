import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final Function? onPressed;

  const SvgImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.color,
    this.margin,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (onPressed == null) {
      return buildSvgImage();
    } else {
      return GestureDetector(
        onTap: () => onPressed ?? (),
        child: buildSvgImage(),
      );
    }
  }

  Widget buildSvgImage() {
    return Container(
      margin: margin,
      child: SvgPicture.asset(
        path,
        width: width,
        height: height,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      ),
    );
  }
}
