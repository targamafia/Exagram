import 'package:exagram/core/assesments/data/datasource/assessment_remote_datasource.dart';
import 'package:exagram/core/assesments/domain/repository/assessment_repository_impl.dart';
import 'package:exagram/core/assesments/domain/usecase/get_assessment_detail_usecase.dart';
import 'package:get/get.dart';

class AssessmentDetailController extends GetxController {
  GetAssessmentDetailUseCase getAssessmentDetailById =
      GetAssessmentDetailUseCase(AssessmentRepositoryImpl(AssessmentMockAPI()));

  AssessmentDetailDto assessmentDetail = AssessmentDetailDto(
      id: 'NO ID',
      area: 'NO AREA',
      title: 'NO TITLE',
      imgUrl: '',
      description: '',
      numOfQuestions: 0);

  void refreshAssessmentDetailById(String id) {
    assessmentDetail = getAssessmentDetailById.call(id);
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
