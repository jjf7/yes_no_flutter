import '../../domain/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Message makeMessageInstance() {
    late String myAnswer;
    if (answer == "yes") myAnswer = "Si";
    if (answer == "no") myAnswer = "Nop";
    if (answer == "maybe") myAnswer = "Tal vez";

    return Message(text: myAnswer, imageUrl: image, fromWho: FromWho.hers);
  }
}
