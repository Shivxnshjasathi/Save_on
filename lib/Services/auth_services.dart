import 'package:beavert/modal/user_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(credential.user);
  }

  Future<User?> createuserWithEmailAndPassword(
      String email, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (user != null) {
      String? userId = auth.FirebaseAuth.instance.currentUser?.uid;

      await _firestore.collection('users').doc(userId).set({
        "email": email,
      });

      await addusers(id: userId, email: email);
    }

    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<String?> addusers({String? id, String? email}) async {
    String? userId = auth.FirebaseAuth.instance.currentUser?.uid;
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('user_details')
        .add({'id ': id, 'email': email, 'date': DateTime.now()});
  }

  Future<String?> adddata({
    String? id,
    String? Beatname,
    String? Beatbpm,
    String? Beatpitch,
    String? Lyric,
    String? Beatproducer,
    String? Beatduration,
    String? Beattype,
  }) async {
    String? userId = auth.FirebaseAuth.instance.currentUser?.uid;
    await _firestore.collection('users')
        .doc(userId)
        .collection('user_details').add({
      "id" : userId,
      "Beatname": Beatname,
      "Beatbpm": Beatbpm,
      "Beatpitch": Beatpitch,
      "Lyric": Lyric,
      "Beatproducer": Beatproducer,
      "Beatduration": Beatduration,
      "Beattype" : Beattype,
    });
  }
}
