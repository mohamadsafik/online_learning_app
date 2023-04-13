import 'dart:math';

import 'package:online_learning_app/export.dart';
import 'package:online_learning_app/models/course_model.dart';

class CourseService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference _courseCollection =
      FirebaseFirestore.instance.collection("course");

  String generateRandomString(int lengthOfString) {
    final random = Random();
    const allChars =
        'AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890';
    // below statement will generate a random string of length using the characters
    // and length provided to it
    final randomString = List.generate(lengthOfString,
        (index) => allChars[random.nextInt(allChars.length)]).join();
    return randomString; // return the generated string
  }

  Future<CourseModel> addNewCourse({
    required String title,
    required String description,
    required String category,
  }) async {
    try {
      //make a random string for uid
      final String generateUid = generateRandomString(28);

      //Assigning to model Course
      CourseModel course = CourseModel(
        uid: generateUid,
        uidAuthor: auth.currentUser!.uid,
        title: title,
        description: description,
        category: category,
        authorName: auth.currentUser!.displayName!,
      );

      //Storing data to firestore if data isn't null / Set Course
      await firestore.collection("course").doc(generateUid).set({
        "uid": generateUid,
        "uidAuthor": auth.currentUser!.uid,
        "title": title,
        "description": description,
        "category": category,
        "authorName": auth.currentUser!.displayName!,
      });

      //returning Data
      return course;
    } on FirebaseAuthException catch (e) {
      throw FirebaseException(
        message: e.code.toString(),
        plugin: e.code.toString(),
      );
    } catch (e) {
      throw FirebaseException(plugin: e.toString(), message: e.toString());
    }
  }

  Future<CourseModel> getCourseById(String uid) async {
    try {
      DocumentSnapshot snapshot = await _courseCollection.doc(uid).get();
      return CourseModel(
        uid: uid,
        uidAuthor: snapshot['uid'],
        title: snapshot['title'],
        category: snapshot['category'],
        description: snapshot['description'],
        authorName: snapshot['authorName'],
      );
    } catch (e) {
      rethrow;
    }
  }

  Stream<QuerySnapshot<Object?>> getAllCourse() {
    try {
      Stream<QuerySnapshot<Object?>> snapshot = _courseCollection.snapshots();
      return snapshot;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteData(String uid) async {
    await _courseCollection.doc(uid).delete();
  }
}