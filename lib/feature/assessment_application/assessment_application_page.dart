import 'package:exagram/feature/assessment_application/assessment_application_controller.dart';
import 'package:exagram/feature/assessment_application/widget/answer_card.dart';
import 'package:exagram/feature/assessment_application/widget/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../styles.dart';
import '../finish_assessment/finish_assessment_page.dart';

class AssessmentApplicationPage extends StatefulWidget {
  const AssessmentApplicationPage({Key? key, required this.assessmentId})
      : super(key: key);

  final String assessmentId;

  @override
  State<StatefulWidget> createState() => _AssessmentApplicationPage();
}

class _AssessmentApplicationPage extends State<AssessmentApplicationPage> {
  String btnText = "Siguiente";

  AssessmentApplicationController controller =
      Get.put(AssessmentApplicationController());

  @override
  Widget build(BuildContext context) {
    controller.fetchAssessmentQuestionsByAssessmentId("fakeId");
    var questions =
        controller.questions.map((it) => QuestionCard(question: it)).toList();
    return Scaffold(
      appBar: AppBar(
        // leading: const Text(''),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Salir',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.red,
                      fontSize: 16.0,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
        ],
        elevation: 1,
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: AppColorLight.primary),
        title: Text(
          'Examen',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10.0,
        child: Container(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
          height: 90.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Examen CISCO II',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Obx(() => Text(
                      '${controller.currentQuestionIndex + 1} de ${questions.length}'))
                ],
              ),
              Obx(() => _renderContinueOrFinishBtn(questions.length))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Obx(() => questions[controller.currentQuestionIndex])),
      backgroundColor: AppColorLight.primaryContainerSmooth,
    );
  }

  _renderContinueOrFinishBtn(int numberOfQuestions) {
    var nextIndex = controller.currentQuestionIndex + 1;
    if (nextIndex > numberOfQuestions - 1) {
      return ElevatedButton(
        onPressed: () {
          Get.to(const FinishAssessmentPage());
        },
        child: Row(
          children: const [
            Text('Terminar'),
            Icon(
              Icons.arrow_forward_ios,
              size: 13.0,
            )
          ],
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: controller.incrementQuestionIndex,
        child: Row(
          children: const [
            Text('Siguiente'),
            Icon(
              Icons.arrow_forward_ios,
              size: 13.0,
            )
          ],
        ),
      );
    }
  }
}
