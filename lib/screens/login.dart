
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_vend/screens/register.dart';
import 'package:live_vend/utils/constants.dart';
import 'package:live_vend/utils/margin.dart';
import 'package:live_vend/utils/navigation.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email="", pass="";
  var tfController = TextEditingController();
  int loginState=0;
  //0=> entering email, 1=> entering password

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
              'Log In',
              style: GoogleFonts.nunitoSans(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: whiteColor
              ),
            ),
            const YMargin(15),
            Text(
              "Enter your ${loginState==0? "Email Address": "Password"}",
              style: GoogleFonts.nunitoSans(
                  fontSize: 18,
                  color: whiteColor
              ),
            ),
            const YMargin(10),
            TextFormField(
              controller: tfController,
              style: GoogleFonts.nunitoSans(
                color: Colors.white54
              ),
              cursorColor: tfColor,
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance: Brightness.light,
              decoration: InputDecoration(
                hoverColor: Colors.white24,
                labelText: "Type in your ${loginState==0? "email address": "password"}",
                labelStyle: TextStyle(color: Colors.white24),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white24
                    ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white24),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white24),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                suffixIcon: loginState==1?GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText?Icons.visibility_off:Icons.visibility,
                    color: Colors.white24,
                  ),
                ):null
              ),
              obscureText: loginState==1?_obscureText:false,
              validator: (String value) {
                if (loginState==0) {
                  return isValidEmailAddress(value)?null:"Please enter a valid email";
                }
                return value.length<8?"Password must not be less than 8 characters":null;
              },
              onChanged: (String value) {
                  setState(() {
                    loginState==0
                        ?email=value
                        :pass=value;
                  });
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildAR(){
    return GestureDetector(
      onTap: () {
        setState(() {
          loginState=1;
          tfController.text=pass;
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

  Widget buildAL(){
    return GestureDetector(
      onTap: () {
        setState(() {
          loginState=0;
          tfController.text=email;
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

  Widget buildOk(){
    return GestureDetector(
      onTap: () {
        setState(() {
          loginState=1;
          tfController.text=pass;
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
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        width: 200,
        height: 50,
        child: Center(
          child: Text(
            'Login Account',
            style: GoogleFonts.nunitoSans(
              color: bodyColor,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForgotPassword() {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Container(
          color: Colors.transparent,
          child: Text(
            'Forgot your password?',
            style: GoogleFonts.nunitoSans(
              color: whiteColor,
              fontSize: 18
            ),
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
            'Or login with',
            style: GoogleFonts.nunitoSans(
                fontSize:16,
                color: whiteColor
            ),
          ),
          const YMargin(15),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: whiteColor,
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Login with Google',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 14,
                    color: bodyColor,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildNoAccount(){
    return GestureDetector(
      onTap: () => navigateReplace(
          context,
          Register()),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          child: Stack(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'I don\'t have an account?',
                    style: GoogleFonts.nunitoSans(
                      color: tfColor,
                      fontSize: 16
                    ),
                  ),
                  const XMargin(5),
                  Text(
                    'Register',
                    style: GoogleFonts.nunitoSans(
                      color: whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
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
                  Row(
                    children: <Widget>[
                      loginState==1
                          ?tfController.text.isNotEmpty
                            ?buildLogin()
                            :(email.isNotEmpty&&isValidEmailAddress(email))
                              ?buildOk()
                              :Container()
                          :(email.isNotEmpty&&isValidEmailAddress(email))
                            ?buildOk()
                            :Container(),
                      Spacer(),
                      loginState==1
                          ?tfController.text.isNotEmpty
                          ?buildAL()
                          :Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          buildAL(),
                          const XMargin(10),
                          buildAR()
                        ],
                      )
                      : buildAR(),
                    ],
                  ),
                  const YMargin(50),
                  if(!(email.isNotEmpty&&isValidEmailAddress(email)))
                    buildLoginOptions(),
                  const YMargin(50),
                  loginState==1?buildForgotPassword():Container()
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
