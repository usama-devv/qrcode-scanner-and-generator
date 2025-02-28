import 'package:get/get.dart';
import '../routes/app_routes.dart';

class SplashViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToHome();
  }

  void navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed(AppRoutes.main);  // Navigate to home screen
  }
}
