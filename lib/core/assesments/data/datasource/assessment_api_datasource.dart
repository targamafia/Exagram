import 'package:http/http.dart' as http;

import '../../../api/api.dart';
import 'assessment_remote_datasource.dart';

class AssessmentApiDataSource implements AssessmentRemoteDataSource {
  @override
  Future<http.Response> getAssessmentDetailById(String id) {
    return API.get('/assessments/$id');
  }

  @override
  Future<http.Response> getFeaturedAssessments() {
    return API.get('/assessments/featured');
  }

  @override
  List<http.Response> getFreeTierAssessments() {
    // TODO: implement getFreeTierAssessments
    throw UnimplementedError();
  }

  @override
  List<http.Response> getQuestionsWithAnswersByAssessmentId(
      String assessmentId) {
    // TODO: implement getQuestionsWithAnswersByAssessmentId
    throw UnimplementedError();
  }
}
