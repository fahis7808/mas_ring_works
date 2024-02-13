import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class FirebaseService{
  static FirebaseFirestore firebaseStore = FirebaseFirestore.instance;


  static Future<String?> getUid() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String? data = s.getString("user_model");
    if (data != null && data.isNotEmpty) {
      UserModel userModel = UserModel.fromMap(jsonDecode(data));
      return userModel.uid;
    }
    return null;
  }

 static Future<String?> getUserDocId() async {
    String? uid = await getUid();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: uid)
        .get();

    String? docId;

    if (querySnapshot.docs.isNotEmpty) {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        docId = doc.id;
      }
      return docId;
    } else {
      print("No documents found");
      return null;
    }
  }

  static Future<String> saveUserDataToFirebase(String docId,String documentName, Map<String, dynamic> modelClass) async {
    String? userDocId = await getUserDocId();
    if (userDocId != null) {
      try {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(userDocId)
            .collection(documentName).doc(docId)
            .set(modelClass);
        return "Success";
      } catch (e) {
        print("Error: $e");
        throw e;
      }
    } else {
      print("User ID not found.");
      return "User ID not found.";
    }
  }

  static Future<List<Map<String, dynamic>>> getDataFromFireStore(String documentName) async {
    String? docId = await getUserDocId();
    List<Map<String, dynamic>> dataList = [];

    if (docId != null) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(docId)
          .collection(documentName)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (DocumentSnapshot document in querySnapshot.docs) {
          final data = document.data() as Map<String, dynamic>;
          dataList.add(data);
        }
        return dataList;
      } else {
        print("No documents found in collection '$documentName'");
        return dataList; // Return an empty list
      }
    } else {
      print("User ID not found.");
      return dataList; // Return an empty list
    }
  }

  static Future<String> getDocId(String collectionName) async {
    String? docId = await getUserDocId();

    if (docId != null) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(docId)
          .collection(collectionName)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot lastDocument = querySnapshot.docs.last;
        return lastDocument.id;
      } else {
        return "";
      }
    } else {
      print("User ID not found.");
      return ""; // Return an empty list
    }
  }
}