import 'package:exagram/feature/assessment_detail/page/assessment_detail_page.dart';
import 'package:exagram/styles.dart';
import 'package:flutter/material.dart';

var WIDTH = 150.0 * 1.5;
var HEIGHT = 120.0 * 1.5;
var BORDER_RADIUS = 8.0;

class GoToCardWidget extends StatefulWidget {
  const GoToCardWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GoToCardWidget();
}

class _GoToCardWidget extends State<GoToCardWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(WIDTH, HEIGHT),
        backgroundColor: Colors.blue.withOpacity(.4),
        padding: EdgeInsets.all(BORDER_RADIUS),
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ver más',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white)),
          const Icon(
            Icons.arrow_forward_rounded,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
