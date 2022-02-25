import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_weather/app/widgets/alert_widget.dart';
import 'package:just_weather/app/widgets/shimmer_content.dart';

import '../controllers/home_controller.dart';
import '../widgets/home_widgets.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ShimmerContent(
            CustomScrollView(slivers: [
              HomeBody(
                backgroundImage: controller.dayConfig['backgroundImage'],
                backgroundPosition: controller.dayConfig['backgroundPosition'],
                skyObjectColor: controller.dayConfig['skyObjectColor'],
                skyObjectPosition: controller.dayConfig['skyObjectPosition'],
                skyObjectOpacity: controller.dayConfig['skyObjectOpacity'] ?? 0.85,
                children: [Alert.error(message: controller.error)],
              ),
            ]),
            loading: controller.loading,
          )),
      extendBodyBehindAppBar: true,
    );
  }
}
