import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zen_admin/mainscreen.dart';

class Pay {
  var rtl = false;
  payServer(context, int pnt, String id, String dropdownvalue) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({
          '$dropdownvalue': pnt,
        })
        .then((
          value,
        ) =>
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home(rt: rtl))))
        .catchError((e) {
          rtl = false;
        });
    rtl = true;
  }
}
