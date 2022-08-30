import 'package:exagram/core/assesments/data/datasource/assessment_remote_datasource.dart';
import 'package:exagram/core/assesments/data/repository/assesment_repository.dart';

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
}
