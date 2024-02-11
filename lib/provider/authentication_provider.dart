import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/authentication/registration_page.dart';
import 'package:mas_ring_works/View/screen/authentication/verification_page.dart';
import 'package:mas_ring_works/View/screen/dashboard/dashboard_screen.dart';
import 'package:mas_ring_works/model/user_model.dart';
import 'package:mas_ring_works/util/upload_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/snack_bar.dart';

class AuthenticationProvider extends ChangeNotifier {
  String phoneCode = '+91';
  // int? phone;

  bool isLoaded = false;
  bool isSignedIn = false;

  String? smsCode;
  String? uid;
  File? image;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseStore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  AuthenticationProvider(){
    signInCheck();
  }

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

  Future<void> signInWithPhone(BuildContext context) async {
    try {
      final String normalizedPhoneNumber = phoneCode + userData.phoneNumber!.trim();
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: normalizedPhoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await firebaseAuth.signInWithCredential(phoneAuthCredential);
          // Authentication successful, you might want to navigate to a new screen here
        },
        verificationFailed: (FirebaseAuthException error) {
          showSnackBar(context, error.message.toString());
          // Handle verification failed, such as showing an error message
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerificationPage(verificationId: verificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle code auto retrieval timeout if needed
        },
      );
    } catch (e) {
      print("Error occurred: $e");
      showSnackBar(context, "An error occurred. Please try again later.");
      // Handle other exceptions if needed
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

  /// /// /// Registration /// /// ///

  UserModel userData = UserModel();

  selectImage(BuildContext context) async {
    image = await pickImage(context);
    notifyListeners();
  }


reg(){
    print(userData);
    print(firebaseAuth.currentUser!.phoneNumber!);
}
  registerData(BuildContext context) async {
    // UploadTask uploadTask =
    // firebaseStorage.ref().child('profilePic/$uid').putFile(image);
    // TaskSnapshot snapshot = await uploadTask;
    // String downloadUrl = await snapshot.ref.getDownloadURL();
    UserModel userModel = UserModel(
      name: userData.name,
        businessName: userData.businessName,
        email: userData.email,
        createdAt: DateTime.now().microsecondsSinceEpoch.toString(),
        phoneNumber: firebaseAuth.currentUser!.phoneNumber!,
        uid: firebaseAuth.currentUser!.uid);
    print(userModel);
    // if (image != null) {
      // ignore: use_build_context_synchronously
      saveUserDataToFirebase(
          context: context,
          userModel: userModel,
          // profilePic: image!,
          onSuccess: () {
            saveUserDataSP().then(
                  (value) => setSignIn().then(
                    (value) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardPage(),
                    ),
                        (route) => false),
              ),
            );
          });
    // } else {
    //   // ignore: use_build_context_synchronously
    //   showSnackBar(context, 'Please Add an Image');
    // }
  }

  bool loaded = false;

  saveUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    // required File profilePic,
    required Function onSuccess,
  }) async {
    loaded = true;
    notifyListeners();

    try {
      // storeFiletToStorage('profilePic/$uid').then((value) {
      //   // userModel.profilePic = value;
      //   userModel.createdAt = DateTime.now().microsecondsSinceEpoch.toString();
      //   userModel.phoneNumber = firebaseAuth.currentUser!.phoneNumber!;
      //   userModel.uid = firebaseAuth.currentUser!.uid;
      // });

      userData = userModel;
      await firebaseStore
          .collection('users')
          .doc(uid)
          .set(userModel.toMap())
          .then((value) {
        onSuccess();
        loaded = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
        loaded = false;
      showSnackBar(context, e.toString());
      notifyListeners();
    }
  }

  Future<String> storeFiletToStorage(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future getDataFromSP() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.getString("user_model") ?? '';
    userData = UserModel.fromMap(jsonDecode(data));
    uid = userData.uid;
    notifyListeners();
  }

}
