import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutterx2/app/app.dart';
import 'package:flutterx2/app/app_localization.dart';
import 'package:flutterx2/app/data/sources/local/hive_local_source.dart';

import 'app/data/env_config.dart';

void init(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await initEnvConfig(env);
  await initLocalStorage();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      path: AppLocalization.translationPath,
      fallbackLocale: AppLocalization.fallbackLocale,
      child: const App(),
    ),
  );
}

Future<void> initEnvConfig(String env) async {
  await dotenv.load(fileName: ".env");

  EnvConfig.init(
    env: env,
  );
}

/// Initialize local storage (Hive)
Future<void> initLocalStorage() async {
  final localStorage = HiveLocalSource();
  await localStorage.init();
}
