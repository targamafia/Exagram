import 'package:exagram/core/assesments/data/repository/assesment_repository.dart';
import 'package:exagram/feature/assessment_detail/page/assessment_detail_controller.dart';

class GetAssessmentDetailUseCase {
  final AssessmentRepository assessmentRepository;

  GetAssessmentDetailUseCase(this.assessmentRepository);

  AssessmentDetailDto call(String id) {
    return assessmentRepository.getAssessmentDetail(id);
  }
}