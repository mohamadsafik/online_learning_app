import 'package:online_learning_app/export.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserModel> registerUser({
    required String name,
    required String email,
    required String role,
    required String password,
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
      userCredential.user!.updateDisplayName(name);

      //Storing data to firestore if data isn't null / Set User
      if (userCredential.user != null) {
        await firestore.collection("user").doc(userCredential.user!.uid).set({
          "uid": userCredential.user!.uid,
          "name": name,
          "email": email,
          "role": role,
          "createdAt": DateTime.now().toIso8601String()
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
      //login account with email and password to firebase auth
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //Getting data for user login
      UserModel user = await UserService().getUserById(
        userCredential.user!.uid,
      );
      //returning the data data
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

  Future<UserModel> checkLoginUser() async {
    try {
      //Getting data for user login
      UserModel user = await UserService().getUserById(
        auth.currentUser!.uid,
      );
      //returning the data data
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
