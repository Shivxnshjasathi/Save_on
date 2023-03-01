import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_fonts/google_fonts.dart';

import '../Contsints/colors.dart';

class Search_screen extends StatefulWidget {
  const Search_screen({Key? key}) : super(key: key);

  @override
  _Search_screen createState() => _Search_screen();
}

class _Search_screen extends State<Search_screen> {
  List User_Goal_upload = [];

  Future getBeatTypes() async {
    String? userId = auth.FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('User_Goal_upload')
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((element) {
                //print(element.data());
                var a = element.data();
                User_Goal_upload.add(a["Productname"]);

                // MyBeat_Types.add(a["Beat_Type"]);
                //print(MyBeat_Types);
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolors,
    );
  }
}
