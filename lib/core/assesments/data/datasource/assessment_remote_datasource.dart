import '../dto/get_freetier_assessment_dto.dart';

/// Interface: Declares the methods needed to fetch/update information to the Assessment API
class AssessmentRemoteDataSource {
  List<GetFreeTierAssessmentDTO> getFreeTierAssessments() {
    throw UnimplementedError();
  }
}

class AssessmentAPI implements AssessmentRemoteDataSource {
  @override
  List<GetFreeTierAssessmentDTO> getFreeTierAssessments() {
    throw UnimplementedError();
  }
}

class AssessmentMockAPI implements AssessmentRemoteDataSource {
  @override
  List<GetFreeTierAssessmentDTO> getFreeTierAssessments() {
    return [
      GetFreeTierAssessmentDTO('1', 'Examen preparación CISCO I', 20),
      GetFreeTierAssessmentDTO('2', 'Examen preparación CISCO II', 20),
      GetFreeTierAssessmentDTO('3', 'Examen preparación CISCO III', 20),
    ];
  }
}
