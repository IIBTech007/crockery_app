 import 'dart:ui';
 import 'package:crockery_app/Components/colorConstants.dart';
import 'package:crockery_app/Models/Categories.dart';
import 'package:crockery_app/Networks/NetworkOperations.dart';
import 'package:flutter/material.dart';


 class CategoriesPage extends StatefulWidget {
 var storeId;

CategoriesPage(this.storeId);

  @override
   _CategoryPageState createState() => _CategoryPageState();
 }

 class _CategoryPageState extends State<CategoriesPage>{
   String token;
   List<Categories> categoryList=[];
   bool isListVisible = false;

   @override
   void initState() {
         NetworksOperation.getCategories(context,widget.storeId).then((value){
           setState(() {
             this.categoryList = value;
           });
     });



     // TODO: implement initState
     super.initState();
   }

   @override
   Widget build(BuildContext context) {
     // TODO: implement build
     return Scaffold(

         appBar: AppBar(
           centerTitle: true,
           iconTheme: IconThemeData(
               color: color3
           ),
           backgroundColor: color4 ,
           title: Text("Category",
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
           child: new Container(
             child: ListView.builder(padding: EdgeInsets.all(4), scrollDirection: Axis.vertical, itemCount:categoryList == null ? 0:categoryList.length, itemBuilder: (context,int index){
               return Column(
                 children: <Widget>[
                   SizedBox(height: 10,),
                   Container(height: 80,
                     padding: EdgeInsets.only(top: 8),
                     width: MediaQuery.of(context).size.width * 0.98,
                     decoration: BoxDecoration(
                         color: color4,
                         borderRadius: BorderRadius.only(
                           bottomRight: Radius.circular(15),
                           topLeft: Radius.circular(15),
                         ),
                         border: Border.all(color: color3, width: 2)
                     ),
                     child: ListTile(

                       title: Text(categoryList[index].name!=null?categoryList[index].name:"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: color3),),
                       leading: Image.network(categoryList[index].image!=null?categoryList[index].image:'http://www.4motiondarlington.org/wp-content/uploads/2013/06/No-image-found.jpg',fit: BoxFit.fill,height: 50,width: 50,),
                       //subtitle: Text("Onions,Cheese,Tomato Sauce,Fresh Tomato,",maxLines: 2,),
                       trailing: Icon(Icons.arrow_forward_ios,color: color2,),
                       onLongPress:(){},
                    onTap: () async{
                      if(categoryList[index].isSubCategoriesExist){
                      //  SharedPreferences prefs=await SharedPreferences.getInstance();
                        print(categoryList[index].id);
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=> subCategories(categoryList[index].id,categoryList[index].name,widget.storeId) ));
                      }else if(!categoryList[index].isSubCategoriesExist){
                      //  prefs= await SharedPreferences.getInstance();
                        print(categoryList[index].id);
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductPage(categoryList[index].id,0,categoryList[index].name,widget.storeId) ));
                      }
                    },
                     ),
                   ),
                 ],
               );
             }),
           ),

         )


     );

   }
   showAlertDialog(BuildContext context) {
     // set up the buttons
     Widget cancelButton = FlatButton(
       child: Text("Cancel"),
       onPressed: () {
         Navigator.pop(context);
       },
     );
     Widget addSubCategory = FlatButton(
       child: Text("Add SubCategory"),
       onPressed: () {
         Navigator.pop(context);
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(request)));
       },
     );
     Widget addProduct = FlatButton(
       child: Text("Add Product"),
       onPressed: () {
       },
     );
     // set up the AlertDialog
     AlertDialog alert = AlertDialog(
       title: Text("Add SubCategory / Product"),
       content: StatefulBuilder(
         builder: (context, setState) {
           return Column(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
             ],
           );
         },
       ),
       actions: [
         cancelButton,
         addSubCategory,
         addProduct
       ],
     );

     // show the dialog
     showDialog(

       context: context,
       builder: (BuildContext context) {
         return alert;
       },
     );
   }
 }

