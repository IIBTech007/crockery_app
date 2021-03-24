
import 'dart:ui';
import 'package:crockery_app/Components/colorConstants.dart';
import 'package:crockery_app/Networks/NetworkOperations.dart';
import 'package:crockery_app/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




class add_Sizes extends StatefulWidget {
  var storeId;

  add_Sizes(this.storeId); // var product_id;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _add_SizesState();
  }
}

class _add_SizesState extends State<add_Sizes> {
  String token;



  TextEditingController name, price;


  @override
  void initState(){
    this.name=TextEditingController();
    this.price=TextEditingController();

    SharedPreferences.getInstance().then((value) {
      setState(() {
        this.token = value.getString("token");
      });
    });
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color4,
        centerTitle: true,
        iconTheme: IconThemeData(
            color: color3
        ),
        title: Text("Add Sizes",
          style: TextStyle(
              color: color3,
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/bb.jpg'),
            )
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: new Container(
            //decoration: new BoxDecoration(color: Colors.black.withOpacity(0.3)),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: name,
                    style: TextStyle(color: color3,fontWeight: FontWeight.bold),
                    obscureText: false,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: color3, width: 1.0)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: color2, width: 1.0)
                      ),
                      labelText: "Size Name",
                      labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),

                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(height: 5),
                InkWell(
                  onTap: (){

                    if(name.text==null||name.text.isEmpty){
                      Utils.showError(context, "Name Required");
                    }
                    else{
                      Utils.check_connectivity().then((result){
                        if(result){
                          NetworksOperation.addSizes(context, token, name.text,widget.storeId).then((value){
                            if(value){
                              Utils.showSuccess(context, "Added Successfully");
                             // Navigator.pop(context);
                            }
                          });
                        }else{
                         Utils.showError(context, "Network Error");
                        }
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)) ,
                        color: color3,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height  * 0.06,

                      child: Center(
                        child: Text("SAVE",style: TextStyle(color: color4,fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
