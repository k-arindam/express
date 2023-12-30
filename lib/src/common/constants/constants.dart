import 'package:flutter/material.dart';

abstract class Constants {
  static const String kAppName = "express";
  static const String kGeminiKey = "";

  // API Paths
  static const String kBaseUrl = "";

  // Controller Tags
  static const String kAuthController = "express-auth-controller";
  static const String kChatController = "express-chat-controller";

  // Colors
  static const Color kBlack = Color.fromRGBO(21, 21, 23, 1.0);
  static const Color kGrey = Color.fromRGBO(193, 210, 198, 1.0);
  static const Color kWhite = Colors.white;

  static const Color kOrange = Color.fromRGBO(255, 177, 79, 1.0);

  static const Color kDarkGreen = Color.fromRGBO(0, 83, 37, 1.0);
  static const Color kGreen = Color.fromRGBO(33, 161, 41, 1.0);
  static const Color kLightGreen = Color.fromRGBO(90, 177, 90, 1.0);
  static const Color kWhiteGreen = Color.fromRGBO(210, 232, 171, 1.0);
}
