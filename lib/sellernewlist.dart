import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storehelper/user.dart';
import 'loginscreen.dart';
import 'sellerdrawer.dart';
import 'tabnew.dart';


 
class SellerNewListScreen extends StatefulWidget {
  final User user;

  const SellerNewListScreen({Key key, this.user}) : super(key: key);
  
  @override
  _SellerNewListScreenState createState() => _SellerNewListScreenState();
}

class _SellerNewListScreenState extends State<SellerNewListScreen> {

  String titlecenter = "Loading...";
  double screenHeight, screenWidth;
   List _productList = [];
   TextEditingController _srcController = new TextEditingController();
   String email = "";
   int cartitem = 0;
   SharedPreferences prefs;

    void initState() {
    super.initState();
     _testasync();
   
  }
  @override
   Widget build(BuildContext context) {
    
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

  
    return WillPopScope(
       onWillPop: _onBackPressed,
       child: Scaffold(
      appBar: AppBar(
        title: Text('StoreHelper'),
      
      ),
      drawer: SellerDrawer(user: widget.user),
      body: Center(
        child: Column(
          children: [
          //Column(
            Padding(
               //   children: [
                   padding: EdgeInsets.fromLTRB(5, 2, 3, 2), 
                   child: TextFormField(
                      controller: _srcController,
                      onChanged: (_srcController){
                            _loadGrams(_srcController);
                      },
                      decoration: InputDecoration(
                        hintText: "Search",
                        suffixIcon: IconButton(
                          onPressed: () => _loadGrams(_srcController.text),
                          icon: Icon(Icons.search),
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.white24)),
                      ),
                    )
                    
              //    ]
             ),
            if (_productList.isEmpty)
              Flexible(child: Center(child: Text(titlecenter)))
            else
             Flexible(
                flex: 9,
                child: ListView.builder(
                    itemCount: _productList.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                        child: Card(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                          child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Container(
                                margin: EdgeInsets.all(5),
                                width: 150.0,
                                height: 120.0,
                                decoration: new BoxDecoration(
                                 
                                    image: new DecorationImage(
                                        fit: BoxFit.cover,
                                        image: new NetworkImage("https://crimsonwebs.com/s272043/storehelper/images/${_productList[index]['id']}.png")))
                                        ),
                          ),
                                     
                                   Expanded(
                                      flex: 6,
                                      child:Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,                        
                                      children: [
                                      Column(children:[
                                        Padding(
                                        padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
                                     //   child: Container(
                                          child: Text(
                                      titleSub(
                                          _productList[index]['name']),
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                        // child: Text(_productList[index]['name'],
                                        //     overflow: TextOverflow.ellipsis,
                                        //     textAlign: TextAlign.left,
                                        //     style: TextStyle(fontSize: 18)),
                                     //   ) 
                                    ), 

                                    Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 15, 5, 0),
                                          child: Text("RM: " + _productList[index]['price'],
                                          style: TextStyle(fontSize:18),),
                                        ),
                                        
                                   
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                          child: Text("Type: " +_productList[index]['type'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize:16,),),
                                        ),
                                    
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                          child: Text("Quantity(kg): "+_productList[index]['qty'],
                                          style: TextStyle(fontSize:16),),
                                        ),
                                      ],
                                      ),
                                      ],
                                      ),
                                    ),
                                     Expanded(
                                        flex: 2,
                                      child: Column(
                                        children: [
                                        // padding:
                                        //     EdgeInsets.fromLTRB(
                                        //         0, 0, 10, 0),
                                        // alignment:
                                        //     Alignment.centerRight,
                                      //  child: 
  
                                                 ]           
                                      ),
                                   //   )
                                      ),
                                  ],
                                )),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
                ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context, MaterialPageRoute(builder: (context)=>TabNewProduct(user: widget.user,))
          );
        },
        child: Icon(Icons.add),),
       ),
    );
  }

   void _loadGrams(String prname) {
    http.post(
        Uri.parse("https://crimsonwebs.com/s272043/storehelper/php/loadproduct.php"),
         body: {"prname": prname}
        ).then((response) {
      if (response.body == "nodata") {
             Fluttertoast.showToast(
                      msg:"No FOUND",
                      toastLength: Toast.LENGTH_SHORT,
                        gravity:ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor:Colors.red,
                        textColor:Colors.white,
                        fontSize:16.0);

       titlecenter = "Sorry no gram available";
        _productList = [];
        return;
      } else {
        var jsondata = json.decode(response.body);
        _productList = jsondata["products"];
        titlecenter = "Contain Data";
        print(jsondata);
      }
      setState(() {});
    });
  }
   Future<void> _testasync() async {
    _loadGrams("");
    
  }
   Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: new Text(
              'Do you want to back to login?',
              style: TextStyle(),
            ),
            content: new Text(
              'Are your sure?',
              style: TextStyle(),
            ),
            actions: <Widget>[
              MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (content) => LoginScreen()));
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(),
                  )),
              MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "No",
                    style: TextStyle(),
                  )),
            ],
          ),
        ) ??
        false;
  }

   String titleSub(String title) {
    if (title.length > 15) {
      return title.substring(0, 15) + "...";
    } else {
      return title;
    }
  }



  }

                    
                