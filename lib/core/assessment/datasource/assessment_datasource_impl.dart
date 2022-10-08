import 'dart:convert';
import 'package:exagram/core/assessment/dto/best_assessment_dto.dart';
import 'package:exagram/core/assessment/dto/featured_assessment_dto.dart';
import 'package:exagram/feature/utils/result.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../api/api.dart';
import '../exception.dart';
import 'assessment_datasource_interface.dart';

class AssessmentDataSourceImpl implements AssessmentDataSourceInterface {
  @override
  Future<Result<List<BestAssessmentDto>>> fetchBestAssessments() async {
    var response = await API.get("/assessments/best").then((value) => []);
    return Result.success([]);
  }

  @override
  Future<Result<List<FeaturedAssessmentDto>>> fetchFeaturedAssessments() async {
    var response = await API.get("/assessments/featured");
    switch (response.statusCode) {
      case HttpStatus.ok:
        var body = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
        var featuredAssessments = body['entity']['list']
            .map<FeaturedAssessmentDto>((it) => FeaturedAssessmentDto(
                id: it['id'],
                title: it['title'],
                description: it['description'],
                // thumbnailUrl: it['thumbnailUrl'],
                thumbnailUrl: 'http://placeimg.com/640/480/arch',
                isPrivate: it['isPrivate'],
                isPremium: it['isPremium'],
                rating: it['rating'],
                categories: it['categories']));
        return Result.success(featuredAssessments);
      default:
        return Result.failure(HttpException(
            message: "Failed to fetch featured assessments",
            statusCode: response.statusCode));
    }
  }
}
