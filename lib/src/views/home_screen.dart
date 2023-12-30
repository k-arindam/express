import 'package:expandable_deck/expandable_deck.dart';
import 'package:express/src/common/constants/constants.dart';
import 'package:express/src/core/controllers/auth_controller.dart';
import 'package:express/src/views/auth/login_screen.dart';
import 'package:express/src/views/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _authController =
      Get.find<AuthController>(tag: Constants.kAuthController);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => !_authController.isLoggedIn
          ? const DashboardScreen()
          : const LoginScreen(),
    );
  }
}
