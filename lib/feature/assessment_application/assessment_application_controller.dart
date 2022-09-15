import 'package:exagram/core/assesments/domain/repository/assessment_repository_impl.dart';
import 'package:exagram/core/assesments/domain/usecase/get_assessment_questions_usecase.dart';
import 'package:get/get.dart';

import '../../core/assesments/data/datasource/assessment_api_datasource.dart';

String mockImgURL =
    'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80';

class AssessmentApplicationController extends GetxController {
  final GetAssessmentQuestionsUseCase _getAssessmentQuestionsUseCase =
      GetAssessmentQuestionsUseCase(
          AssessmentRepositoryImpl(AssessmentApiDataSource()));

  var _currentQuestionIndex = 0.obs;

  int get currentQuestionIndex => _currentQuestionIndex.value;
  List<Question> questions = [];

  void incrementQuestionIndex() => _currentQuestionIndex += 1;

  void fetchAssessmentQuestionsByAssessmentId(String assessmentId) {
    questions = _getAssessmentQuestionsUseCase.call(assessmentId);
  }
}

class Question {
  final String text;
  final String imgUrl;
  final List<Answer> answers;

  Question({required this.text, required this.imgUrl, required this.answers});
}

class Answer {
  final String id;
  final String text;
  final bool isCorrect;

  Answer({required this.id, required this.text, required this.isCorrect});
}
