import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uig/screens/authentication_screens/login_screen.dart';
import 'package:uig/screens/home_screen.dart/home_screen.dart';
import 'package:uig/screens/splash_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialView);

    //Rx - Observable Keyword - Continously Checking Variable Is Changing Or Not.
  }

  _setInitialView(User? user) {
    if (user == null) {
      Get.offAll(() => SplashScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }
}
