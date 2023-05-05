import 'package:dio/dio.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';
import '../../domain/message.dart';

class GetYesNotAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get("https://yesno.wtf/api");

    final yesNotModel = YesNoModel.fromJson(response.data);

    return yesNotModel.makeMessageInstance();
  }
}
