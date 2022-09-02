import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../styles.dart';

class AnswerCard extends StatefulWidget {
  const AnswerCard(
      {Key? key,
      required this.id,
      required this.answer,
      required this.isSelected,
      required this.onSelect,
      required this.letter})
      : super(key: key);

  final String id;
  final String answer;
  final bool isSelected;
  final VoidCallback onSelect;
  final String letter;

  @override
  State<StatefulWidget> createState() => _AnswerCard();
}

class _AnswerCard extends State<AnswerCard> {
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.65;

    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: InkWell(
        onTap: widget.onSelect,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: widget.isSelected
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
                    : Text('${widget.letter})'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Container(
                width: c_width,
                child: Text(widget.answer),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
