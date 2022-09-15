import 'dart:convert';

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
    return [];
  }

  @override
  Future<List<FeatureAssessmentCardDto>> getFeaturedAssessments() async {
    var response = await dataSource.getFeaturedAssessments();
    var responseBody = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    return responseBody['entity']['list'].map<FeatureAssessmentCardDto>((it) {
      return FeatureAssessmentCardDto(
          id: it['id'] ?? '',
          assessmentName: it['title'] ?? '',
          area: 'IT',
          imgUrl: it['thumbnailUrl'] ?? 'http://placeimg.com/640/480');
    }).toList();
  }

  @override
  Future<AssessmentDetailDto> getAssessmentDetail(String id) async {
    var response = await dataSource.getAssessmentDetailById(id);
    var responseBody = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    var entity = responseBody['entity'];
    return AssessmentDetailDto(
        id: entity['_id'] ?? ':ccc',
        area: 'IT',
        title: entity['title'] ?? ':ccc',
        imgUrl: entity['thumbnailUrl'] ?? 'http://placeimg.com/640/480',
        description: entity['description'] ?? ':ccc',
        numOfQuestions: 10);
  }

  @override
  List<Question> getQuestionsByAssessmentId(String assessmentId) {
    return [];
  }
}
