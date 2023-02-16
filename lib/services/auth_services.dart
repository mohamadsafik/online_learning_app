import 'package:online_learning_app/export.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static bool _obscureText = true;

  Future registerUser({
    required String name,
    required String email,
    required String role,
    required String password,
  }) async {
    try {
      UserCredential _userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (_userCredential.user != null) {
        await _firestore.collection('user').add({
          "name": name,
          "email": email,
          "role": role,
          "password": password,
        });
      }

      await _userCredential.user!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('weak-password');
      } else if (e.code == 'email-already-in-use') {
        print('Email already exist');
      } else if (e.code == 'wrong-password') {
        print('wrong password');
      } else {
        print(e.code);
      }
    } catch (e) {
      rethrow;
    }
  }
}
