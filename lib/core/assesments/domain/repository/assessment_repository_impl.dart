import 'package:exagram/core/assesments/data/datasource/assessment_remote_datasource.dart';
import 'package:exagram/core/assesments/data/repository/assesment_repository.dart';
import 'package:exagram/core/assesments/domain/entities/featured_assessment_card_dto.dart';
import 'package:exagram/feature/assessment_detail/assessment_detail_controller.dart';

import '../entities/free_tier_assessment.dart';

class AssessmentRepositoryImpl implements AssessmentRepository {
  late AssessmentRemoteDataSource dataSource;

  AssessmentRepositoryImpl(this.dataSource);

  @override
  List<FreeTierAssessment> getFreeTierAssessments() {
    return dataSource
        .getFreeTierAssessments()
        .map((e) => FreeTierAssessment(
            id: e.id ?? "",
            title: e.title ?? "",
            numberOfQuestions: e.numberOfQuestions ?? 0))
        .toList();
  }

  @override
  List<FeatureAssessmentCardDto> getFeaturedAssessments() {
    return dataSource
        .getFeaturedAssessments()
        .map((e) => FeatureAssessmentCardDto(
            id: e.id, assessmentName: e.name, imgUrl: e.imgUrl, area: e.area))
        .toList();
  }

  @override
  AssessmentDetailDto getAssessmentDetail(String id) {
    return dataSource.getAssessmentDetailById(id);
  }
}
