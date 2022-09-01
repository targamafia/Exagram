import 'package:exagram/feature/assessment_detail/assessment_detail_controller.dart';
import 'package:exagram/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AssessmentDetailPage extends StatefulWidget {
  final String assessmentId;

  const AssessmentDetailPage({super.key, required this.assessmentId});

  @override
  State<StatefulWidget> createState() => _AssessmentDetailPage();
}

class _AssessmentDetailPage extends State<AssessmentDetailPage> {
  @override
  Widget build(BuildContext context) {
    AssessmentDetailController controller =
        Get.put(AssessmentDetailController());
    controller.refreshAssessmentDetailById(widget.assessmentId);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: AppColorLight.primary),
        title: Text(
          controller.assessmentDetail.area,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                controller.assessmentDetail.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(.75)),
              ),
              Text(
                '${controller.assessmentDetail.numOfQuestions} preguntas',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.black.withOpacity(.5)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32.0, bottom: 20.0),
                child: FittedBox(
                  clipBehavior: Clip.hardEdge,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.network(controller.assessmentDetail.imgUrl),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Descripción del curso',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.75)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 30.0),
                child: Text(
                  controller.assessmentDetail.description,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.black.withOpacity(.65), fontSize: 16.0),
                ),
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    gradient: const LinearGradient(colors: [
                      AppColorLight.onPrimaryContainer,
                      AppColorLight.primary
                    ])),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: const Text('Iniciar Examen'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
