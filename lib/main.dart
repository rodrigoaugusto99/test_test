import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_test/app/app.bottomsheets.dart';
import 'package:test_test/app/app.dialogs.dart';
import 'package:test_test/app/app.locator.dart';
import 'package:test_test/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_test/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.home2View,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
