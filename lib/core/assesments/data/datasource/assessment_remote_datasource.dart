import 'package:exagram/core/assesments/data/dto/get_answer.dart';
import 'package:exagram/feature/assessment_detail/assessment_detail_controller.dart';
import '../../../api/api.dart';
import '../dto/get_freetier_assessment_dto.dart';
import '../dto/get_question_with_answers.dart';
import 'package:http/http.dart' as http;

String LOREM =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam non urna lorem. Curabitur facilisis dictum erat sit amet dapibus. Cras tristique, turpis vitae aliquet bibendum, tellus urna pharetra purus, eu viverra justo magna quis leo. Quisque lobortis odio vel quam condimentum, sed pharetra lacus condimentum. Fusce vestibulum malesuada iaculis. Mauris quis urna et massa iaculis tempus quis consectetur augue. Nunc tincidunt sem a justo suscipit, nec feugiat nulla pharetra. Suspendisse nec eros at libero tempus placerat ac at nunc. Maecenas faucibus eros quam, non feugiat velit pellentesque vel. Vivamus maximus sodales ipsum, lobortis maximus tellus molestie non. Donec sed lacus tincidunt ipsum tempus dignissim. Integer feugiat, felis a molestie convallis, dui mauris auctor mi, sed eleifend tortor nisl et mauris. Nulla ac quam consectetur, eleifend neque sed, consequat nunc. Aliquam in posuere orci. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi sed placerat augue.";

/// Interface: Declares the methods needed to fetch/update information to the Assessment API
class AssessmentRemoteDataSource {
  List<http.Response> getFreeTierAssessments() {
    throw UnimplementedError();
  }

  Future<http.Response> getFeaturedAssessments() {
    throw UnimplementedError();
  }

  Future<http.Response> getAssessmentDetailById(String id) {
    throw UnimplementedError();
  }

  List<http.Response> getQuestionsWithAnswersByAssessmentId(
      String assessmentId) {
    throw UnimplementedError();
  }
}

class GetFeatureAssessments {
  final String id;
  final String name;
  final String area;
  final String imgUrl;

  GetFeatureAssessments(
      {required this.id,
      required this.name,
      required this.area,
      required this.imgUrl});
}
