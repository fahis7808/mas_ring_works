import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/authentication/registration_page.dart';
import 'package:mas_ring_works/View/screen/authentication/verification_page.dart';
import 'package:mas_ring_works/View/screen/dashboard/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/snack_bar.dart';

class AuthenticationProvider extends ChangeNotifier {
  String phoneCode = '+91';
  int? phone;

  bool isLoaded = false;
  bool isSignedIn = false;

  String? smsCode;
  String? uid;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseStore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  signInCheck() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    isSignedIn = sharedPreferences.getBool('is_signedin') ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool("is_signedin", true);
    isSignedIn = true;
    notifyListeners();
  }

  signInWithPhone(BuildContext context) async {
    print(phone);
    String phoneNumber = phone.toString().trim();
    try {
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneCode + phoneNumber.toString(),
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            await firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            showSnackBar(context, error.message.toString());
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceResendingToken) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VerificationPage(
                          verificationId: verificationId,
                        )));
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      SnackBar(
        content: Text(e.toString()),
      );
    }
  }

  verifyOtp(
      {required BuildContext context, required String verificationId}) async {
    isLoaded = true;
    notifyListeners();
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode.toString());
      User? user = (await firebaseAuth.signInWithCredential(credential)).user;
      if (user != null) {
        uid = user.uid;
        checkExistingUser().then((value) async {
          if (value == true) {
            getDataFromFireStore().then((value) => saveUserDataSP().then(
                (value) => setSignIn().then((value) =>
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardPage())))));
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => RegistrationPage()));
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<bool> checkExistingUser() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: uid)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> getDataFromFireStore() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: uid)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final data = querySnapshot.docs[0].data() as Map<String, dynamic>;

      // _userModel = UserModel(
      //   name: data['name'],
      //   email: data['email'],
      //   profilePic: data['profilePic'],
      //   dob: data['dob'],
      //   createdAt: data['createdAt'],
      //   phoneNumber: data['phoneNumber'],
      //   uid: data['uid'],
      // );

      // _uid = _userModel?.uid;
    } else {}
  }

  Future saveUserDataSP() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // await sharedPreferences.setString(
    //     'user_model', jsonEncode(userModel.toMap()));
  }
}
