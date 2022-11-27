import 'package:flutter/material.dart';
import 'package:scroll_widget/const/colors.dart';
import 'package:scroll_widget/layout/main_layout.dart';

class ScrollBarScreen extends StatelessWidget {
  List<int> numbers = List.generate(100, (index) => index);
  ScrollBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ScrollBar',
      body: Scrollbar(
        // 스크롤바 생성
        child: SingleChildScrollView(
          child: Column(
            children: numbers
                .map(
                  (num) => renderContainer(
                      color: colorList[num % colorList.length], index: num),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    required int? index,
    double? height,
  }) {
    if (int != null) {
      print(index);
    }

    return Container(
      color: color,
      height: height ?? 300,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
