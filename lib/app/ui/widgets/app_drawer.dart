import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Text("QR Code App", style: TextStyle(color: Colors.white, fontSize: 22)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Get.offAllNamed('/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text("History"),
            onTap: () {
              Get.offAllNamed('/history');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Get.snackbar("Settings", "Coming soon!");
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About"),
            onTap: () {
              Get.snackbar("About", "This is a QR Code App!");
            },
          ),
        ],
      ),
    );
  }
}
