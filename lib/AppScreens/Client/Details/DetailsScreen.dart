import 'package:crockery_app/Components/colorConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: color4,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  color: color3,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/cups.jpg')
                  ),
                ),
              ),
              Positioned(
                top: 250,
                left: 12,
                child: Card(
                  elevation: 6,
                  color: color4,
                  child: Container(
                    decoration: BoxDecoration(
                      //color: color1,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    width: 380,
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("China Enamel Cups",
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: color3,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: color3,
                                  shape: BoxShape.circle
                                ),
                                child: Center(
                                  child: IconButton(
                                    onPressed: (){
                                    },
                                    icon: FaIcon(FontAwesomeIcons.cartPlus, size: 20, color: color1,),

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("A cup set from china",
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: color1,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 370,
                child: Container(
                  decoration: BoxDecoration(
                    color: color4,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: ListView.builder(scrollDirection: Axis.horizontal, itemCount:7,itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/cups.jpg')
                          ),
                          color: color3,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Positioned(
                  top: 525,
                  child: Container(
                    color: color4,
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("China Enamel Cups",
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: color3,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
              )
            ],
          )
        ),
      ),
    );
  }
}
