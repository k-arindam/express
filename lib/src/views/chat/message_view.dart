import 'dart:async';

import 'package:express/src/common/constants/constants.dart';
import 'package:express/src/core/controllers/chat_controller.dart';
import 'package:fl_gemini_client/fl_gemini_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  final _chatController =
      Get.find<ChatController>(tag: Constants.kChatController);

  int _activeDotIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(milliseconds: 180), (timer) {
      setState(() {
        if (_activeDotIndex < 2) {
          _activeDotIndex++;
        } else {
          _activeDotIndex = 0;
        }
      });
    });
    super.initState();
  }

  Widget _buildLoadingView() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: SizedBox(
        height: 15.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 0; i < 3; i++)
              Container(
                height: 10.0,
                width: 10.0,
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: _activeDotIndex == i
                      ? Constants.kDarkGreen
                      : Constants.kWhiteGreen,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Obx(
      () => Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(12.0),
              itemCount: _chatController.messages.length,
              itemBuilder: (context, index) {
                final message =
                    _chatController.messages.reversed.toList()[index];

                return Align(
                  alignment: message.entity == MessageEntity.user
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: size.width * 0.75),
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: message.entity != MessageEntity.user
                            ? Constants.kOrange
                            : Constants.kGreen,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      message.parts.first,
                      style: const TextStyle(
                        fontSize: 17.0,
                        color: Constants.kWhite,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_chatController.isProcessing) _buildLoadingView(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
