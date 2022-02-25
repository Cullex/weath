import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favourites_controller.dart';

class FavouritesView extends GetView<FavouritesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FavouritesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FavouritesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
