import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../widgets/app_drawer.dart';
import 'generator_view.dart';
import 'home_view.dart';
import 'history_view.dart';
import 'scanner_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeViewModel());

    return Obx(() => Scaffold(
      appBar: AppBar(
        title: const Text("QR Generator"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(controller.isDarkMode.value ? Icons.dark_mode : Icons.light_mode),
            onPressed: controller.toggleTheme,
          ),
        ],
      ),
      drawer: const AppDrawer(), // Add Drawer
      body: IndexedStack(
        index: controller.currentIndex.value,
        children: const [
          HomeView(),
          HistoryView(),
          GeneratorView(),
          ScannerView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: (index) => controller.currentIndex.value = index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "Generate"),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: "Scan"),
        ],
      ),
    ));
  }
}
