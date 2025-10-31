#!/bin/bash

# 生成国际化 LocaleKeys 类
# 用法: ./scripts/generate_locale_keys.sh

set -e

echo "🌍 正在生成 LocaleKeys..."

# 进入项目根目录
cd "$(dirname "$0")/.."

# 运行生成命令
flutter pub run easy_localization:generate \
  -S assets/i18n \
  -O lib/app/values \
  -o locale_keys.g.dart \
  -f keys

echo "✅ LocaleKeys 生成完成: lib/app/values/locale_keys.g.dart"
