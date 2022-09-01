import 'package:exagram/core/assesments/data/datasource/assessment_remote_datasource.dart';
import 'package:exagram/core/assesments/domain/entities/featured_assessment_card_dto.dart';
import 'package:exagram/core/assesments/domain/repository/assessment_repository_impl.dart';
import 'package:exagram/core/assesments/domain/usecase/get_free_tier_usecase.dart';
import 'package:get/get.dart';

import '../../../core/assesments/domain/entities/free_tier_assessment.dart';
import '../../../core/assesments/domain/usecase/get_featured_assessments_usecase.dart';

class HomeController extends GetxController {
  final GetFreeTierUseCase getFreeTierUseCase = GetFreeTierUseCase(
      assessmentRepository: AssessmentRepositoryImpl(AssessmentMockAPI()));

  final GetFeaturedAssessmentsUseCase getFeaturedAssessmentsUseCase = GetFeaturedAssessmentsUseCase(
      assessmentRepository: AssessmentRepositoryImpl(AssessmentMockAPI()));

  List<FreeTierAssessment> freeTierAssessment = [];
  List<FeatureAssessmentCardDto> featuredAssessments = [];

  void refreshFreeTierAssessmentList() {
    freeTierAssessment = getFreeTierUseCase.call();
  }

  void refreshFeatureAssessmentsList() {
    featuredAssessments = getFeaturedAssessmentsUseCase.call();
  }
}
