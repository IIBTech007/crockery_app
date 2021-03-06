import 'dart:ui';

import 'package:crockery_app/Components/colorConstants.dart';
import 'package:crockery_app/Models/Sizes.dart';
import 'package:crockery_app/Networks/NetworkOperations.dart';
import 'package:crockery_app/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'addSizes.dart';



class SizesListPage extends StatefulWidget {
var storeId;

SizesListPage(this.storeId);

  @override
  _categoryListPageState createState() => _categoryListPageState();
}


class _categoryListPageState extends State<SizesListPage>{
  String token;
   final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  // bool isVisible=false;
  List<Sizes> sizes =[];
  bool isListVisible = false;

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
    SharedPreferences.getInstance().then((value) {
      setState(() {
        this.token = value.getString("token");
      });
    });
    NetworksOperation.getSizes(context,widget.storeId).then((value){
      //pd.hide();
      setState(() {
        sizes = value;
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
          actions: [
            IconButton(
              icon: Icon(Icons.add, color: color2,size:25),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> add_Sizes(widget.storeId)));
              },
            ),
          ],

          title: Text("Sizes",
            style: TextStyle(
                color: color3,
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: (){
            return Utils.check_connectivity().then((result){
              if(result){
                NetworksOperation.getSizes(context,widget.storeId).then((value){
                  //pd.hide();
                  setState(() {
                    sizes = value;
                  });
                });
              }else{
                Utils.showError(context, "Network Error");
              }
            });
          },
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  //colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.dstATop),
                  image: AssetImage('assets/bb.jpg'),
                )
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: new Container(
              //decoration: new BoxDecoration(color: Colors.black.withOpacity(0.3)),
              child: ListView.builder(scrollDirection: Axis.vertical, itemCount:sizes == null ? 0:sizes.length, itemBuilder: (context,int index){
                return Column(
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 60,
                        //padding: EdgeInsets.only(top: 8),
                        width: MediaQuery.of(context).size.width * 0.98,
                        decoration: BoxDecoration(
                          color: color4,
                          border: Border.all(color: color3, width: 2),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.20,
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              icon: Icons.edit,
                              color: Colors.blue,
                              caption: 'Update',
                              onTap: () async {
                                //print(barn_lists[index]);
                              //  Navigator.push(context,MaterialPageRoute(builder: (context)=>update_Sizes(sizes[index])));
                              },
                            ),
                          ],
                          child: ListTile(

                            title: Text(sizes[index].name!=null?sizes[index].name:"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: color3),),
                            onTap: () {
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),

          ),
        )


    );

  }

}


