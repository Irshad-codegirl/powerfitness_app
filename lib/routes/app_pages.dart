import 'package:get/get.dart';
import 'package:powerfitness/routes/app_routes.dart';
import 'package:powerfitness/view/auth/fingerprint_view.dart';
import 'package:powerfitness/view/auth/forgot_password_view.dart';
import 'package:powerfitness/view/auth/login_view.dart';
import 'package:powerfitness/view/auth/set_password_view.dart';
import 'package:powerfitness/view/auth/signup_view.dart';
import 'package:powerfitness/view/onboarding_a1_view.dart';
import 'package:powerfitness/view/splash_view.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnBoardingScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.setPassword,
      page: () => const SetPasswordScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.fingerprint,
      page: () => const FingerprintScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
