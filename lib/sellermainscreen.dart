import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:storehelper/user.dart';
import 'addgoods.dart';
import 'addmaterial.dart';
import 'addpromotion.dart';
import 'loginscreen.dart';
import 'sellerdrawer.dart';
import 'tabnew.dart';

class SellerHomeScreen extends StatefulWidget {
  final User user;

  const SellerHomeScreen({Key key, this.user}) : super(key: key);
  
  @override
  _SellerHomeScreenState createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {

  String titlecenter = "Loading...";
  double screenHeight, screenWidth;
  // List _productList = [];
 
   String email = "";
   int cartitem = 0;
   SharedPreferences prefs;
   String pathAsset = 'assets/images/camera2.png';
 

    void initState() {
    super.initState();

   
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
          child: SingleChildScrollView(
        child: Column(
          children: [
               Padding(
                   padding: EdgeInsets.fromLTRB(5, 2, 3, 2),
                   child: Text(
                                      titleSub("Special"),
                                      style: TextStyle(
                                          // decoration: TextDecoration.underline,
                                          // fontSize: 20,
                                          // fontWeight: FontWeight.bold
                                          fontSize: 25.0,
                                           color:Colors.blueGrey,
                                           letterSpacing: 2.0,
                                           fontWeight: FontWeight.w400
                                          ),
                                    ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 2, 3, 2),
                   child:GestureDetector(
                     onTap: () {
              Navigator.pop(context);
               Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => TabNewProduct(
                        user: widget.user,
                          )));
            },
                    child: Container(
                        height: screenHeight / 3.2,
                        width: screenWidth / 2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                    "assets/images/newproductsell.png"
                  ),
                          ),
                           border: Border.all(
                             width: 3.0,
                            color: Colors.grey,
                           ),
                           borderRadius: BorderRadius.all(Radius.circular(
                                   10.0) //         <--- border radius here
                               ),
                        ),
                        ),  
                  ),
              ),
              Padding(
                   padding: EdgeInsets.fromLTRB(5, 2, 3, 2),
                   child: Text(
                                      titleSub("Add New"),
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                          ),
                                    ),
              ),
               SizedBox(
                height: 10,
              ),
               Padding(
                padding: EdgeInsets.fromLTRB(5, 2, 3, 2),
                   child:GestureDetector(
                     onTap: () {
              Navigator.pop(context);
               Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => AddPromotionScreen(
                        user: widget.user,
                          )));
            },
                    child: Container(
                        height: screenHeight / 3.2,
                        width: screenWidth / 2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                    "assets/images/promotionsell.png"
                  ),
                          ),
                           border: Border.all(
                             width: 3.0,
                            color: Colors.grey,
                           ),
                           borderRadius: BorderRadius.all(Radius.circular(
                                   10.0) //         <--- border radius here
                               ),
                        )),
                        
                  ),
              ),
              Padding(
                   padding: EdgeInsets.fromLTRB(5, 2, 3, 2),
                   child: Text(
                                      titleSub("Add Promotion"),
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                          ),
                                    ),
              ),
              
               SizedBox(
                height: 10,
              ),
                             Padding(
                   padding: EdgeInsets.fromLTRB(5, 2, 3, 2),
                   child: Text(
                                      titleSub("Categories"),
                                      style: TextStyle(
                                          // decoration: TextDecoration.underline,
                                          // fontSize: 20,
                                          // fontWeight: FontWeight.bold
                                          fontSize: 25.0,
                                           color:Colors.blueGrey,
                                           letterSpacing: 2.0,
                                           fontWeight: FontWeight.w400
                                          ),
                                    ),
              ),
                            Padding(
                padding: EdgeInsets.fromLTRB(5, 2, 3, 2),
                   child:GestureDetector(
                     onTap: () {
              Navigator.pop(context);
               Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => AddMaterialScreen(
                        user: widget.user,
                          )));
            },
                    child: Container(
                        height: screenHeight / 3.2,
                        width: screenWidth / 2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                    "assets/images/materialsell.png"
                  ),
                          ),
                           border: Border.all(
                             width: 3.0,
                            color: Colors.grey,
                           ),
                           borderRadius: BorderRadius.all(Radius.circular(
                                   10.0) //         <--- border radius here
                               ),
                        ),
                        ),  
                  ),
              ),
              Padding(
                   padding: EdgeInsets.fromLTRB(5, 2, 3, 2),
                   child: Text(
                                      titleSub("Add Material"),
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                          ),
                                    ),
              ),
               SizedBox(
                height: 10,
              ),
                                          Padding(
                padding: EdgeInsets.fromLTRB(5, 2, 3, 2),
                   child:GestureDetector(
                     onTap: () {
              Navigator.pop(context);
               Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => AddGoodsScreen(
                        user: widget.user,
                          )));
            },
                    child: Container(
                        height: screenHeight / 3.2,
                        width: screenWidth / 2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                    "assets/images/goods.png"
                  ),
                          ),
                           border: Border.all(
                             width: 3.0,
                            color: Colors.grey,
                           ),
                           borderRadius: BorderRadius.all(Radius.circular(
                                   10.0) //         <--- border radius here
                               ),
                        ),
                        ),  
                  ),
              ),
              Padding(
                   padding: EdgeInsets.fromLTRB(5, 2, 3, 2),
                   child: Text(
                                      titleSub("Add Goods"),
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                          ),
                                    ),
              ),
                ]
        ),
         ),
      ),
       ),
    );
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
   
   