import 'package:get/get.dart';
import 'package:powerfitness/controller/auth_controller.dart';
import 'package:powerfitness/controller/onboarding_controller.dart';
import 'package:powerfitness/controller/splash_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(),
      fenix: true,
    );
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
  }
}
