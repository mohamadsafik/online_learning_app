import 'package:online_learning_app/export.dart';
import 'package:online_learning_app/services/user_services.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserModel> registerUser({
    required String name,
    required String email,
    required String role,
    required String password,
    required String createdAt,
  }) async {
    try {
      //create account with email and password to firebase auth
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //assigning to model
      UserModel user = UserModel(
        uid: userCredential.user!.uid,
        email: email,
        name: name,
        role: role,
      );

      //create data displayName to firebaseAuth
      auth.currentUser!.updateDisplayName(name);

      //Storing data to firestore if data isn't null / Set User
      if (userCredential.user != null) {
        await firestore.collection("user").doc(userCredential.user!.uid).set({
          "name": name,
          "email": email,
          "role": role,
          "createdAt": createdAt
        });
        //Send email verification
        await userCredential.user!.sendEmailVerification();
      }

      //returning Data
      return user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseException(
        message: e.code.toString(),
        plugin: e.code.toString(),
      );
    } catch (e) {
      throw FirebaseException(plugin: e.toString(), message: e.toString());
    }
  }

  Future<UserModel> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user = await UserService().getUserById(
        userCredential.user!.uid,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseException(
        message: e.code.toString(),
        plugin: e.code.toString(),
      );
    } catch (e) {
      throw FirebaseException(
        plugin: e.toString(),
        message: e.toString(),
      );
    }
  }

  Future sendResetPassword({
    required String email,
  }) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseException(
        message: e.code.toString(),
        plugin: e.code.toString(),
      );
    } catch (e) {
      throw FirebaseException(
        plugin: e.toString(),
        message: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw FirebaseException(
        message: e.code.toString(),
        plugin: e.code.toString(),
      );
    } catch (e) {
      throw FirebaseException(
        plugin: e.toString(),
        message: e.toString(),
      );
    }
  }
}
