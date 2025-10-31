import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutterx2/app/data/enums/env_enum.dart';
import 'package:flutterx2/init.dart';

void main() async {
  // 初始化 easy_localization
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  init(EnvEnum.dev.toString());
}
