import 'package:exagram/core/assesments/domain/entities/featured_assessment_card_dto.dart';

import '../../data/repository/assesment_repository.dart';

class GetFeaturedAssessmentsUseCase {
  final AssessmentRepository assessmentRepository;

  GetFeaturedAssessmentsUseCase({required this.assessmentRepository});

  Future<List<FeatureAssessmentCardDto>> call() {
    return Future.delayed(const Duration(seconds: 5), () {
      return assessmentRepository.getFeaturedAssessments();
    });
  }
}
