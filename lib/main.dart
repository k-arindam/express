import 'package:express/firebase_options.dart';
import 'package:express/src/common/constants/constants.dart';
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

  static void restartApp(BuildContext context) =>
      context.findAncestorStateOfType<_ExpressAppState>()?.restart();
}

class _ExpressAppState extends State<ExpressApp> {
  Key _sessionKey = UniqueKey();

  void restart() => setState(() {
        _sessionKey = UniqueKey();
      });

  final _theme = ThemeData(
    fontFamily: "Tilt_Neon",
    scaffoldBackgroundColor: Constants.kWhite,
  );

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: _sessionKey,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _theme,
        initialBinding: AppBindings(),
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
