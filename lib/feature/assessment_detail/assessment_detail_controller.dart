import 'package:exagram/core/assesments/domain/repository/assessment_repository_impl.dart';
import 'package:exagram/core/assesments/domain/usecase/get_assessment_detail_usecase.dart';
import 'package:get/get.dart';

import '../../core/assesments/data/datasource/assessment_api_datasource.dart';

class AssessmentDetailController extends GetxController {
  GetAssessmentDetailUseCase getAssessmentDetailById =
      GetAssessmentDetailUseCase(
          AssessmentRepositoryImpl(AssessmentApiDataSource()));

  var id = "".obs;
  var area = "".obs;
  var title = "Observable title".obs;
  var thumbnailUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80".obs;
  var description = "".obs;
  var numOfQuestions = "".obs;

  AssessmentDetailDto assessmentDetail = AssessmentDetailDto(
      id: 'NO ID',
      area: 'NO AREA',
      title: 'NO TITLE',
      imgUrl:
          'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
      description: 'NO DESC',
      numOfQuestions: 0);

  void refreshAssessmentDetailById(String id) async {
    assessmentDetail = await getAssessmentDetailById.call(id);
    title(assessmentDetail.title);
  }
}

class AssessmentDetailDto {
  final String id;
  final String area;
  final String title;
  final String imgUrl;
  final String description;
  final int numOfQuestions;

  AssessmentDetailDto(
      {required this.id,
      required this.area,
      required this.title,
      required this.imgUrl,
      required this.description,
      required this.numOfQuestions});
}
