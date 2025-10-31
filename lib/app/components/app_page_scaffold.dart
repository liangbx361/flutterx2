import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutterx2/app/components/app_load_state_widget.dart';
import 'package:flutterx2/app/core/components/loader/load_state.dart';

class AppPageScaffold extends StatelessWidget {
  final PreferredSizeWidget? header;
  final Widget body;
  final Color backgroundColor;
  final LoadStateEnum loadState;
  final IndicatorController? indicatorController;
  final Future<void> Function()? onRefresh;

  final Widget? loading;
  final Widget? noData;
  final Widget? error;
  final Widget? networkError;
  final Widget? unlogin;
  final Function? onRetry;

  const AppPageScaffold({
    super.key,
    this.header,
    required this.body,
    this.backgroundColor = Colors.transparent,
    required this.loadState,
    this.indicatorController,
    this.onRefresh,
    this.loading,
    this.noData,
    this.error,
    this.networkError,
    this.unlogin,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header,
      backgroundColor: backgroundColor,
      body: AppLoadStateWidget(
        loadState: loadState,
        content: onRefresh != null ? wrapRefresh(body) : body,
        loading: loading,
        noData: noData,
        error: error,
        networkError: networkError,
        unlogin: unlogin,
        onRetry: onRetry,
      ),
    );
  }

  Widget wrapRefresh(Widget body) {
    return CustomMaterialIndicator(
      onRefresh: onRefresh!,
      backgroundColor: Colors.white,
      indicatorBuilder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircularProgressIndicator(
            color: Colors.redAccent,
            value: controller.state.isLoading ? null : controller.value.clamp(0.0, 1.0),
          ),
        );
      },
      controller: indicatorController,
      child: body,
    );
  }
}
