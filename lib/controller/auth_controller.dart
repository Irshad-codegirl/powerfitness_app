import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  // ---------- Signup form controllers ----------
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController signupEmailController = TextEditingController();
  final TextEditingController signupPasswordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // ---------- Login form controllers ----------
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController =
      TextEditingController();

  // ---------- Forgot password controller ----------
  final TextEditingController forgotEmailController = TextEditingController();

  RxBool isLoading = false.obs;

  // ============ NAVIGATION ============
  void goToOnboarding() => Get.back();
  void goToSignup() => Get.toNamed('/signup');
  void goToLogin() => Get.offNamed('/login');
  void goToForgotPassword() => Get.toNamed('/forgot-password');
  void goToSetPassword() => Get.toNamed('/set-password');
  void goToFingerprint() => Get.toNamed('/fingerprint');
  void goToHome() => Get.offAllNamed('/home');

  // ============ EMAIL SIGNUP ============
  Future<void> signUpWithEmail() async {
    final name = fullNameController.text.trim();
    final email = signupEmailController.text.trim();
    final password = signupPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }
    if (password != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    try {
      isLoading.value = true;
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credential.user?.updateDisplayName(name);
      await credential.user?.reload();

      Get.snackbar('Success', 'Account created successfully');
      goToHome();
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Signup Failed', _mapFirebaseError(e.code));
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ============ EMAIL LOGIN ============
  Future<void> loginWithEmail() async {
    final email = loginEmailController.text.trim();
    final password = loginPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter email and password');
      return;
    }

    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      goToHome();
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Login Failed', _mapFirebaseError(e.code));
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ============ GOOGLE SIGN-IN (v7 API — signup aur login dono k liye) ============
  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;

      // Step 1: Authentication - account picker dikhata hai
      final GoogleSignInAccount googleUser =
          await _googleSignIn.authenticate();

      // Step 2: idToken seedha mil jata hai (synchronous getter)
      final String? idToken = googleUser.authentication.idToken;

      // Step 3: Authorization - accessToken k liye scopes maango
      final authorization = await googleUser.authorizationClient
              .authorizationForScopes(['email', 'profile']) ??
          await googleUser.authorizationClient
              .authorizeScopes(['email', 'profile']);

      final credential = GoogleAuthProvider.credential(
        idToken: idToken,
        accessToken: authorization.accessToken,
      );

      await _auth.signInWithCredential(credential);
      goToHome();
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        // User ne cancel kiya, kuch mat dikhao
        return;
      }
      Get.snackbar('Google Sign-In Failed', e.description ?? 'Try again');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Google Sign-In Failed', _mapFirebaseError(e.code));
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ============ FORGOT PASSWORD ============
  Future<void> sendPasswordReset() async {
    final email = forgotEmailController.text.trim();
    if (email.isEmpty) {
      Get.snackbar('Error', 'Please enter your email');
      return;
    }
    try {
      isLoading.value = true;
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar('Success', 'Password reset link sent to your email');
      goToSetPassword();
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', _mapFirebaseError(e.code));
    } finally {
      isLoading.value = false;
    }
  }

  // ============ LOGOUT ============
  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    Get.offAllNamed('/login');
  }

  // ============ ERROR MESSAGES (Roman Urdu/English friendly) ============
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