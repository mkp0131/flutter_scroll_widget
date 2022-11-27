import 'package:flutter/material.dart';
import 'package:scroll_widget/const/colors.dart';
import 'package:scroll_widget/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  List<int> numbers = List.generate(100, (index) => index);
  ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ListView',
      body: renderDefault(),
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

  // 1. 기본사용
  // - 한번에 모든 리스트를 다 render (column 과 동일, 사용 X)
  Widget renderDefault() {
    return ListView(
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
  Widget renderBuild() {
    return ListView.builder(
      itemCount: 10, // 반복할 아이템 총 갯수(값이 없으면 infinity)
      itemBuilder: (context, index) => renderContainer(
        color: colorList[index % colorList.length],
        index: index,
      ),
    );
  }

  // 3. 중간에 위젯 추가
  Widget renderSeparator() {
    return ListView.separated(
      itemCount: 100, // 반복할 아이템 총 갯수(값이 없으면 infinity)
      itemBuilder: (context, index) => renderContainer(
        color: colorList[index % colorList.length],
        index: index,
      ),
      // item 을 분리하는 separator 랜더
      separatorBuilder: (context, index) {
        return (index + 1) % 5 == 0
            ? renderContainer(
                color: Colors.black,
                index: index,
                height: 100,
              )
            : Container();
      },
    );
  }
}
