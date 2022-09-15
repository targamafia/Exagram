import 'package:exagram/core/assesments/data/datasource/assessment_remote_datasource.dart';
import 'package:exagram/core/assesments/data/repository/assesment_repository.dart';
import 'package:exagram/core/assesments/domain/entities/featured_assessment_card_dto.dart';
import 'package:exagram/feature/assessment_application/assessment_application_controller.dart';
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
  Future<List<FeatureAssessmentCardDto>> getFeaturedAssessments() {
    return dataSource.getFeaturedAssessments().then((it) => it
        .map(
          (a) => FeatureAssessmentCardDto(
              id: a.id, assessmentName: a.name, imgUrl: a.imgUrl, area: a.area),
        )
        .toList());
  }

  @override
  AssessmentDetailDto getAssessmentDetail(String id) {
    return dataSource.getAssessmentDetailById(id);
  }

  @override
  List<Question> getQuestionsByAssessmentId(String assessmentId) {
    return dataSource
        .getQuestionsWithAnswersByAssessmentId(assessmentId)
        .map((e) => Question(
            text: e.text,
            imgUrl: e.imgUrl,
            answers: e.answers
                .map((e2) =>
                    Answer(id: e2.id, text: e2.text, isCorrect: e2.isCorrect))
                .toList()))
        .toList();
  }
}
