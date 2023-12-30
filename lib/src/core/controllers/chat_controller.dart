import 'dart:typed_data';

import 'package:express/src/core/services/notification_service.dart';
import 'package:fl_gemini_client/fl_gemini_client.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final _client = FLGeminiClient.instance;

  final RxList<GeminiMessage> _messages = <GeminiMessage>[].obs;
  final RxBool _processing = false.obs;

  Future<void> sendMessage(
    String input, {
    Uint8List? img,
  }) async {
    final inputMessage = GeminiMessage(
      entity: MessageEntity.user,
      parts: [input],
    );

    _processing.value = true;
    _messages.add(inputMessage);

    try {
      final msg = await _client.generateOneOffResponse(input, image: img!);

      if (msg != null) {
        _messages.add(msg);
      }
    } catch (e) {
      NotificationService.present(
        NotificationType.error,
        message: e.toString(),
      );
    }

    _processing.value = false;
  }

  // GETTERS
  List<GeminiMessage> get messages => _messages;
  bool get isProcessing => _processing.value;
}
