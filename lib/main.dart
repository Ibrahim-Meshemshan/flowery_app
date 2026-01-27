import 'package:flowery/core/network/api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'core/dependency_injection/di.dart';
import 'flowery_app.dart';

void main() async {
  // initialize firebase
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // // start crashlytics implementation
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };
  // end crashlytics implementation
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const FloweryApp(),
    ),
  );
}
// search about dart flutter error handler api errors client  server dio exception handle comprehinsive error
// gitHub actions
/*
*/
