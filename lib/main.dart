import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'constant/config.dart';
import 'constant/routes_uri.dart';
import 'route/routes.dart';
import 'service/hive_service.dart';

final hiveService = HiveService();

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class SingletonOne {
  SingletonOne._privateConstructor();

  static final SingletonOne _instance = SingletonOne._privateConstructor();

  factory SingletonOne() {
    return _instance;
  }
}

class FileSystemManager {
  static final FileSystemManager _instance = FileSystemManager._internal();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory FileSystemManager() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  FileSystemManager._internal() {
    // initialization logic
  }

  // rest of class as normal, for example:
  void openFile() {}
  void writeFile() {}
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(localData);
  HttpOverrides.global = new MyHttpOverrides();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  static const String _title = "Frame Work";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey.withOpacity(0.3),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: true,
      color: Color(0xFFd756ff),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        platform: TargetPlatform.iOS,
      ),
      routes: Routes.routes,
      initialRoute: SPLASH_SCREEN,
    );
  }
}
