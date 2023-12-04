import 'package:express/firebase_options.dart';
import 'package:express/src/core/routes/app_routes.dart';
import 'package:express/src/core/services/app_bindings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final orientations = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ];

  SystemChrome.setPreferredOrientations(orientations)
      .then((_) => runApp(const ExpressApp()));
}

class ExpressApp extends StatefulWidget {
  const ExpressApp({super.key});

  @override
  State<ExpressApp> createState() => _ExpressAppState();
}

class _ExpressAppState extends State<ExpressApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
