import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Contsints/colors.dart';

class Profile_screen extends StatefulWidget {
  const Profile_screen({Key? key}) : super(key: key);

  @override
  _Profile_screen createState() => _Profile_screen();
}

class _Profile_screen extends State<Profile_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolors,
      body: Center(
        child: Text(
          'Profile',
          textAlign: TextAlign.start,
          style: GoogleFonts.alata(
            fontWeight: FontWeight.w100,
            color: Ascolors,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
