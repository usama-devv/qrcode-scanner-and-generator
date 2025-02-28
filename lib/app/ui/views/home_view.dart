import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../widgets/grid_item.dart'; // Import the GridItem widget

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeViewModel());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
          itemCount: controller.qrOptions.length,
          itemBuilder: (context, index) {
            var item = controller.qrOptions[index];
            return GridItem(
              icon: item['icon'] as IconData,
              title: item['title'] as String,
              route: item['route'] as String,
            );
          },
        )),
      ),
    );
  }
}
