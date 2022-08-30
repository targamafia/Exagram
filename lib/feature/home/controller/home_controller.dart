import 'package:exagram/core/assesments/data/datasource/assessment_remote_datasource.dart';
import 'package:exagram/core/assesments/domain/repository/assessment_repository_impl.dart';
import 'package:exagram/core/assesments/domain/usecase/get_free_tier_usecase.dart';
import 'package:get/get.dart';

import '../../../core/assesments/domain/entities/free_tier_assessment.dart';

class HomeController extends GetxController {
  final GetFreeTierUseCase getFreeTierUseCase = GetFreeTierUseCase(
      assessmentRepository: AssessmentRepositoryImpl(AssessmentMockAPI()));

  List<FreeTierAssessment> freeTierAssessment = [];

  void refreshFreeTierAssessmentList() {
    freeTierAssessment = getFreeTierUseCase.call();
  }
}
