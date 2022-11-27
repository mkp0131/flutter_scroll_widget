import 'package:flutter/material.dart';
import 'package:scroll_widget/layout/main_layout.dart';
import 'package:scroll_widget/screen/custom_scroll_view_screen.dart';
import 'package:scroll_widget/screen/grid_view_screen.dart';
import 'package:scroll_widget/screen/list_view_screen.dart';
import 'package:scroll_widget/screen/reorderable_list_view_screen.dart';
import 'package:scroll_widget/screen/single_child_scroll_view_screen.dart';

class ScreenModel {
  final WidgetBuilder builder;
  final String title;

  ScreenModel({
    required this.builder,
    required this.title,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Home',
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  final screens = [
    ScreenModel(
        builder: (_) => SingleChildScrollViewScreen(),
        title: 'SingleChildScrollView'),
    ScreenModel(builder: (_) => ListViewScreen(), title: 'ListViewScreen'),
    ScreenModel(builder: (_) => GridViewScreen(), title: 'GreedViewScreen'),
    ScreenModel(
        builder: (_) => ReorderableListViewScreen(),
        title: 'ReorderableListView'),
    ScreenModel(
        builder: (_) => CustomScrollViewScreen(), title: 'CustomScrollView'),
  ];

  _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: screens
            .map(
              (screen) => ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: screen.builder,
                    ),
                  );
                },
                child: Text(screen.title),
              ),
            )
            .toList(),
      ),
    );
  }
}
