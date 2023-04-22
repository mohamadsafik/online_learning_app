import 'package:online_learning_app/export.dart';

class UserService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("user");

  Future<UserModel> getUserById(String uid) async {
    try {
      DocumentSnapshot snapshot = await _userCollection.doc(uid).get();
      return UserModel(
        uid: uid,
        email: snapshot['email'],
        name: snapshot['name'],
        role: snapshot['role'],
      );
    } catch (e) {
      rethrow;
    }
  }

  Stream<QuerySnapshot<Object?>> getAllUser() {
    try {
      Stream<QuerySnapshot<Object?>> snapshot = _userCollection.snapshots();
      return snapshot;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteData(String uid) async {
    await _userCollection.doc(uid).delete();
  }
}
