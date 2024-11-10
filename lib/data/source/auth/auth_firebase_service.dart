import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_spotify_clone/data/model/auth/sign_in_request.dart';
import 'package:flutter_spotify_clone/data/model/auth/sign_up_request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spotify_clone/domain/entity/auth/user.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserRequest createUserReq);
  Future<Either> signIn(SignInRequest signInReq);
  Future<Either> getCurrentUser();
  Future<void> signOut();
}

class AuthFirebaseImpl extends AuthFirebaseService {
  @override
  Future<Either> signIn(SignInRequest signInReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signInReq.email.toString(),
          password: signInReq.password.toString());
      return const Right('Sign in success!');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'Not user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Invalid Password';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signUp(CreateUserRequest createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

      FirebaseFirestore.instance.collection('users').add({
        'id': data.user?.uid,
        'email': data.user?.email.toString(),
        'fullName': createUserReq.fullName,
        'createdAt': DateTime.now(),
      });

      return const Right('Signup success!');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> getCurrentUser() async {
    UserEntity userEntity;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      User? usr = _auth.currentUser;
      if (usr != null) {
        // Get the user's email
        String userEmail = usr.email!;

        // Query Firestore for a document in the users collection with this email
        QuerySnapshot querySnapshot = await _firestore
            .collection('users')
            .where('email', isEqualTo: userEmail)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          // Assuming there is only one document per email
          DocumentSnapshot userDoc = querySnapshot.docs.first;

          return Right(UserEntity(
            email: userDoc.get('email'),
            fullName: userDoc.get('fullName'),
          ));
        } else {
          return const Left('No user found with this email.');
        }
      } else {
        return const Left('No user is currently signed in.');
      }
    } catch (e) {
      return Left("Error fetching user data: $e");
    }
  }

  @override
  Future<void> signOut() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
  }
}
