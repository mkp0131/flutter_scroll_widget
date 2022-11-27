import 'package:flutter/material.dart';
import 'package:scroll_widget/const/colors.dart';

class CustomScrollViewScreen extends StatelessWidget {
  List<int> numbers = List.generate(100, (index) => index);
  CustomScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 여러 레이아웃을 연결하여 사용
          renderSliverAppBar(),
          renderChildSliverGridAuto(),
          renderChildSliverGrid(),
        ],
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

  // 1 기본사용
  // Appbar 도 같이 스크롤되는 레이아웃 CustomScrollView()
  // 모든 아이템이 한번에 render
  Widget renderDefault() {
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (num) => renderContainer(
                color: colorList[num % colorList.length],
                index: num,
              ),
            )
            .toList(),
      ),
    );
  }

  // 2 Builder 사용
  // 화면에 보이는 아이템만 render
  Widget renderBuilder() {
    return SliverList(
      // SliverChildBuilderDelegate 를 사용하여 보이는 아이템만 render
      delegate: SliverChildBuilderDelegate(
        (context, index) => renderContainer(
          color: colorList[index % colorList.length],
          index: index,
        ),
        childCount: 100, // 전체 아이템 갯수
      ),
    );
  }

  // 3 Grid Sliver 사용
  // GridView.count 와 유사함
  // 한번에 모든 아이템 render
  Widget renderChildSliverGrid() {
    return SliverGrid(
      // 그리드 형태로 배치
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (num) => renderContainer(
                color: colorList[num % colorList.length],
                index: num,
              ),
            )
            .toList(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 한줄에 넣을 아이템 갯수
      ),
    );
  }

  // 4 Grid Sliver Builder 사용 (Auto 그리드)
  // 아이템의 최대 넓이 지정
  // 보이는 아이템 render
  Widget renderChildSliverGridAuto() {
    return SliverGrid(
      // 그리드 형태로 배치
      // builder 사용
      delegate: SliverChildBuilderDelegate(
        (context, index) => renderContainer(
          color: colorList[index % colorList.length],
          index: index,
        ),
        childCount: 100, // 전체 아이템 갯수
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100, // 아이템 하나당 넓이
      ),
    );
  }

  Widget renderSliverAppBar() {
    return SliverAppBar(
      floating: true, // true: 스크롤을 올릴때 다시 Appbar 를 나타내기
      pinned: false, // true: 스크롤 시에도 Appbar 가 고정되어있다.
      snap: true, // true: 조금만 움직여도 자석처럼 에니메이션이 실행된다.
      // 즉, Appbar 가 중간에 걸치는 일이 없다. floating이 true 일때만 작동
      stretch:
          false, // ture: 밑으로 스크롤시 하얀색 배경이 보이는 것이 아닌, Appbar의 높이가 늘어난다.(모양이 별로 좋진 않은듯?)
      expandedHeight: 200, // AppBar의 기본 사이즈(모양이 별로 좋진 않은듯?)
      collapsedHeight: 150, // AppBar가 밀려들어가는 구간 설정(모양이 별로 좋진 않은듯?)
      flexibleSpace: FlexibleSpaceBar(
        // AppBar의 여백공간에 위젯을 넣을 수 있다.
        title: Text('FlexibleSpaceBar'),
        // ✅ 중요! Appbar에 백그라운드를 넣을 수 있다.
        background: Image.asset(
          'assets/images/bg.jpeg',
          fit: BoxFit.cover,
        ),
      ),
      title: Text('SliverAppBar'),
    );
  }
}
