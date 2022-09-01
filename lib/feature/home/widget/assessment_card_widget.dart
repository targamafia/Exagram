import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../assessment_detail/page/assessment_detail_page.dart';

class AssessmentCard extends StatefulWidget {
  final String id;
  final String title;
  final String area;
  final String imgUrl;

  const AssessmentCard(
      {super.key,
      required this.id,
      required this.title,
      required this.area,
      required this.imgUrl});

  @override
  State<StatefulWidget> createState() => _AssessmentCard();
}

double WIDTH = 150.0 * 1.5;
double HEIGHT = 120.0 * 1.5;
double BORDER_RADIUS = 8.0;

class _AssessmentCard extends State<AssessmentCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WIDTH,
      height: HEIGHT,
      child: Stack(children: [
        FittedBox(
          clipBehavior: Clip.hardEdge,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(BORDER_RADIUS),
            child: Image.network(
              width: WIDTH,
              height: HEIGHT,
              widget.imgUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
        InkWell(
          onTap: () =>
              {Get.to(() => AssessmentDetailPage(assessmentId: widget.id))},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(BORDER_RADIUS)),
              color: Colors.blue.withOpacity(.3),
            ),
            width: WIDTH,
            height: HEIGHT,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                Text(widget.area,
                style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white, fontSize: 14.0),)
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
