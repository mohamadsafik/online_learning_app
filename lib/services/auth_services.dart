import 'package:online_learning_app/export.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static TextEditingController loginPasswordC = TextEditingController();
  static TextEditingController loginEmailC = TextEditingController();

  Future registerUser(
    BuildContext context, {
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
        });
      }

      await _userCredential.user!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw FirebaseException(
        message: e.code.toString(),
        plugin: e.code.toString(),
      );
      // if (e.code == 'weak-password') {
      //   print('weak-password');
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       duration: const Duration(seconds: 3),
      //       behavior: SnackBarBehavior.floating,
      //       backgroundColor: kRedColor,
      //       content: Row(
      //         children: const [
      //           Icon(Icons.beenhere_rounded, color: Colors.white),
      //           SizedBox(width: 12),
      //           Text('Your Password is too weak'),
      //         ],
      //       ),
      //     ),
      //   );
      // } else if (e.code == 'email-already-in-use') {
      //   print('Email already exist');
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       duration: const Duration(seconds: 3),
      //       behavior: SnackBarBehavior.floating,
      //       backgroundColor: kRedColor,
      //       content: Row(
      //         children: const [
      //           Icon(Icons.error, color: Colors.white),
      //           SizedBox(width: 12),
      //           Text('Email already in use'),
      //         ],
      //       ),
      //     ),
      //   );
      // } else if (e.code == 'wrong-password') {
      //   print('wrong password');
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       duration: const Duration(seconds: 3),
      //       behavior: SnackBarBehavior.floating,
      //       backgroundColor: kRedColor,
      //       content: Row(
      //         children: const [
      //           Icon(Icons.error, color: Colors.white),
      //           SizedBox(width: 12),
      //           Text('Wrong password'),
      //         ],
      //       ),
      //     ),
      //   );
      // } else {
      //   print(e.code);
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       duration: const Duration(seconds: 3),
      //       behavior: SnackBarBehavior.floating,
      //       backgroundColor: kRedColor,
      //       content: Row(
      //         children: [
      //           const Icon(Icons.error, color: Colors.white),
      //           const SizedBox(width: 12),
      //           Text(e.code.toString()),
      //         ],
      //       ),
      //     ),
      //   );
      // }
    } catch (e) {
      throw FirebaseException(plugin: e.toString(), message: e.toString());
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     duration: const Duration(seconds: 3),
      //     behavior: SnackBarBehavior.floating,
      //     backgroundColor: kRedColor,
      //     content: Row(
      //       children: [
      //         const Icon(Icons.error, color: Colors.white),
      //         const SizedBox(width: 12),
      //         Text(e.toString()),
      //       ],
      //     ),
      //   ),
      // );
      // rethrow;
    }
  }
}
