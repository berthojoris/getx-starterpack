import 'package:digital/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  void goToLoginScreen() {
    Get.offAllNamed(Routes.LOGIN);
  }
}
