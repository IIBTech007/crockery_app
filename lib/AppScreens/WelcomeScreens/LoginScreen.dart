import 'dart:ui';
import 'package:crockery_app/Components/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: color4,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: ClipPath(
                  clipper: WaveClipperTwo(flip: true),
                  child: Container(
                    height: 165,
                    color: color5,
                    child: Stack(
                      children: [
                        ClipPath(
                          clipper: WaveClipperTwo(flip: true),
                          child: Container(
                            height: 150,
                            color: color3,
                            child:Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.arrow_back, color: color4,size:30),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                  child:Text("Crockery Store",
                    style: TextStyle(
                        color: color1,
                        fontWeight: FontWeight.bold,
                        fontSize: 40
                    ),
                  )
              ),
              SizedBox(height: 35,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 400,
                    height: 240,
                    decoration: BoxDecoration(
                      color: color4,
                      borderRadius: BorderRadius.circular(10),
                      //color: color3,
                      // border: Border.all(
                      //     color: color3,
                      //     width: 2
                      // )
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'LOGIN',
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: color1,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            elevation: 8,
                            color: color4,
                            child: Container(
                              child: TextFormField(
                                //controller: accountController.emailTextEditingController,
                                style:  GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: color1,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: color3, width: 1.0)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: color4, width: 1.0)
                                  ),
                                  labelText: "Email",
                                  labelStyle: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: color3,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  suffixIcon: Icon(Icons.email,color: color3,size: 27,),
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            elevation: 8,
                            color: color4,
                            child: Container(
                              child: TextFormField(
                                //controller: accountController.passwordTextEditingController,
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: color1,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: color3, width: 1.0)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: color4, width: 1.0)
                                  ),
                                  labelText: "Password",
                                  labelStyle: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: color3,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  // suffixIcon: IconButton(icon: Icon(accountController.isVisible?Icons.visibility:Icons.visibility_off,color: color3,size: 27),
                                  //   onPressed: () {
                                  //
                                  // },),//(Icons.https,color: yellowColor,size: 27,)
                                ),

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: (){
                  },
                  child: Center(
                    child: Card(
                      elevation: 8,
                      color: color3,
                      child: Container(
                        height: 55,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          //border: Border.all(color: Color(0xfbb55400), width: 3)
                        ),
                        child: Center(
                          child: Text("Sign In",
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: color4,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                  child: InkWell(
                    onTap: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              decoration: TextDecoration.underline,
                              color: color1,
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              SizedBox(height: 50,),
              RotationTransition(
                turns: new AlwaysStoppedAnimation(180 / 360),
                child: Container(
                  child: ClipPath(
                    clipper: WaveClipperTwo(flip: true),
                    child: Container(
                      height: 115,
                      color: color5,
                      child: Stack(
                        children: [
                          ClipPath(
                            clipper: WaveClipperTwo(flip: true),
                            child: Container(
                              height: 100,
                              color: color3,
                              //child: Center(child: Text("WaveClipperTwo(flip: true)")),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





class WaveClipperTwo extends CustomClipper<Path> {
  /// reverse the wave direction in vertical axis
  bool reverse;

  /// flip the wave direction horizontal axis
  bool flip;

  WaveClipperTwo({this.reverse = false, this.flip = false});

  @override
  Path getClip(Size size) {
    var path = Path();
    if (!reverse && !flip) {
      path.lineTo(0.0, size.height - 20);

      var firstControlPoint = Offset(size.width / 4, size.height);
      var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy);

      var secondControlPoint =
      Offset(size.width - (size.width / 3.25), size.height - 65);
      var secondEndPoint = Offset(size.width, size.height - 40);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondEndPoint.dx, secondEndPoint.dy);

      path.lineTo(size.width, size.height - 40);
      path.lineTo(size.width, 0.0);
      path.close();
    } else if (!reverse && flip) {
      path.lineTo(0.0, size.height - 40);
      var firstControlPoint = Offset(size.width / 3.25, size.height - 65);
      var firstEndPoint = Offset(size.width / 1.75, size.height - 20);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy);

      var secondCP = Offset(size.width / 1.25, size.height);
      var secondEP = Offset(size.width, size.height - 30);
      path.quadraticBezierTo(
          secondCP.dx, secondCP.dy, secondEP.dx, secondEP.dy);

      path.lineTo(size.width, size.height - 20);
      path.lineTo(size.width, 0.0);
      path.close();
    } else if (reverse && flip) {
      path.lineTo(0.0, 20);
      var firstControlPoint = Offset(size.width / 3.25, 65);
      var firstEndPoint = Offset(size.width / 1.75, 40);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy);

      var secondCP = Offset(size.width / 1.25, 0);
      var secondEP = Offset(size.width, 30);
      path.quadraticBezierTo(
          secondCP.dx, secondCP.dy, secondEP.dx, secondEP.dy);

      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
      path.close();
    } else {
      path.lineTo(0.0, 20);

      var firstControlPoint = Offset(size.width / 4, 0.0);
      var firstEndPoint = Offset(size.width / 2.25, 30.0);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy);

      var secondControlPoint = Offset(size.width - (size.width / 3.25), 65);
      var secondEndPoint = Offset(size.width, 40);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondEndPoint.dx, secondEndPoint.dy);

      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
      path.close();
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
