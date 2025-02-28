import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../viewmodels/generator_viewmodel.dart';

class GeneratorView extends StatefulWidget {
  const GeneratorView({super.key});

  @override
  State<GeneratorView> createState() => _GeneratorViewState();
}

class _GeneratorViewState extends State<GeneratorView> {
  final GeneratorViewModel controller = Get.put(GeneratorViewModel());
  final GlobalKey qrKey = GlobalKey(); // ✅ Ensuring a unique GlobalKey

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR Code Generator")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Enter text to generate QR Code",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Obx(
                    () => TextField(
                  controller: controller.textController.value,
                  decoration: const InputDecoration(
                    hintText: "Enter text or link",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: controller.generateQrCode,
                child: const Text("Generate QR Code"),
              ),
              const SizedBox(height: 20),
              Obx(
                    () => controller.qrData.isNotEmpty
                    ? Column(
                  children: [
                    RepaintBoundary(
                      key: qrKey, // ✅ GlobalKey for QR Code rendering
                      child: QrImageView(
                        data: controller.qrData.value,
                        size: controller.qrSize.value,
                        backgroundColor: Colors.white,
                        foregroundColor: controller.qrColor.value,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => controller.changeColor(Colors.blue),
                          child: const Text("Change Color"),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => controller.toggleLogo(!controller.showLogo.value),
                          child: const Text("Toggle Logo"),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => controller.changeSize(250),
                          child: const Text("Change Size"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => controller.saveQrCode(qrKey),
                          child: const Text("Save QR"),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => controller.shareQrCode(qrKey),
                          child: const Text("Share QR"),
                        ),
                      ],
                    ),
                  ],
                )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
