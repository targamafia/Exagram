import 'package:get/get.dart';

import '../assessment_application_controller.dart';

class QuestionCardController extends GetxController {
  var text = "".obs;
  var imgUrl = "".obs;
  var selectedQuestionId = "".obs;
  List<Answer> answers = [];

  loadNewQuestion(Question question) {
    text.value = question.text;
    imgUrl.value = question.imgUrl;
    answers = question.answers;
  }
}
