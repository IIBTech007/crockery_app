
import 'package:crockery_app/Components/colorConstants.dart';
import 'package:crockery_app/Models/Stores.dart';
import 'package:crockery_app/Networks/NetworkOperations.dart';
import 'package:crockery_app/Utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';




class UpdateStore extends StatefulWidget {
  Store storeDetail;

  UpdateStore(this.storeDetail);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<UpdateStore> {
  var _formKey = new GlobalKey<FormState>();
  var _autoValidate = false;
  String selectedCurrency;
 // List<Country> countries = [];
  var selectedCuisine;
  TextEditingController storeName,city,postCode,contactNo,storeAddress;
  String token;
  DateTime start_time ;
  DateTime end_time ;
  int selectedCountryId;


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
        storeName.text = widget.storeDetail.name;
        contactNo.text= widget.storeDetail.cellNo;
        city.text = widget.storeDetail.city;
        storeAddress.text = widget.storeDetail.address;
      });
    });
    // networksOperation.getCountriesList(context).then((value) {
    //   //print(value);
    //   countries = value;
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:   AppBar(
          iconTheme: IconThemeData(
              color: color3
          ),
          title: Text("Update Store", style: TextStyle(
            color: color3,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
          centerTitle: true,
          backgroundColor: color4,
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
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Form(
                        key: _formKey,
                        autovalidate: _autoValidate,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 5,
                              color: color4,
                              child: Padding(
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
                                        borderSide: BorderSide(color: Color(0xFF172a3a), width: 1.0)
                                    ),
                                    labelText: "Restaurant Name",
                                    labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),

                                  ),
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                            Card(
                              elevation: 5,
                              color: color4,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: city,
                                  validator: (String value) =>
                                  value.isEmpty ? "This field is Required" : null,
                                  style: TextStyle(color: color3,fontWeight: FontWeight.bold),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: color3, width: 1.0)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF172a3a), width: 1.0)
                                    ),
                                    labelText: "City",
                                    labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),

                                  ),
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                            Card(
                              elevation: 5,
                              color: color4,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: postCode,
                                  keyboardType: TextInputType.number,

                                  style: TextStyle(color: color3,fontWeight: FontWeight.bold),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: color3, width: 1.0)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF172a3a), width: 1.0)
                                    ),
                                    labelText: "PostCode",
                                    labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),

                                  ),
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                            Card(
                              elevation: 5,
                              color: color4,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: contactNo,
                                  keyboardType: TextInputType.number,
                                  validator: (String value) =>
                                  value.isEmpty ? "This field is Required" : null,
                                  style: TextStyle(color: color3,fontWeight: FontWeight.bold),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: color3, width: 1.0)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF172a3a), width: 1.0)
                                    ),
                                    labelText: "Contact Number",
                                    labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),

                                  ),
                                  textInputAction: TextInputAction.next,

                                ),
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
                            width: 230,
                            decoration: BoxDecoration(
                                color: color3,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text("Submit",style: TextStyle(color:color4,fontWeight: FontWeight.bold,fontSize: 20)))
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
        "id":widget.storeDetail.id,
        "Name":storeName.text,
        "CellNo":contactNo.text,
        "City":city.text,
        "Address":storeAddress.text,
        "RestaurantId":widget.storeDetail.restaurantId,
        "OpenTime": start_time.toString().substring(11,19),//_timeRange.start.format(context),
        "CloseTime": end_time.toString().substring(11,19),//_timeRange.end.format(context),
        "FoodType": selectedCuisine,
        "CurrencyCode": selectedCurrency,//countries[selectedCountryId].currencies[0].symbol.toString(),
        "MerchantId": "vw012t1b90",
        "Password": "MC15422",
        "IntegritySalt": "3c97sx34c9"
      };
      print(storeData);
      NetworksOperation.updateStore(context, token, storeData).then((value) {
        if(value!=null){
          Utils.showSuccess(context, "Successfully Updated");
          Navigator.pop(context);
        }else{
          Utils.showError(context, "Not Added");
        }
      });

    }
  }
}
