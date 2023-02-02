import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zen_admin/mainscreen.dart';

class PayCoin {
  var rtl = false;
  payServer(context, int cin, String id) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({
          'coins': cin,
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
