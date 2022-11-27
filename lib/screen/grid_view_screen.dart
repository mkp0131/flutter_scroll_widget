import 'package:flutter/material.dart';
import 'package:scroll_widget/const/colors.dart';
import 'package:scroll_widget/layout/main_layout.dart';

class GridViewScreen extends StatelessWidget {
  List<int> numbers = List.generate(100, (index) => index);

  GridViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MainLayout(
        title: 'GridViewScreen',
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100, // 하나의 item 의 최대사이즈를 정한다.
            crossAxisSpacing: 10, // 세로 Gap
            mainAxisSpacing: 10, // 가로 Gap
          ),
          itemBuilder: (context, index) => renderContainer(
            color: colorList[index % colorList.length],
            index: index,
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

  // 1. 기본사용법
  // - 모든 리스트를 한번에 render
  Widget renderDefault() {
    return GridView.count(
      crossAxisCount: 2, // 한줄에 표시할 갯수
      crossAxisSpacing: 10, // 세로 Gap
      mainAxisSpacing: 10, // 가로 Gap
      children: numbers
          .map(
            (num) => renderContainer(
              color: colorList[num % colorList.length],
              index: num,
            ),
          )
          .toList(),
    );
  }

  // 2. builder 사용
  // - 화면에 보이는 것만 render
  Widget renderBuilder() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 한줄에 표시할 갯수
        crossAxisSpacing: 10, // 세로 Gap
        mainAxisSpacing: 10, // 가로 Gap
      ),
      itemBuilder: (context, index) => renderContainer(
        color: colorList[index % colorList.length],
        index: index,
      ),
      itemCount: 100, // 갯수 제한
    );
  }

  // 3 renderAutoWidth
  // - Auto 로 width 를 정해서 가로에 들어갈 아이템의 갯수를 auto로 결정
  Widget renderAutoWidth() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100, // 하나의 item 의 최대사이즈를 정한다.
        crossAxisSpacing: 10, // 세로 Gap
        mainAxisSpacing: 10, // 가로 Gap
      ),
      itemBuilder: (context, index) => renderContainer(
        color: colorList[index % colorList.length],
        index: index,
      ),
      itemCount: 100, // 갯수 제한
    );
  }
}
