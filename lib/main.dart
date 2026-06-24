import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:powerfitness/app_routes.dart';
import 'package:powerfitness/view/auth/fingerprint_view.dart';
import 'package:powerfitness/view/auth/forgot_password_view.dart';
import 'package:powerfitness/view/auth/login_view.dart';
import 'package:powerfitness/view/auth/set_password_view.dart';
import 'package:powerfitness/view/auth/signup_view.dart';
import 'package:powerfitness/view/onboardingA1_view.dart';
import 'package:powerfitness/view/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          getPages: [
            GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
            GetPage(
              name: AppRoutes.onboardingA1,
              page: () => const OnBoardingScreen(),
            ),
            GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
            GetPage(name: AppRoutes.signup, page: () => const SignupScreen()),
            GetPage(
              name: AppRoutes.forgotPassword,
              page: () => const ForgotPasswordScreen(),
            ),
            GetPage(
              name: AppRoutes.setPassword,
              page: () => const SetPasswordScreen(),
            ),
            GetPage(
              name: AppRoutes.fingerprint,
              page: () => const FingerprintScreen(),
            ),
          ],
        );
      },
    );
  }
}
