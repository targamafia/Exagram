import 'package:exagram/core/assesments/data/repository/assesment_repository.dart';
import 'package:exagram/core/assesments/domain/entities/free_tier_assessment.dart';

class GetFreeTierUseCase {
  final AssessmentRepository assessmentRepository;

  GetFreeTierUseCase({required this.assessmentRepository});

  List<FreeTierAssessment> call() {
    return assessmentRepository.getFreeTierAssessments();
  }
}
