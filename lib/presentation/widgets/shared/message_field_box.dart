import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({Key? key, required this.onValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController txtController = TextEditingController();
    FocusNode focusNode = FocusNode();

    var underlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20));

    return TextFormField(
      controller: txtController,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        txtController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
      decoration: InputDecoration(
          hintText: 'End your message with a "?"',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          enabledBorder: underlineInputBorder,
          focusedBorder: underlineInputBorder,
          filled: true,
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              onValue(txtController.text);
              txtController.clear();
              focusNode.requestFocus();
            },
          )),
    );
  }
}
