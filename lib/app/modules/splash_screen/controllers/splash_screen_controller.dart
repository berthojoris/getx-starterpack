import 'package:digital/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void goToLoginScreen() {
    Get.offAllNamed(Routes.LOGIN);
  }

  RxBool loadingStatus = true.obs;
  void login() async {
    //
  }

  void register() async {
    //
  }

  void forgotPassword() async {
    //
  }
}
