import 'package:crockery_app/Components/colorConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AdminHomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Home", style: TextStyle(
        color: color4,
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
      ),
      backgroundColor: color3,
      centerTitle: true,
    ),
      body: Container(
        color: color4,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(itemCount:7 ,itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 6,
              color: color4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                  //color: color4,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 140,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         fit: BoxFit.cover,
                         image: AssetImage('assets/cups.jpg')
                       )
                     ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("China Enamled Cups",
                      style: TextStyle(
                        color: color3,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Imported Cups from China",
                        style: TextStyle(
                            color: color1,
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ),
          );
        }),
      ),
    );
  }
}
