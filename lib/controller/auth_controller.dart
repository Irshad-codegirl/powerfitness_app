import 'package:get/get.dart';
import 'package:powerfitness/routes/app_routes.dart';

class AuthController extends GetxController {
  void goToOnboarding() => Get.toNamed(AppRoutes.onboarding);

  void goToLogin() => Get.toNamed(AppRoutes.login);

  void goToSignup() => Get.toNamed(AppRoutes.signup);

  void goToForgotPassword() => Get.toNamed(AppRoutes.forgotPassword);

  void goToSetPassword() => Get.toNamed(AppRoutes.setPassword);

  void goToFingerprint() => Get.toNamed(AppRoutes.fingerprint);
}
