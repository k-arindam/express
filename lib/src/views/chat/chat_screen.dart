import 'package:express/src/common/constants/constants.dart';
import 'package:express/src/common/widgets/circle_icon_button.dart';
import 'package:express/src/core/controllers/chat_controller.dart';
import 'package:express/src/views/chat/message_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _chatController =
      Get.find<ChatController>(tag: Constants.kChatController);
  final _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();

  XFile? img;

  Widget _buildBottomBar() {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Constants.kBlack, width: 1.5),
      borderRadius: BorderRadius.circular(12.0),
    );

    return Container(
      height: 100.0,
      width: double.maxFinite,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Constants.kGrey,
        borderRadius: BorderRadius.circular(38.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              controller: _textController,
              style: const TextStyle(
                color: Constants.kDarkGreen,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                border: border,
                enabledBorder: border,
                focusedBorder: border,
              ),
              cursorColor: Constants.kBlack,
            ),
          ),
          CircleIconButton(
            icon: Icons.image_rounded,
            backgroundColor: Constants.kBlack,
            iconColor: Constants.kWhiteGreen,
            margin: const EdgeInsets.only(left: 8.0),
            onTap: () async {
              img = await _picker.pickImage(source: ImageSource.gallery);
            },
          ),
          // const SizedBox(width: 8.0),
          CircleIconButton(
            icon: Icons.send_rounded,
            backgroundColor: Constants.kBlack,
            iconColor: Constants.kWhiteGreen,
            margin: const EdgeInsets.only(left: 8.0),
            onTap: () async {
              _chatController.sendMessage(_textController.text,
                  img: await img?.readAsBytes());
              _textController.text = "";
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Expanded(
                child: MessageView(),
              ),
              _buildBottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
