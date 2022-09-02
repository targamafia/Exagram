import 'package:exagram/core/assesments/data/dto/get_answer.dart';

class GetQuestionWithAnswers {
  final String id;
  final String text;
  final String imgUrl;
  final List<GetAnswer> answers;

  GetQuestionWithAnswers(
      {required this.id,
      required this.text,
      required this.imgUrl,
      required this.answers});
}
