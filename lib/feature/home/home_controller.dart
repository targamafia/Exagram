import 'package:exagram/core/assesments/data/datasource/assessment_api_datasource.dart';
import 'package:exagram/core/assesments/domain/entities/featured_assessment_card_dto.dart';
import 'package:exagram/core/assesments/domain/repository/assessment_repository_impl.dart';
import 'package:exagram/core/assesments/domain/usecase/get_free_tier_usecase.dart';
import 'package:get/get.dart';

import '../../core/assesments/domain/entities/free_tier_assessment.dart';
import '../../core/assesments/domain/usecase/get_featured_assessments_usecase.dart';

class HomeController extends GetxController {
  final GetFreeTierUseCase getFreeTierUseCase = GetFreeTierUseCase(
      assessmentRepository: AssessmentRepositoryImpl(AssessmentApiDataSource()));

  final GetFeaturedAssessmentsUseCase getFeaturedAssessmentsUseCase =
      GetFeaturedAssessmentsUseCase(
          assessmentRepository: AssessmentRepositoryImpl(AssessmentApiDataSource()));

  List<FreeTierAssessment> freeTierAssessment = [];
  RxList<FeatureAssessmentCardDto> featuredAssessments =
      <FeatureAssessmentCardDto>[].obs;

  void refreshFreeTierAssessmentList() {
    freeTierAssessment = getFreeTierUseCase.call();
  }

  void refreshFeatureAssessmentsList() {
    getFeaturedAssessmentsUseCase
        .call()
        .then((value) => featuredAssessments.value = value);
  }
}
