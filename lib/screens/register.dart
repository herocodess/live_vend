import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_vend/utils/constants.dart';
import 'package:live_vend/utils/margin.dart';
import 'package:live_vend/utils/navigation.dart';

import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = "",
      pass = "",
      fullName = "",
      phone = "",
      company = "",
      def = "";
  var tfController = TextEditingController();
  int finalState = 4;
  int loginState = 0;

  bool _obscureText = true;

  initState() {
    super.initState();
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget buildSvgs() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset('images/logo.png'),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset('images/structure.png'),
          )
        ],
      ),
    );
  }

  Widget buildTFs() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Register',
              style: GoogleFonts.nunitoSans(
                  fontSize: 26, fontWeight: FontWeight.bold, color: whiteColor),
            ),
            const YMargin(15),
            Text(
              "Enter your ${loginState == 0 ? "Full Name" : loginState == 1 ? "Email Address" : loginState == 2 ? "Phone Number" : loginState == 3 ? "Company" : loginState == finalState ? "Password" : null}",
              style: GoogleFonts.nunitoSans(fontSize: 18, color: whiteColor),
            ),
            const YMargin(10),
            TextFormField(
              controller: tfController,
              style: GoogleFonts.nunitoSans(color: Colors.white54),
              cursorColor: tfColor,
              keyboardType: loginState == 0
                  ? TextInputType.text
                  : loginState == 1
                      ? TextInputType.emailAddress
                      : loginState == 2
                          ? TextInputType.phone
                          : loginState == 3
                              ? TextInputType.text
                              : loginState == finalState
                                  ? TextInputType.text
                                  : null,
              keyboardAppearance: Brightness.light,
              decoration: InputDecoration(
                  hoverColor: Colors.white24,
                  labelText:
                      "Type in your ${loginState == 0 ? "Full Name" : loginState == 1 ? "Email Address" : loginState == 2 ? "Phone Number" : loginState == 3 ? "Company" : loginState == finalState ? "Password" : null}",
                  labelStyle: TextStyle(color: Colors.white24),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white24),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white24),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white24),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  suffixIcon: loginState == finalState
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white24,
                          ),
                        )
                      : null),
              obscureText: loginState == finalState ? _obscureText : false,
              validator: (String value) {
                if (loginState == 1) {
                  return isValidEmailAddress(value)
                      ? null
                      : "Please enter a valid email";
                } else if (loginState == 2) {
                  return value.length < 11 ? "Phone number not correct" : null;
                } else if (loginState == finalState) {
                  return value.length < 8
                      ? "Password must not be less than 8 characters"
                      : null;
                }
                return null;
              },
              onChanged: (String value) {
                setState(() {
                  loginState == 0
                      ? fullName = value
                      : loginState == 1
                          ? email = value
                          : loginState == 2
                              ? phone = value
                              : loginState == 3
                                  ? company = value
                                  : loginState == finalState
                                      ? pass = value
                                      : loginState = null;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildAR() {
    return GestureDetector(
      onTap: () {
        setState(() {
          loginState < finalState
              ? loginState = loginState + 1
              : loginState = finalState;
          if (loginState == 1) {
            tfController.text = email;
          } else if (loginState == 2) {
            tfController.text = phone;
          } else if (loginState == 3) {
            tfController.text = company;
          } else if (loginState == finalState) {
            tfController.text = pass;
          } else {}
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Image.asset('images/right_arrow.png'),
        ),
      ),
    );
  }

  Widget buildAL() {
    return GestureDetector(
      onTap: () {
        setState(() {
          loginState > 0 ? loginState = loginState - 1 : loginState = 0;
          if (loginState == 3) {
            tfController.text = company;
          } else if (loginState == 2) {
            tfController.text = phone;
          } else if (loginState == 1) {
            tfController.text = email;
          } else if (loginState == 0) {
            tfController.text = fullName;
          } else {}
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Image.asset('images/left_arrow.png'),
        ),
      ),
    );
  }

  Widget buildOk() {
    return GestureDetector(
      onTap: () {
        setState(() {
          loginState < finalState
              ? loginState = loginState + 1
              : loginState = finalState;
          if (loginState == 1) {
            tfController.text = email;
          } else if (loginState == 2) {
            tfController.text = phone;
          } else if (loginState == 3) {
            tfController.text = company;
          } else if (loginState == finalState) {
            tfController.text = pass;
          } else {}
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset('images/ok.png'),
          ),
        ),
      ),
    );
  }

  Widget buildLogin() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        decoration: BoxDecoration(
            color: whiteColor,
            border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        width: 200,
        height: 50,
        child: Center(
          child: Text(
            'Register Account',
            style: GoogleFonts.nunitoSans(
                color: bodyColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget buildLoginOptions() {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: Column(
        children: <Widget>[
          Text(
            'Or Register to start using',
            style: GoogleFonts.nunitoSans(fontSize: 16, color: whiteColor),
          ),
          const YMargin(15),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: whiteColor,
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Create account with Google',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      color: bodyColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildNoAccount() {
    return GestureDetector(
      onTap: () => navigateReplace(context, Login()),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          child: Stack(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.nunitoSans(color: tfColor, fontSize: 16),
                  ),
                  const XMargin(5),
                  Text(
                    'Login',
                    style: GoogleFonts.nunitoSans(
                        color: whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: <Widget>[
                  buildSvgs(),
                  const YMargin(50),
                  buildTFs(),
                  const YMargin(30),
                  Row(children: <Widget>[
                    loginState == 0
                        ? fullName.isNotEmpty
                            ? Flexible(
                                child: Row(
                                  children: <Widget>[
                                    buildOk(),
                                    Spacer(),
                                    buildAR()
                                  ],
                                ),
                              )
                            : Container()
                        : loginState == 1
                            ? (email.isNotEmpty && isValidEmailAddress(email))
                                ? Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        buildOk(),
                                        Spacer(),
                                        buildAL(),
                                        const XMargin(10),
                                        buildAR()
//                                    Expanded(
//                                      child: Row(
//                                        mainAxisSize: MainAxisSize.max,
//                                        mainAxisAlignment: MainAxisAlignment.end,
//                                        children: <Widget>[
//                                          buildAL(),
//                                          const XMargin(10),
//                                          buildAR()
//                                        ],
//                                      ),
//                                    )
                                      ],
                                    ),
                                  )
                                : Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        buildAL(),
                                        const XMargin(10),
                                        buildAR()
                                      ],
                                    ),
                                  )
                            : loginState == 2
                                ? phone.isNotEmpty
                                    ? Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            buildOk(),
                                            Spacer(),
                                            buildAL(),
                                            const XMargin(10),
                                            buildAR()
//                                    Expanded(
//                                      child: Row(
//                                        mainAxisSize: MainAxisSize.max,
//                                        mainAxisAlignment: MainAxisAlignment.end,
//                                        children: <Widget>[
//                                          buildAL(),
//                                          const XMargin(10),
//                                          buildAR()
//                                        ],
//                                      ),
//                                    )
                                          ],
                                        ),
                                      )
                                    : Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            buildAL(),
                                            const XMargin(10),
                                            buildAR()
                                          ],
                                        ),
                                      )
                                : loginState == 3
                                    ? company.isNotEmpty
                                        ? Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                buildOk(),
                                                Spacer(),
                                                buildAL(),
                                                const XMargin(10),
                                                buildAR()
//                                    Expanded(
//                                      child: Row(
//                                        mainAxisSize: MainAxisSize.max,
//                                        mainAxisAlignment: MainAxisAlignment.end,
//                                        children: <Widget>[
//                                          buildAL(),
//                                          const XMargin(10),
//                                          buildAR()
//                                        ],
//                                      ),
//                                    )
                                              ],
                                            ),
                                          )
                                        : Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                buildAL(),
                                                const XMargin(10),
                                                buildAR()
                                              ],
                                            ),
                                          )
                                    : loginState == finalState
                                        ? pass.isNotEmpty
                                            ? Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    buildLogin(),
                                                    Spacer(),
                                                    buildAL()
                                                  ],
                                                ),
                                              )
                                            : Expanded(
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: buildAL(),
                                                ),
                                              )
                                        : null
                  ]),
                  const YMargin(50),
                  if (loginState == 0 && fullName.isEmpty) buildLoginOptions(),
                ],
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: buildNoAccount(),
            ),
          )
        ],
      ),
    );
  }
}
