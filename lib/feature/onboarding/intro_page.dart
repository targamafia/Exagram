import 'package:exagram/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'onboarding_data.dart';

class IntroPage extends StatefulWidget {
  final List<OnBoardingData> onBoardingDataList;
  final MaterialPageRoute pageRoute;

  const IntroPage(
      {super.key, required this.onBoardingDataList, required this.pageRoute});

  void skipPage(BuildContext context) {
    Navigator.push(context, pageRoute);
  }

  @override
  State<StatefulWidget> createState() => _IntroPage();
}

class _IntroPage extends State<IntroPage> {
  final PageController controller = PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == widget.onBoardingDataList.length - 1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  Widget _buildPageIndicator(int page) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: page == currentPage ? 10.0 : 6.0,
      width: page == currentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: page == currentPage ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: PageView(
              controller: controller,
              onPageChanged: _onPageChanged,
              children: widget.onBoardingDataList,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text(lastPage ? "" : "Saltar",
                      style: TextStyle(
                          color: AppColorLight.primary.withOpacity(.6),
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? null
                      : widget.skipPage(
                          context,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      _buildPageIndicator(0),
                      _buildPageIndicator(1),
                      _buildPageIndicator(2),
                    ],
                  ),
                ),
                TextButton(
                  child: Text(lastPage ? "Continuar" : "Siguiente",
                      style: const TextStyle(
                          color: AppColorLight.primary,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? widget.skipPage(context)
                      : controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
