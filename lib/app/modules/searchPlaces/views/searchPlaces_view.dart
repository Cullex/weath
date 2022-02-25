import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/searchPlacesController.dart';

class searchPlacesView extends GetView<searchPlacesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('searchPlaces View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'searchPlaces is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
