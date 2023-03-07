import 'package:online_learning_app/export.dart';

class UserService {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<List<User>> get user {
    return user.map(
      (event) => event.toList(),
    );
  }

  getAllData() {
    dynamic data = FirebaseFirestore.instance
        .collection('cows')
        .where('uid', isEqualTo: auth.currentUser?.uid)
        .get();
    return data;
  }

  streamAllUser() {
    FirebaseFirestore.instance.collection('users').snapshots();
  }

  streamUserLogin() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .snapshots();
  }
}
