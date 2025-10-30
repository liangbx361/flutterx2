import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kidflow/app/app.dart';

void init(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await initEnvConfig(env);

  runApp(const App());
}

Future<void> initEnvConfig(String env) async {
  await dotenv.load(fileName: ".env");
}
