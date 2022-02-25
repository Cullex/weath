import 'package:get/get.dart';

import '../controllers/searchPlacesController.dart';

class searchPlacesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<searchPlacesController>(
      () => searchPlacesController(),
    );
  }
}
