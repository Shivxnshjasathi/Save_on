import 'package:beavert/Auth_screens/LOgin_screen.dart';
import 'package:beavert/Screens/home.dart';
import 'package:beavert/Screens/profile.dart';
import 'package:beavert/Screens/search.dart';
import 'package:beavert/Screens/upload_beat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:page_transition/page_transition.dart';

import '../Contsints/colors.dart';

class Controller_screen extends StatefulWidget {
  const Controller_screen({Key? key}) : super(key: key);

  @override
  _Controller_screen createState() => _Controller_screen();
}

Future<void> print_uid() async {
  if (currentUser != null) {
    print(currentUser?.uid);
  }
}

var currentUser = FirebaseAuth.instance.currentUser;

class _Controller_screen extends State<Controller_screen> {
  int pageIndex = 0;
  int _selectedIndex = 0;
  int current = 0;

  final pages = [
    const Home_screen(),
    const Search_screen(),
    const Upload_screen(),
  ];

  List<IconData> listOfIcons = [
    Icons.home_mini_rounded,
    Icons.search_rounded,
    Icons.savings,
  ];

  List<String> listOfStrings = ["Home", "Search", "Add"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: bgcolors,
      body: IndexedStack(
        index: current,
        children: pages,
      ),
      //pages[current],
      bottomNavigationBar: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(),
          Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 12,
                width: 283,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 30,
                      offset: Offset(0, 10),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .02),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        current = index;
                        HapticFeedback.heavyImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == current
                              ? MediaQuery.of(context).size.width * .32
                              : MediaQuery.of(context).size.width * .18,
                          alignment: Alignment.center,
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            height: index == current
                                ? MediaQuery.of(context).size.height / 15
                                : 0,
                            width: index == current
                                ? MediaQuery.of(context).size.width * .32
                                : 0,
                            decoration: BoxDecoration(
                              color: index == current
                                  ? Ascolors
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == current
                              ? MediaQuery.of(context).size.width * .31
                              : MediaQuery.of(context).size.width * .18,
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  AnimatedContainer(
                                    duration: Duration(seconds: 1),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    width: index == current
                                        ? MediaQuery.of(context).size.width *
                                            .13
                                        : 0,
                                  ),
                                  AnimatedOpacity(
                                    opacity: index == current ? 1 : 0,
                                    duration: Duration(seconds: 1),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: Text(
                                      index == current
                                          ? '${listOfStrings[index]}'
                                          : '',
                                      style: GoogleFonts.alata(
                                        fontWeight: FontWeight.bold,
                                        color: bgcolors,
                                        fontSize: 18,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  AnimatedContainer(
                                    duration: Duration(seconds: 1),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    width: index == current
                                        ? MediaQuery.of(context).size.width *
                                            .03
                                        : 20,
                                  ),
                                  Icon(
                                    listOfIcons[index],
                                    size: MediaQuery.of(context).size.width *
                                        .076,
                                    color:
                                        index == current ? bgcolors : Ascolors,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
