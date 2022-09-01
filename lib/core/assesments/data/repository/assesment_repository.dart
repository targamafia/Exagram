import 'package:exagram/feature/assessment_detail/page/assessment_detail_controller.dart';

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

}

