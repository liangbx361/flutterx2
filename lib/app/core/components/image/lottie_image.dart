import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class LottieImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final AnimationController? animationController;
  final EdgeInsetsGeometry? margin;
  final Function? onPressed;

  const LottieImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit,
    this.margin,
    this.animationController,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (onPressed != null) {
      return GestureDetector(
        onTap: () => onPressed ?? (),
        child: _buildLottieImage(),
      );
    } else {
      return _buildLottieImage();
    }
  }

  Widget _buildLottieImage() {
    return Container(
      margin: margin,
      child: Lottie.asset(
        path,
        width: width,
        height: height,
        fit: fit,
        controller: animationController,
      ),
    );
  }
}
