import 'package:exagram/core/assessment/dto/best_assessment_dto.dart';

import '../../../feature/utils/result.dart';
import '../dto/featured_assessment_dto.dart';

/// Interface that connects to the outside world.
///
/// For this interface it really doesn't matter how te input information is,
/// what it does matter is what we don't propagate data structures we are not
/// going to use in the application, thus in this layer we transform the input data to
/// our desired data structure.
class AssessmentDataSourceInterface {
  Future<Result<List<BestAssessmentDto>>> fetchBestAssessments() async {
    throw UnimplementedError();
  }

  Future<Result<List<FeaturedAssessmentDto>>> fetchFeaturedAssessments() async {
    throw UnimplementedError();
  }
}
