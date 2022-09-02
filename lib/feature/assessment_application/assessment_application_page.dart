import 'package:exagram/feature/assessment_application/widget/answer_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../styles.dart';

class AssessmentApplicationPage extends StatefulWidget {
  const AssessmentApplicationPage({Key? key, required this.assessmentId})
      : super(key: key);

  final String assessmentId;

  @override
  State<StatefulWidget> createState() => _AssessmentApplicationPage();
}

class _AssessmentApplicationPage extends State<AssessmentApplicationPage> {
  @override
  Widget build(BuildContext context) {
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
                  const Text('39 de 40')
                ],
              ),
              ElevatedButton(
                onPressed: () => {},
                child: Row(
                  children: const [
                    Text('Siguiente'),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 13.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: AppColorLight.primaryContainer.withOpacity(.3),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 32.0),
                child: Text(
                  'Question 39 of 40',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.black.withOpacity(.6), fontSize: 13.0),
                ),
              ),
              Text(
                'On which default interface have you configured an IP address for a switch?',
                style: Theme.of(context).textTheme.headline6,
              ),
              AnswerOption(id: 'id', answer: 'Uuuuwu'),
              AnswerOption(id: 'id', answer: 'Uuuuwu'),
              AnswerOption(id: 'id', answer: 'Uuuuwu'),
              AnswerOption(id: 'id', answer: 'Uuuuwu')
            ],
          ),
        ),
      ),
    );
  }
}
