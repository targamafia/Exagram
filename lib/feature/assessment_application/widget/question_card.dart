import 'package:exagram/feature/assessment_application/widget/QuestionCardController.dart';
import 'package:exagram/feature/assessment_application/widget/answer_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../assessment_application_controller.dart';

String LETTERS = "abcdefghijklmnopqrstuvwxyz";

class QuestionCard extends StatefulWidget {
  final Question question;

  const QuestionCard({super.key, required this.question});

  @override
  State<StatefulWidget> createState() => _QuestionCard();
}

class _QuestionCard extends State<QuestionCard> {
  QuestionCardController controller = Get.put(QuestionCardController());
  int letterIndex = 0;

  @override
  Widget build(BuildContext context) {
    controller.loadNewQuestion(widget.question);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                '${controller.text}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            if (controller.imgUrl.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Image.network(
                  controller.imgUrl.value,
                  fit: BoxFit.fill,
                ),
              ),
            Column(
              children: controller.answers
                  .map((e) => Obx(
                        () => AnswerCard(
                          id: e.id,
                          answer: e.text,
                          isSelected:
                              controller.selectedQuestionId.value == e.id,
                          onSelect: () {
                            controller.selectedQuestionId(e.id);
                          },
                          letter: nextLetter(),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  nextLetter() {
    var letter = LETTERS[letterIndex % controller.answers.length];
    ++letterIndex;
    return letter;
  }
}
