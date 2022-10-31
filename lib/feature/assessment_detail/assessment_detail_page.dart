import 'package:exagram/feature/assessment_detail/assessment_detail_controller.dart';
import 'package:exagram/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../assessment_application/assessment_application_page.dart';

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
    print("AssessmentId: ${widget.assessmentId}");
    controller.refreshAssessmentDetailById(widget.assessmentId);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: AppColorLight.primary),
        title: Text(
          'MRP Capacitaciones',
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  '${controller.title}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColorLight.neutral10),
                ),
              ),
              Padding(padding: const EdgeInsets.only(top: 16.0),
                  child:Text('${controller.assessmentDetail.numOfQuestions} preguntas',
                    style: Theme.of(context).textTheme.headline6?.copyWith(color: AppColorLight.neutral30),
                )
              ),

              Container(
                padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                child: Obx(
                  () =>
                      Image.network(controller.thumbnailUrl.value, width: 328),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Descripción',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColorLight.neutral10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 32.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    controller.assessmentDetail.description,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: AppColorLight.neutral30, fontSize: 16.0),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: AppColorLight.blu),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() =>
                        const AssessmentApplicationPage(assessmentId: "id"));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: const Text('Empezar',
                  style: TextStyle(fontSize: 14.0),),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
