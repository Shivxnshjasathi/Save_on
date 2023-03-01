import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:page_transition/page_transition.dart';

import '../Contsints/colors.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  _Home_screen createState() => _Home_screen();
}

class _Home_screen extends State<Home_screen> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Expanded(
                  child: FutureBuilder(
                future: getBeatTypes(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: User_Goal_upload.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //context,
                              // PageTransition(
                              // type: PageTransitionType.leftToRight, child: null,
                              // child: Wardrobe2(
                              // Myarray: [MyArray[0][selected_category]],
                              //key: Key("")),
                              //  ),
                              //);
                            },
                            child: Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.15,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30)),
                                    color: Ascolors,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            User_Goal_upload[index],
                                            style: GoogleFonts.alata(
                                                color: bgcolors,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: bgcolors,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              )),
            ),
            //Padding(
            // padding: const EdgeInsets.symmetric(horizontal: 10.0),
            // child: Container( height: MediaQuery.of(context).size.height / 10,
            //     width: MediaQuery.of(context).size.height / 1.01,
            //    decoration: BoxDecoration(
            //        borderRadius: BorderRadius.circular(30),color: Ascolors)),
            //),
          ],
        ),
      ),
    );
  }
}
