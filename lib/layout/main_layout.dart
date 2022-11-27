import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final String title;
  final Widget body;
  const MainLayout({
    required this.title,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true, // 타이틀 위치 센터(IOS, ANDROID 기본세팅이 다를 수 있기에 필수)
      ),
      body: body,
    );
  }
}
