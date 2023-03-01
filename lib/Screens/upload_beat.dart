import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../Contsints/colors.dart';
import '../modal/user_modal.dart';
import 'Controller_screen.dart';

class Upload_screen extends StatefulWidget {
  const Upload_screen({Key? key}) : super(key: key);

  @override
  _Upload_screen createState() => _Upload_screen();
}

class _Upload_screen extends State<Upload_screen> {
  @override
  Widget build(BuildContext context) {
    Future<String?> adddata({
      String? id,
      String? Productname,
      String? ProductPrice,
      String? TimeDuration,
    }) async {
      String? userId = auth.FirebaseAuth.instance.currentUser?.uid;
      FirebaseFirestore _firestore = FirebaseFirestore.instance;

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('User_Goal_upload')
          .add({
        "id": userId,
        "Productname": Productname,
        "ProductPrice": ProductPrice,
        "TimeDuration": TimeDuration,
      });
    }

    final TextEditingController ProductnameController = TextEditingController();
    final TextEditingController ProductPriceController =
        TextEditingController();
    final TextEditingController TimeDurationController =
        TextEditingController();

    return Scaffold(
      backgroundColor: bgcolors,
      body: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(),
                Row(children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.15,
                    height: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Ascolors),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width / 1.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Ascolors),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0),
                              child: TextField(
                                controller: ProductnameController,
                                style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w100,
                                  color: bgcolors,
                                  fontSize: 40,
                                ),
                                decoration: InputDecoration(
                                  focusColor: Ascolors,
                                  border: InputBorder.none,
                                  labelText: "Goal",
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Ascolors),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    child: TextField(
                                      controller: ProductPriceController,
                                      style: GoogleFonts.alata(
                                        fontWeight: FontWeight.w100,
                                        color: bgcolors,
                                        fontSize: 20,
                                      ),
                                      decoration: InputDecoration(
                                        focusColor: Ascolors,
                                        border: InputBorder.none,
                                        labelText: "Price",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Ascolors),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: TextField(
                                    controller: TimeDurationController,
                                    style: GoogleFonts.alata(
                                      fontWeight: FontWeight.w100,
                                      color: bgcolors,
                                      fontSize: 20,
                                    ),
                                    decoration: InputDecoration(
                                      focusColor: Ascolors,
                                      border: InputBorder.none,
                                      labelText: "Duration",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            await adddata(
                              id: currentUser?.uid,
                              Productname: ProductnameController.text,
                              ProductPrice: ProductPriceController.text,
                              TimeDuration: TimeDurationController.text,
                            );

                            print("Uploaded");
                          },
                          child: Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width / 2.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: bgcolors),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Set',
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.alata(
                                          fontWeight: FontWeight.w100,
                                          color: Ascolors,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        'Goal',
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.alata(
                                          fontWeight: FontWeight.bold,
                                          color: Ascolors,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.airplane_ticket,
                                    size: 35,
                                    color: Ascolors,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }



}
