import 'package:flutter/material.dart';

class FinishAssessmentPage extends StatefulWidget {
  const FinishAssessmentPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FinishAssessmentPage();
}

class _FinishAssessmentPage extends State<FinishAssessmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Finish Assessment Page'),
      ),
    );
  }
}
