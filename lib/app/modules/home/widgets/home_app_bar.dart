import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      // expandedHeight: Get.height * 0.33,
      // flexibleSpace: FlexibleSpaceBar(),
      floating: true,
      pinned: true,
    );
  }
}
