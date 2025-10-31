import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutterx2/app/app_localization.dart';
import 'package:flutterx2/app/values/locale_keys.g.dart';
import 'package:flutterx2/app/core/components/responsive/responsive.dart';

/// 语言设置页面
class LanguageSettingsPage extends ConsumerWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = context.locale;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.common_language.tr()),
      ),
      body: ResponsiveCenterContainer(
        maxWidth: 600,
        child: ListView.builder(
          padding: ResponsiveSpacing.vertical(context, 8),
          itemCount: AppLocalization.supportedLocales.length,
          itemBuilder: (context, index) {
            final locale = AppLocalization.supportedLocales[index];
            final languageName = AppLocalization.getLanguageName(locale);
            final isSelected = currentLocale == locale;

            return ListTile(
              contentPadding: ResponsiveSpacing.listItemPadding(context),
              leading: Icon(
                Icons.language,
                size: ResponsiveIconSize.md(context),
                color: isSelected ? theme.colorScheme.primary : null,
              ),
              title: Text(
                languageName,
                style: ResponsiveTextStyles.bodyLarge(context).copyWith(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? theme.colorScheme.primary : null,
                ),
              ),
              trailing: isSelected
                  ? Icon(
                      Icons.check_circle,
                      size: ResponsiveIconSize.md(context),
                      color: theme.colorScheme.primary,
                    )
                  : null,
              onTap: () async {
                await context.setLocale(locale);
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
