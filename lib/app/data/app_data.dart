class AppData {
  static AppData? _instance;

  static AppData get instance => _instance ??= AppData._internal();

  AppData._internal();

}