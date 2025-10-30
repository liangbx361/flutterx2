import 'package:flutter/material.dart';

/// 应用自定义 AppBar 组件
///
/// 提供统一的应用顶部导航栏样式，支持自定义标题、操作按钮等。
class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// 标题文本
  final String title;

  /// 标题的文本样式，为 null 时使用主题默认样式
  final TextStyle? titleStyle;

  /// 左侧返回按钮的回调，为 null 时不显示
  final VoidCallback? onLeadingPressed;

  /// 自定义左侧组件，优先级高于 onLeadingPressed
  final Widget? leading;

  /// 右侧操作按钮列表
  final List<Widget>? actions;

  /// AppBar 背景色，为 null 时使用主题默认色
  final Color? backgroundColor;

  /// 底部阴影高度，为 0 时无阴影
  final double elevation;

  /// 是否显示底部分隔线
  final bool showDivider;

  /// 分隔线颜色
  final Color? dividerColor;

  /// AppBar 高度
  final double height;

  /// 内容水平内间距
  final double horizontalPadding;

  /// 内容垂直内间距
  final double verticalPadding;

  const AppAppBar({
    super.key,
    required this.title,
    this.titleStyle,
    this.onLeadingPressed,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.elevation = 1.0,
    this.showDivider = false,
    this.dividerColor,
    this.height = 56,
    this.horizontalPadding = 16,
    this.verticalPadding = 8,
  });

  @override
  Size get preferredSize => Size.fromHeight(height + (showDivider ? 1 : 0));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBackgroundColor = backgroundColor ?? theme.appBarTheme.backgroundColor ?? theme.primaryColor;
    final effectiveTitleStyle = titleStyle ?? theme.textTheme.titleLarge;
    final effectiveDividerColor = dividerColor ?? theme.dividerColor;

    return Material(
      elevation: elevation,
      color: effectiveBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Row(
                  children: [
                    // 左侧组件
                    if (leading != null)
                      leading!
                    else if (onLeadingPressed != null)
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: onLeadingPressed,
                          tooltip: '返回',
                        ),
                      )
                    else
                      const SizedBox(width: 0),

                    // 标题
                    Expanded(
                      child: Center(
                        child: Text(
                          title,
                          style: effectiveTitleStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),

                    // 右侧操作按钮
                    if (actions != null && actions!.isNotEmpty)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: actions!,
                      )
                    else
                      const SizedBox(width: 0),
                  ],
                ),
              ),
            ),
            // 底部分隔线
            if (showDivider)
              Divider(
                height: 1,
                color: effectiveDividerColor,
                thickness: 1,
              ),
          ],
        ),
      ),
    );
  }
}
