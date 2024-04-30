import 'package:fliqlist/auth_service.dart';
import 'package:fliqlist/constants.dart';
import 'package:fliqlist/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 105),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Text(
                      "Hello",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                    Positioned(
                      top: 70,
                      left: 5,
                      child: Text(
                        "There",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 225,
                      child: Text(
                        ".",
                        style: GoogleFonts.montserrat(
                            color: const Color(0xFFE50914),
                            fontSize: 70,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 125,
                ),
                TextFormField(
                    controller: _emailController,
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE50914)),
                        ))),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE50914)),
                        ))),
                GestureDetector(
                  onTap: () async {
                    final message = await AuthService().userLogin(
                        email: _emailController.text,
                        password: _passwordController.text);

                    if (message == "Success") {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("email", _emailController.text);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const MyHomePage(title: "FliqList", index: 0)));
                    }
                  },
                  child: Container(
                      margin: const EdgeInsets.only(top: 70, bottom: 25),
                      height: 50.0,
                      child: Material(
                          borderRadius: BorderRadius.circular(25.0),
                          shadowColor: Colors.redAccent,
                          color: const Color(0xFFE50914),
                          elevation: 7.0,
                          child: Center(
                              child: Text(
                            'LOGIN',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )))),
                ),
                GestureDetector(
                  onTap: () {
                    // AuthService().fbSignIn();
                  },
                  child: Container(
                      height: 50.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Center(
                              child: Icon(
                                FontAwesomeIcons.google,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Center(
                                child: Text('Login with Google',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ),
                const SizedBox(height: 25.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('New to FliqList ?',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 5.0),
                  InkWell(
                      onTap: () {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) => SignupPage()));
                      },
                      child: Text('Register',
                          style: GoogleFonts.montserrat(
                              color: const Color(0xFFE50914),
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              decorationColor: const Color(0xFFE50914),
                              fontWeight: FontWeight.bold)))
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
