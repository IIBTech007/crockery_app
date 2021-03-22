import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:crockery_app/Components/colorConstants.dart';
import 'package:crockery_app/Models/ProductSizes.dart';
import 'package:crockery_app/Models/Sizes.dart';
import 'package:crockery_app/Networks/NetworkOperations.dart';
import 'package:crockery_app/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AddProductDetails.dart';





class addProduct extends StatefulWidget {
  var storeId,categoryId,subCategoryId;


  addProduct(this.storeId,this.categoryId,this.subCategoryId);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _add_CategoryState();
  }
}

class _add_CategoryState extends State<addProduct> {
  String token;
  File _image;
  var picked_image;
  var responseJson;
  List<ProductSize> sizeWithPrice=[]; List<Widget> chips=[];
  TextEditingController name,storeId,description;
  var storeName,storeIdIndex;
  List storeNameList=[],storeList=[];
  List<Sizes> sizes=[];

//  _add_CategoryState(this.token);

  @override
  void initState(){
    this.name=TextEditingController();
    this.storeId=TextEditingController();
    this.description=TextEditingController();

    SharedPreferences.getInstance().then((value) {
      setState(() {
        this.token = value.getString("token");
      });
    });
    Utils.check_connectivity().then((result){
      if(result){
        NetworksOperation.getSizes(context,widget.storeId).then((response){
          if(response!=null){
            setState(() {
              sizes=response;
            });
          }else{

          }
        });
      }else{

      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: color3
        ),
        backgroundColor: color4,
        centerTitle: true,
        title: Text("Add Product", style: TextStyle(
            color: color3, fontSize: 22, fontWeight: FontWeight.bold
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
                          borderSide: BorderSide(color: Color(0xFF172a3a), width: 1.0)
                      ),
                      labelText: "Name",
                      labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),

                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: description,
                    style: TextStyle(color: color3,fontWeight: FontWeight.bold),
                    obscureText: false,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: color3, width: 1.0)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF172a3a), width: 1.0)
                      ),
                      labelText: "Description",
                      labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),

                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(16),
                        height: 100,
                        width: 80,
                        child: _image == null ? Text('No image selected.', style: TextStyle(color: color2),) : Image.file(_image),
                      ),
                      MaterialButton(
                        color: color3,
                        onPressed: (){
                          Utils.getImage().then((image_file){
                            if(image_file!=null){
                              image_file.readAsBytes().then((image){
                                if(image!=null){
                                  setState(() {
                                    //this.picked_image=image;
                                    _image = image_file;
                                    this.picked_image = base64Encode(image);
                                  });
                                }
                              });
                            }else{

                            }
                          });
                        },
                        child: Text("Select Image",style: TextStyle(color: color4),),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 5),

                InkWell(
                  onTap: (){

                    if(name.text==null||name.text.isEmpty){
                      Utils.showError(context, "Name Required");
                    }
                    // else if(storeIdIndex==null){
                    //   Utils.showError(context, "Store ID Required");
                    // }
                    else if(picked_image==null){
                      Utils.showError(context, "Image Required");
                    }
                    else{
                      Utils.check_connectivity().then((result){
                        if(result){
                          if(sizes.length>0){
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(token,widget.categoryId,
                          //   widget.subCategoryId,
                          //   null,
                          //   name.text,
                          //   description.text,
                          //   // storeList[storeIdIndex]['id'],
                          //   picked_image,
                          //   widget.storeId,
                          // )));
                          }else{
                            Utils.showError(context, "Please Add Sizes Configuration First");
                          }
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
