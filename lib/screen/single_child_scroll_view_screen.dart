import 'package:flutter/material.dart';
import 'package:scroll_widget/const/colors.dart';
import 'package:scroll_widget/layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  const SingleChildScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'SingleChildScrollView',
      body: SingleChildScrollView(
        // NeverScrollableScrollPhysics() 스크롤 안됨
        physics: ClampingScrollPhysics(),
        child: Column(
          children: colorList
              .map(
                (e) => renderContainer(color: e),
              )
              .toList(),
        ),
      ),
    );
  }
}

Widget renderContainer({
  required Color color,
}) {
  return Container(
    color: color,
    height: 300,
  );
}

// 1. 기본사용
// - 화면이 넘어가면 자동으로 스크롤 된다.
Widget renderSimple() {
  return SingleChildScrollView(
    child: Column(
      children: colorList
          .map(
            (e) => renderContainer(color: e),
          )
          .toList(),
    ),
  );
}

// 2. 강제 스크롤 생성
// - 화면을 넘어가지 않아도 강제로 스크롤 생성
Widget renderAlwaysScroll() {
  return SingleChildScrollView(
    // 잘리지 않게 하기 (like, overflow: visible), 여백이 있을시 사용
    clipBehavior: Clip.none,
    // AlwaysScrollableScrollPhysics() 강제 스크롤 생성
    // NeverScrollableScrollPhysics() 스크롤 안됨, 기본값
    // BouncingScrollPhysics() 스크롤 에니메이션을 IOS 형태로 고정(AOS 에서도 IOS 형태로)
    // ClampingScrollPhysics() 스크롤 에니메이션을 AOS 형태로 고정(IOS 에서도 AOS 형태로)
    physics: AlwaysScrollableScrollPhysics(),
    child: Column(
      children: [
        renderContainer(color: Colors.black),
      ],
    ),
  );
}
