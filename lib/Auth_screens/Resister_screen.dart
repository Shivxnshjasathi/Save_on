import 'package:beavert/Screens/Controller_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../Contsints/colors.dart';
import '../Services/auth_services.dart';
import 'LOgin_screen.dart';

class Register_screen extends StatefulWidget {
  const Register_screen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Register_screen();
  }
}

class _Register_screen extends State<Register_screen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwoardController = TextEditingController();
    final TextEditingController NameController = TextEditingController();

    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.09,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      Row(
                        children: [
                          const SizedBox(),
                          Text(
                            'Glad , Register !',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.alata(
                              fontWeight: FontWeight.bold,
                              color: Ascolors,
                              fontSize: 50,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(),
                          Text(
                            'And Manage your Savings with SaveOn ',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.alata(
                              fontWeight: FontWeight.w100,
                              color: Ascolors,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                          color: boxcolor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: TextField(
                              controller: emailController,
                              style: GoogleFonts.alata(
                                fontWeight: FontWeight.w100,
                                color: Ascolors,
                                fontSize: 22,
                              ),
                              decoration: InputDecoration(
                                focusColor: Ascolors,
                                border: InputBorder.none,
                                labelText: 'Email',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                          color: boxcolor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: TextField(
                              controller: passwoardController,
                              style: GoogleFonts.alata(
                                fontWeight: FontWeight.w100,
                                color: Ascolors,
                                fontSize: 22,
                              ),
                              decoration: InputDecoration(
                                focusColor: Ascolors,
                                border: InputBorder.none,
                                labelText: 'Password',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          const SizedBox(),
                          InkWell(
                            onTap: () async {
                              await authService.createuserWithEmailAndPassword(
                                emailController.text,
                                passwoardController.text,
                              );
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: Controller_screen(),
                                  ),
                                      (route) => false);
                            },
                            child: Container(
                              width: 150,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Ascolors,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Text(
                                  'Register',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.alata(
                                    fontWeight: FontWeight.w100,
                                    color: bgcolors,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(),
                  Text(
                    'You are not a member ?',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.alata(
                      fontWeight: FontWeight.w100,
                      color: Ascolors,
                      fontSize: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: const Login_screen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Login',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.alata(
                          fontWeight: FontWeight.w100,
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
