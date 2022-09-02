import 'package:exagram/feature/assessment_application/assessment_application_controller.dart';
import 'package:exagram/feature/assessment_detail/assessment_detail_controller.dart';

import '../../domain/entities/featured_assessment_card_dto.dart';
import '../../domain/entities/free_tier_assessment.dart';

class AssessmentRepository {
  List<FreeTierAssessment> getFreeTierAssessments() {
    throw UnimplementedError();
  }

  List<FeatureAssessmentCardDto> getFeaturedAssessments() {
    throw UnimplementedError();
  }

  AssessmentDetailDto getAssessmentDetail(String id) {
    throw UnimplementedError();
  }

  List<Question> getQuestionsByAssessmentId(String assessmentId) {
    throw UnimplementedError();
  }

}

