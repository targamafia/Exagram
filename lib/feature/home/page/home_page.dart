import 'package:exagram/feature/home/controller/home_controller.dart';
import 'package:exagram/feature/home/widget/go_to_card_widget.dart';
import 'package:exagram/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/assessment_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    controller.refreshFeatureAssessmentsList();
    List<Widget> uwu = controller.featuredAssessments
        .map(
          (it) => Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: AssessmentCard(
              id: it.id,
              title: it.assessmentName,
              area: it.area,
              imgUrl: it.imgUrl,
            ),
          ),
        )
        .toList();

    uwu.add(Padding(padding: EdgeInsets.zero, child: GoToCardWidget()));
    controller.refreshFreeTierAssessmentList();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Exámenes Populares',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: AppColorLight.primary),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: uwu,
            ),
          ),
        ],
      ),
    );
  }
}
