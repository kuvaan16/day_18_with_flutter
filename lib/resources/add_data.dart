import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData({
    required String name,
    required String phoneNo,
    required Uint8List file,
  }) async {
    String resp = " Some Error Occurred";
    try {
      if (name != null || phoneNo != null) {
        String imageUrl = await uploadImageToStorage('profile', file);
        await _firestore.collection('userProfile').add({
          'name': name,
          'phoneNo': phoneNo,
          'imageLink': imageUrl,
        });
        resp = 'success';
      }
    } catch (er) {
      resp = er.toString();
    }
    return resp;
  }
}
