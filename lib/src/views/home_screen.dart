import 'package:expandable_deck/expandable_deck.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
