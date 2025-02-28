import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  var qrOptions = [
    {"title": "Payment", "icon": Icons.payment, "route": "/generator"},
    {"title": "WiFi", "icon": Icons.wifi, "route": "/generator"},
    {"title": "Image QR", "icon": Icons.image, "route": "/generator"},
    {"title": "Text", "icon": Icons.text_fields, "route": "/generator"},
    {"title": "Contact", "icon": Icons.contacts, "route": "/generator"},
    {"title": "Email", "icon": Icons.email, "route": "/generator"},
    {"title": "SMS", "icon": Icons.sms, "route": "/generator"},
    {"title": "Location", "icon": Icons.location_on, "route": "/generator"},
    {"title": "Event", "icon": Icons.event, "route": "/generator"},
    {"title": "Website", "icon": Icons.link, "route": "/generator"},
    {"title": "Barcode", "icon": Icons.qr_code_scanner, "route": "/scanner"},
    {"title": "Scan QR", "icon": Icons.qr_code, "route": "/scanner"},
  ].obs;

  var currentIndex = 0.obs; // Bottom Navigation Index
  var isDarkMode = false.obs; // Theme Mode

  // Toggle Theme
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  // Change Tab Index
  void changeTab(int index) {
    currentIndex.value = index;
  }
}
