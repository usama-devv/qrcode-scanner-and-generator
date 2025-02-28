import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class GeneratorViewModel extends GetxController {
  var textController = TextEditingController().obs;
  var qrData = ''.obs;
  var qrColor = Colors.black.obs;
  var showLogo = false.obs;
  var qrSize = 200.0.obs;

  void generateQrCode() {
    if (textController.value.text.isNotEmpty) {
      qrData.value = textController.value.text;
    } else {
      Get.snackbar("Error", "Please enter text to generate a QR code",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void changeColor(Color newColor) {
    qrColor.value = newColor;
  }

  void toggleLogo(bool value) {
    showLogo.value = value;
  }

  void changeSize(double size) {
    qrSize.value = size;
  }

  Future<void> saveQrCode(GlobalKey key) async {
    try {
      RenderRepaintBoundary boundary =
      key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final directory = await getApplicationDocumentsDirectory();
      final filePath = "${directory.path}/qr_code.png";
      final file = File(filePath);
      await file.writeAsBytes(pngBytes);

      Get.snackbar("Success", "QR Code saved successfully!",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", "Failed to save QR Code",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> shareQrCode(GlobalKey key) async {
    try {
      RenderRepaintBoundary boundary =
      key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final directory = await getApplicationDocumentsDirectory();
      final filePath = "${directory.path}/qr_code.png";
      final file = File(filePath);
      await file.writeAsBytes(pngBytes);

      if (await file.exists()) {
        await Share.shareXFiles([
          XFile(file.path),
        ], text: "Here is your QR Code!");
      } else {
        Get.snackbar("Error", "QR Code file not found!");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to share QR Code: $e");
    }
  }
  }
