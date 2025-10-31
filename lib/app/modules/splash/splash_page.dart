import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutterx2/app/components/app_page_scaffold.dart';
import 'package:flutterx2/app/modules/splash/splash_controller.dart';
import 'package:flutterx2/app/values/locale_keys.g.dart';
import 'package:flutterx2/app/core/components/responsive/responsive.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(splashControllerProvider);

    return AppPageScaffold(
      loadState: controller.state,
      loading: _buildBody(context, ref, controller),
      body: _buildBody(context, ref, controller),
    );
  }

  /// 构建闪屏页内容
  Widget _buildBody(BuildContext context, WidgetRef ref, dynamic controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // App Logo
          Container(
            width: context.responsiveValue(
              mobile: 100.0,
              tablet: 120.0,
              desktop: 140.0,
            ),
            height: context.responsiveValue(
              mobile: 100.0,
              tablet: 120.0,
              desktop: 140.0,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: ResponsiveRadius.all(context, 20),
            ),
            child: Icon(
              Icons.child_care,
              size: ResponsiveIconSize.xl(context),
              color: Colors.white,
            ),
          ),

          ResponsiveSpacing.verticalSpace(context, 40),

          // App Name
          Text(
            LocaleKeys.app_title.tr(),
            style: ResponsiveTextStyles.displayMedium(context).copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),

          ResponsiveSpacing.vSpaceXS,

          // App Slogan
          Text(
            LocaleKeys.app_slogan.tr(),
            style: ResponsiveTextStyles.bodyLarge(context).copyWith(
              color: Colors.grey[600],
            ),
          ),

          ResponsiveSpacing.verticalSpace(context, 60),

          // Loading Indicator
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).primaryColor,
            ),
          ),

          ResponsiveSpacing.vSpaceMD,

          // Loading Text
          Text(
            controller.currentTask ?? LocaleKeys.common_initializing.tr(),
            style: ResponsiveTextStyles.bodyMedium(context).copyWith(
              color: Colors.grey[600],
            ),
          ),

          // Error Retry Button (if needed)
          if (controller.hasError) ...[
            ResponsiveSpacing.vSpaceMD,
            ElevatedButton(
              onPressed: () {
                ref.read(splashControllerProvider.notifier).retry();
              },
              child: Text(LocaleKeys.common_retry.tr()),
            ),
          ],
        ],
      ),
    );
  }
}
