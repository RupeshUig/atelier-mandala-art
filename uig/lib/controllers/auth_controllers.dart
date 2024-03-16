import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  void signUp(
    String username,
    String password,
    String email,
  ) async {
    try {
      if (username.isNotEmpty && password.isNotEmpty && email.isNotEmpty) {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
      } else {
        Get.snackbar("Error Creating Account", "Please fill all fields");
      }
    } catch (e) {
      Get.snackbar("Error Occured", e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Get.snackbar("Success", "Logged in successfully");
      } else {
        Get.snackbar("Error Logging In", "Please enter your details correctly");
      }
    } catch (e) {
      Get.snackbar("Error logging in", e.toString());
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
