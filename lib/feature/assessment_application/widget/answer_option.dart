import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../styles.dart';

class AnswerOption extends StatefulWidget {
  const AnswerOption(
      {Key? key,
      required this.id,
      required this.answer,})
      : super(key: key);
  final String id;
  final String answer;

  @override
  State<StatefulWidget> createState() => _AnswerOption();
}

class _AnswerOption extends State<AnswerOption> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _value = !_value;
          });
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: _value
                    ? Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColorLight.correctGreen,
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      )
                    : Icon(
                        Icons.circle,
                        size: 20.0,
                        color: AppColorLight.primaryContainer.withOpacity(.3),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(widget.answer),
            ),
          ],
        ),
      ),
    );
  }
}
