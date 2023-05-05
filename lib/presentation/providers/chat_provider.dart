import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/message.dart';

class ChatProvider extends ChangeNotifier {
  ScrollController controller = ScrollController();
  List<Message> messages = [];

  Future<void> addMessage(String text) async {
    if (text.isEmpty) return;

    final message = Message(text: text, fromWho: FromWho.me);
    messages.add(message);

    if (text.endsWith("?")) {
      messages.add(await GetYesNotAnswer().getAnswer());
    }
    notifyListeners();
    moveToBottom();
  }

  moveToBottom() {
    controller.animateTo(
      controller.position.maxScrollExtent + 1000,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
