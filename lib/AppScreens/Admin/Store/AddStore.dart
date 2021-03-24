import 'package:crockery_app/Components/colorConstants.dart';
import 'package:crockery_app/Networks/NetworkOperations.dart';
import 'package:crockery_app/Utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




class AddStore extends StatefulWidget {
var storeId;

AddStore(this.storeId);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<AddStore> {
  TextEditingController storeName,city,postCode,contactNo,storeAddress;
  String token;
  DateTime start_time ;
  DateTime end_time ;
  int selectedCountryId;
  var _formKey = new GlobalKey<FormState>();
  var _autoValidate = false;

  @override
  void initState() {
    storeName =TextEditingController();
    city=TextEditingController();
    postCode==TextEditingController();
    contactNo=TextEditingController();
    storeAddress=TextEditingController();
    SharedPreferences.getInstance().then((value) {
      setState(() {
        this.token = value.getString("token");
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:   AppBar(
          title: Text("Add Stores",
            style: TextStyle(
                color: color3, fontSize: 25, fontWeight: FontWeight.bold
            ),
          ),
          iconTheme: IconThemeData(
              color: color3
          ),
          centerTitle: true,
          backgroundColor:  color4,
        ),
        body:
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/bb.jpg'),
              )),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: new Container(
              //decoration: new BoxDecoration(color: Colors.black.withOpacity(0.3)),
              child: Column(
                children: <Widget>[
                  Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: storeName,
                            style: TextStyle(color: color3,fontWeight: FontWeight.bold),
                            obscureText: false,
                            validator: (String value) =>
                            value.isEmpty ? "This field is Required" : null,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: color3, width: 1.0)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: color2, width: 1.0)
                              ),
                              labelText: "Restaurant Name",
                              labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),

                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: city,
                            style: TextStyle(color: color3,fontWeight: FontWeight.bold),
                            obscureText: false,
                            validator: (String value) =>
                            value.isEmpty ? "This field is Required" : null,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: color3, width: 1.0)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: color2, width: 1.0)
                              ),
                              labelText: "City",
                              labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),

                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: contactNo,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: color3,fontWeight: FontWeight.bold),
                            obscureText: false,
                            validator: (String value) =>
                            value.isEmpty ? "This field is Required" : null,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: color3, width: 1.0)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: color2, width: 1.0)
                              ),
                              labelText: "Contact Number",
                              labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),

                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      _validateInputs();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                          color: color3,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text("SAVE",style: TextStyle(color: color4,fontSize: 20, fontWeight: FontWeight.bold)))
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
  void _validateInputs() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      setState(() {
        _autoValidate = true; // Start validating on every change.
      });
      Utils.showError(context, "Please fix the Errors");
    } else {
      form.save();
      dynamic storeData={

        "Name":storeName.text,
        "CellNo":contactNo.text,
        "City":city.text,
        "Address":storeAddress.text,
        "OpenTime": start_time.toString().substring(11,19),//_timeRange.start.format(context),
        "CloseTime": end_time.toString().substring(11,19),//_timeRange.end.format(context),

        "MerchantId": "vw012t1b90",
        "Password": "MC15422",
        "IntegritySalt": "3c97sx34c9"
      };
      print(storeData);
      NetworksOperation.addStore(context, token, storeData).then((value) {
        if(value!=null){
          Utils.showSuccess(context, "Successfully Added");
          Navigator.pop(context);
        }else{
          Utils.showError(context, "Not Added");
        }
      });

    }
  }

}
