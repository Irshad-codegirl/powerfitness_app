import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerfitness/models/user_model.dart';
import 'package:powerfitness/routes/app_routes.dart';
import 'package:powerfitness/services/firebase_auth_service.dart';
import 'package:powerfitness/services/firestore_service.dart';

class AuthController extends GetxController {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final FirestoreService _firestoreService = FirestoreService();

  // ---------- Signup form controllers ----------
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController signupEmailController = TextEditingController();
  final TextEditingController signupPasswordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // ---------- Login form controllers ----------
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  // ---------- Forgot password controller ----------
  final TextEditingController forgotEmailController = TextEditingController();

  RxBool isLoading = false.obs;

  // ============ NAVIGATION ============
  void goToOnboarding() => Get.back();
  void goToSignup() => Get.toNamed(AppRoutes.signup);
  void goToLogin() => Get.offNamed(AppRoutes.login);
  void goToForgotPassword() => Get.toNamed(AppRoutes.forgotPassword);
  void goToSetPassword() => Get.toNamed(AppRoutes.setPassword);
  void goToFingerprint() => Get.toNamed(AppRoutes.fingerprint);
  void goToHome() => Get.offAllNamed(AppRoutes.home);

  void _showSuccessSnack(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade700,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.check_circle, color: Colors.white),
    );
  }

  void _showErrorSnack(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.shade700,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.error_outline, color: Colors.white),
    );
  }

  // ============ EMAIL SIGNUP ============
  Future<void> signUpWithEmail() async {
    final name = fullNameController.text.trim();
    final email = signupEmailController.text.trim();
    final password = signupPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showErrorSnack('Error', 'Please fill all fields');
      return;
    }
    if (password != confirmPassword) {
      _showErrorSnack('Error', 'Passwords do not match');
      return;
    }

    try {
      isLoading.value = true;
      final credential = await _authService.signUpWithEmail(
        email: email,
        password: password,
        name: name,
      );

      final user = credential.user ?? _authService.currentUser;
      if (user != null) {
        await _firestoreService.saveUser(
          UserModel(
            uid: user.uid,
            name: name,
            email: email,
            authProvider: 'password',
          ),
        );
      }

      _showSuccessSnack('Success', 'Account created successfully');
      goToHome();
    } on FirebaseAuthException catch (e) {
      _showErrorSnack('Signup Failed', _mapFirebaseError(e.code));
    } catch (e) {
      _showErrorSnack('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ============ EMAIL LOGIN ============
  Future<void> loginWithEmail() async {
    final email = loginEmailController.text.trim();
    final password = loginPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showErrorSnack('Error', 'Please enter email and password');
      return;
    }

    try {
      isLoading.value = true;
      final userCredential = await _authService.signInWithEmail(
        email: email,
        password: password,
      );

      final user = userCredential.user ?? _authService.currentUser;
      if (user != null) {
        await _firestoreService.saveUser(
          UserModel(
            uid: user.uid,
            name: user.displayName ?? '',
            email: user.email ?? email,
            authProvider: 'password',
          ),
        );
      }

      _showSuccessSnack('Success', 'Login successful');
      goToHome();
    } on FirebaseAuthException catch (e) {
      _showErrorSnack('Login Failed', _mapFirebaseError(e.code));
    } catch (e) {
      _showErrorSnack('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ============ GOOGLE SIGN-IN ============
  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;

      final userCredential = await _authService.signInWithGoogle();
      final user = userCredential.user ?? _authService.currentUser;
      if (user != null) {
        await _firestoreService.saveUser(
          UserModel(
            uid: user.uid,
            name: user.displayName ?? '',
            email: user.email ?? '',
            authProvider: 'google',
          ),
        );
      }

      _showSuccessSnack('Success', 'Google sign-in successful');
      goToHome();
    } on FirebaseAuthException catch (e) {
      _showErrorSnack('Google Sign-In Failed', _mapFirebaseError(e.code));
    } catch (e) {
      _showErrorSnack('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ============ FORGOT PASSWORD ============
  Future<void> sendPasswordReset() async {
    final email = forgotEmailController.text.trim();
    if (email.isEmpty) {
      _showErrorSnack('Error', 'Please enter your email');
      return;
    }
    try {
      isLoading.value = true;
      await _authService.sendPasswordReset(email);
      _showSuccessSnack('Success', 'Password reset link sent to your email');
      goToSetPassword();
    } on FirebaseAuthException catch (e) {
      _showErrorSnack('Error', _mapFirebaseError(e.code));
    } finally {
      isLoading.value = false;
    }
  }

  // ============ LOGOUT ============
  Future<void> logout() async {
    await _authService.signOut();
    Get.offAllNamed(AppRoutes.login);
  }

  // ============ ERROR MESSAGES ============
  String _mapFirebaseError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already registered';
      case 'invalid-email':
        return 'Invalid email address';
      case 'weak-password':
        return 'Password is too weak (min 6 characters)';
      case 'user-not-found':
        return 'No account found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'too-many-requests':
        return 'Too many attempts, try again later';
      default:
        return 'Something went wrong. Try again';
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    signupEmailController.dispose();
    signupPasswordController.dispose();
    confirmPasswordController.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
    forgotEmailController.dispose();
    super.onClose();
  }
}
