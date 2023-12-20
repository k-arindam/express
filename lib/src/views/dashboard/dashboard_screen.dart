import 'package:expandable_deck/expandable_deck.dart';
import 'package:express/src/common/constants/constants.dart';
import 'package:express/src/common/widgets/circle_icon_button.dart';
import 'package:express/src/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Center(
          child: Container(
            height: 48.0,
            width: 48.0,
            margin: const EdgeInsets.only(left: 8.0),
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Constants.kWhiteGreen,
              shape: BoxShape.circle,
            ),
            child: const Text("A"),
          ),
        ),
        actions: [
          CircleIconButton(
            icon: Icons.notifications_rounded,
            onTap: () {},
          ),
          CircleIconButton(
            icon: Icons.forum_rounded,
            onTap: () => Get.toNamed(AppRoutes.chat),
          ),
        ],
      ),
      body: SafeArea(
        child: ExpandableDeck(
          items: [
            for (int i = 0; i < 3; i++)
              DeckItem(
                title: "Annual General Meeting",
                time: DateTime.now(),
              ),
          ],
        ),
      ),
    );
  }
}
