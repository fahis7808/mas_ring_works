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

 static Future<String?> getDocId() async {
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

  static Future<String> saveUserDataToFirebase(String documentName, Map<String, dynamic> modelClass) async {
    String? docId = await getDocId();
    if (docId != null) {
      try {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(docId)
            .collection(documentName)
            .add(modelClass);
        return "Success";
      } catch (e) {
        print("Error: $e");
        throw e;
      }
    } else {
      print("User ID not found.");
      return "User ID not found."; // Return an error message or any other indication
    }
  }

  static Future<List<Map<String, dynamic>>> getDataFromFireStore(String documentName) async {
    String? docId = await getDocId();
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



}