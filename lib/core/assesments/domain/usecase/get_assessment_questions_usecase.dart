import '../../../../feature/assessment_application/assessment_application_controller.dart';
import '../../data/repository/assesment_repository.dart';

class GetAssessmentQuestionsUseCase {
  final AssessmentRepository assessmentRepository;

  GetAssessmentQuestionsUseCase(this.assessmentRepository);


  List<Question> call(String assessmentId) {
    return assessmentRepository.getQuestionsByAssessmentId(assessmentId);
  }
}