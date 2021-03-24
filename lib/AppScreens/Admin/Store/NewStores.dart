import 'package:crockery_app/Components/colorConstants.dart';
import 'package:crockery_app/Models/Stores.dart';
import 'package:crockery_app/Networks/NetworkOperations.dart';
import 'package:crockery_app/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AddStore.dart';

class NewStores extends StatefulWidget {


  @override
  _NewStoresState createState() => _NewStoresState();
}

class _NewStoresState extends State<NewStores> {
  String token;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  List<Store> storeList=[];

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
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
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.add, color: color2,size:25,),
        //     onPressed: (){
        //       Navigator.push(context, MaterialPageRoute(builder: (context)=> AddStore(widget.restaurantId)));
        //     },
        //   ),
        // ],
        iconTheme: IconThemeData(
            color: color3
        ),
        centerTitle: true,
        backgroundColor:  color4,
        title: Text("Store", style: TextStyle(
            color: color3, fontSize: 22, fontWeight: FontWeight.bold
        ),
        ),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: (){
          return Utils.check_connectivity().then((result){
            if(result){
              var storeData={
                "IsProduct": false,
              };
              NetworksOperation.getAllStoresByRestaurantId(context,storeData).then((value){
                setState(() {
                  storeList = value;
                  print(value);

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
                  image: AssetImage('assets/cups.jpg'),
                )
            ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(itemCount: storeList == null ? 0:storeList.length,itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminNavBar(storeList[index].id,widget.roleId)));

                  // Navigator.pushAndRemoveUntil(context,
                  //     MaterialPageRoute(builder: (context) => AdminNavBar(storeList[index].id,widget.roleId)), (
                  //         Route<dynamic> route) => false);
                },
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.20,
                secondaryActions: <Widget>[
                  IconSlideAction(
                    icon: storeList[index].isVisible?Icons.visibility_off:Icons.visibility,
                    color: Colors.red,
                    caption: storeList[index].isVisible?"InVisible":"Visible",
                    onTap: () async {
                    NetworksOperation.storeVisibility(context, token, storeList[index].id).then((value){
                      if(value){
                        Utils.showSuccess(context, "Visibility Changed");
                        WidgetsBinding.instance
                            .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
                      }

                      else
                        Utils.showError(context, "Please Tr Again");
                    });
                    },
                  ),
                    IconSlideAction(
                      icon: Icons.edit,
                      color: Colors.blueGrey,
                      caption: 'Update',
                      onTap: () async {
                        //print(discountList[index]);
                       // Navigator.push(context,MaterialPageRoute(builder: (context)=>UpdateStore(storeList[index])));
                      },
                    ),
                    IconSlideAction(
                      icon: FontAwesomeIcons.qrcode, color: color2,
                      caption: 'QR Code',
                      onTap: () async {
                        //print(discountList[index]);
                        //Navigator.push(context,MaterialPageRoute(builder: (context)=>GenerateScreenForStore(storeList[index],"Store/${storeList[index].id}")));
                      },
                    ),
                  ],
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: color3, width: 2),
                      color: color4,
                    ),
                    height: 170,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              alignment: Alignment.centerRight,
                              fit: BoxFit.fitHeight,
                              image:  NetworkImage(
                                  storeList[index].image!=null?storeList[index].image:"http://www.4motiondarlington.org/wp-content/uploads/2013/06/No-image-found.jpg"
                              ),
                            ),
                          ),
                        ),
                        ClipPath(
                          clipper: TrapeziumClipper(),
                          child: Container(
                            decoration: BoxDecoration(
                                color: color4,
                              //border: Border.all(color: color3)
                            ),
                            padding: EdgeInsets.all(8.0),
                            width: 340,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth: 280
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            //border: Border.all(color: Colors.amberAccent, width: 2),
                            //color: Colors.white38,
                          ),
                          height: 170,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 9),
                                      child: FaIcon(FontAwesomeIcons.utensils, color: color2, size: 17,),
                                    ),
                                    Text("Store: ", style: TextStyle(color: color3, fontSize: 17, fontWeight: FontWeight.bold),),
                                    Container(
                                      width: 140,
                                      child: Text(storeList[index].name!=null?storeList[index].name:"", maxLines: 1 ,style: TextStyle(color: color2, fontSize: 17, fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 3),
                                          child: FaIcon(FontAwesomeIcons.city, color: color2, size: 17,),
                                        ),
                                        Text("City: ", style: TextStyle(color: color3, fontSize: 15, fontWeight: FontWeight.bold),),
                                        Text("${storeList[index].city}", style: TextStyle(color: color2, fontSize: 15, fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 3),
                                      child: FaIcon(FontAwesomeIcons.clock, color: color2, size: 17,),
                                    ),
                                    Text("Open: ",style: TextStyle(color: color3,fontWeight: FontWeight.bold),),
                                    Text(storeList[index]. openTime!=null?storeList[index]. openTime:"-",style: TextStyle(color: color2,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 3),
                                      child: FaIcon(FontAwesomeIcons.clock, color: color2, size: 17,),
                                    ),
                                    Text("Close: ",style: TextStyle(color: color3,fontWeight: FontWeight.bold),),
                                    Text(storeList[index].closeTime!=null?storeList[index].closeTime:"-",style: TextStyle(color: color2,fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          })
        ),
      ),
    );
  }


}
class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 2/3, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(TrapeziumClipper oldClipper) => false;
}