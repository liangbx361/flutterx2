/// 响应式组件库
///
/// 提供完整的响应式布局解决方案，包括：
/// - 设备类型判断
/// - 字体大小适配
/// - 间距适配
/// - 圆角适配
/// - 图标大小适配
/// - 响应式布局组件
/// - Riverpod Provider 集成
///
/// 使用示例：
/// ```dart
/// import 'package:flutterx2/app/core/components/responsive/responsive.dart';
///
/// // 使用扩展方法
/// Text('Title', style: TextStyle(fontSize: 16.sp(context)))
/// Container(padding: EdgeInsets.all(16.spacing(context)))
///
/// // 使用预定义样式
/// Text('Title', style: ResponsiveTextStyles.headlineLarge(context))
/// Container(padding: ResponsiveSpacing.cardPadding(context))
///
/// // 使用布局组件
/// ResponsiveLayout(
///   mobile: MobileView(),
///   tablet: TabletView(),
///   desktop: DesktopView(),
/// )
/// ```
library responsive;

// 核心工具
export 'responsive_utils.dart';
export 'responsive_extensions.dart';

// 预定义样式和常量
export 'responsive_text_styles.dart';
export 'responsive_spacing.dart';

// 布局组件
export 'responsive_layout.dart';

// Riverpod Provider
export 'responsive_provider.dart';
