import 'package:flutter/material.dart';
import 'package:scroll_widget/const/colors.dart';
import 'package:scroll_widget/layout/main_layout.dart';

class ReorderableListViewScreen extends StatefulWidget {
  ReorderableListViewScreen({Key? key}) : super(key: key);

  @override
  State<ReorderableListViewScreen> createState() =>
      _ReorderableListViewScreenState();
}

class _ReorderableListViewScreenState extends State<ReorderableListViewScreen> {
  List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ReorderableListView',
      body: renderBuilder(),
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
      key: Key(index.toString()), // 유니크 키
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

  // 1 기본 사용
  // - 한번에 모든 것이 render
  Widget renderDefault() {
    return ReorderableListView(
      // 움직였을시 함수 실행
      onReorder: (oldIndex, newIndex) {
        setState(() {
          // length 가 넘어갔을 경우 보정 -1
          if (oldIndex < newIndex) {
            newIndex = newIndex - 1;
          }
          // 아이템을 리스트에서 추출(원본 객체 수정)
          final item = numbers.removeAt(oldIndex);
          // 아이템을 리스트에 삽입
          numbers.insert(newIndex, item);
        });
      },
      children: numbers
          .map(
            (num) => renderContainer(
                color: colorList[num % colorList.length], index: num),
          )
          .toList(),
    );
  }

  // 2. Builder 사용
  Widget renderBuilder() {
    return ReorderableListView.builder(
      itemBuilder: (context, index) => renderContainer(
          color: colorList[numbers[index] % colorList.length],
          index: numbers[index]),
      itemCount: 100,
      onReorder: (oldIndex, newIndex) {
        setState(() {
          // length 가 넘어갔을 경우 보정 -1
          if (oldIndex < newIndex) {
            newIndex = newIndex - 1;
          }
          // 아이템을 리스트에서 추출(원본 객체 수정)
          final item = numbers.removeAt(oldIndex);
          // 아이템을 리스트에 삽입
          numbers.insert(newIndex, item);
        });
      },
    );
  }
}
