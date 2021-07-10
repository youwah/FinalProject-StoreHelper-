import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storehelper/cartpage.dart';
import 'package:storehelper/mydrawer.dart';
import 'package:storehelper/user.dart';
import 'goodslist.dart';
import 'loginscreen.dart';
import 'mainscreen.dart';
import 'materiallist.dart';
import 'promotionlist.dart';


 
class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({Key key, this.user}) : super(key: key);
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String titlecenter = "Loading...";
  double screenHeight, screenWidth;
  // List _productList = [];
   TextEditingController _srcController = new TextEditingController();
   String email = "";
   int cartitem = 0;
   SharedPreferences prefs;
   String pathAsset = 'assets/images/camera2.png';
 

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
        actions: [
          IconButton(
              onPressed: () => {_goToCart()},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              ),
        ],
      ),
      drawer: MyDrawer(user: widget.user),
      body: Center(
          child: SingleChildScrollView(
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
            //  SizedBox(
            //     height: 10,
            //   ),
            
              Padding(
                   padding: EdgeInsets.fromLTRB(5, 2, 3, 2),
                   child: Text(
                                      titleSub("Promotion"),
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
                      builder: (content) => PromotionListScreen(
                        user: widget.user,
                          )));
            },
            
               child: ImageSlideshow(

          /// Width of the [ImageSlideshow].
          width: double.infinity,

          /// Height of the [ImageSlideshow].
          height: 200,

          /// The page to show when first creating the [ImageSlideshow].
          initialPage: 0,

          /// The color to paint the indicator.
          indicatorColor: Colors.blue,

          /// The color to paint behind th indicator.
          indicatorBackgroundColor: Colors.grey,

          /// The widgets to display in the [ImageSlideshow].
          /// Add the sample image file into the images folder
          children: [
            Image.asset(
              'assets/images/promotion1.png',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/promotion2.png',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/promotion3.png',
              fit: BoxFit.cover,
            ),
          ],

          /// Called whenever the page in the center of the viewport changes.
          onPageChanged: (value) {
            print('Page changed: $value');
          },

          /// Auto scroll interval.
          /// Do not auto scroll with null or 0.
          autoPlayInterval: 3000,
        ),
        ),
        ),
        Padding(
                   padding: EdgeInsets.fromLTRB(5, 2, 3, 2),
                   child: Text(
                                      titleSub("Latest Product"),
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
                      builder: (content) => MainScreen(
                        user: widget.user,
                          )));
            },
                    child: Container(
                      child: Image.asset('assets/images/hotdeal.png', fit: BoxFit.cover),
                  //       height: screenHeight / 3.2,
                  //       width: screenWidth / 2,
                  //       decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //           image: AssetImage(
                  //   "assets/images/camera2.png"
                  // ),
                  //         ),
                  //          border: Border.all(
                  //            width: 3.0,
                  //           color: Colors.grey,
                  //          ),
                  //          borderRadius: BorderRadius.all(Radius.circular(
                  //                  10.0) //         <--- border radius here
                  //              ),
                  //       )
                        ),
                  ),
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
                      builder: (content) => MaterialListScreen(
                        user: widget.user,
                          )));
            },
                    child: Container(
                        height: screenHeight / 3.2,
                        width: screenWidth / 2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                    "assets/images/material.png"
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
                        // child: Text(
                        //               titleSub("Material"),
                        //               style: TextStyle(
                                        
                        //                   fontSize: 20,
                        //                   fontWeight: FontWeight.bold
                        //                   ),
                        //             ),
                        ),  
                  ),
              ),
              Padding(
                   padding: EdgeInsets.fromLTRB(5, 2, 3, 2),
                   child: Text(
                                      titleSub("Material"),
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
                      builder: (content) => GoodsListScreen(
                        user: widget.user,
                          )));
            },
                    child: Container(
                        height: screenHeight / 3.2,
                        width: screenWidth / 2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                    "assets/images/product.png"
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
                                      titleSub("Product"),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     Navigator.push(
      //       context, MaterialPageRoute(builder: (context)=>TabNewProduct())
      //     );
      //   },
      //   child: Icon(Icons.add),),
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
    //    _productList = [];
        return;
      } else {
        var jsondata = json.decode(response.body);
     //   _productList = jsondata["products"];
        titlecenter = "Contain Data";
        print(jsondata);
      }
      setState(() {});
    });
  }
   Future<void> _testasync() async {
     _loadCart();
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

    // _addtocart(int index) async {
   
    //   String prid = _productList[index]['id'];
    //   http.post(Uri.parse("https://crimsonwebs.com/s272043/storehelper/php/insertcart.php"),
    //       body: {"email": widget.user.email, "prid": prid}).then((response) {
    //     print(response.body);
    //     if (response.body == "failed") {
    //       Fluttertoast.showToast(
    //           msg: "Failed",
    //           toastLength: Toast.LENGTH_SHORT,
    //           gravity: ToastGravity.CENTER,
    //           timeInSecForIosWeb: 1,
    //           backgroundColor: Colors.red,
    //           textColor: Colors.white,
    //           fontSize: 16.0);
    //     } else {
    //       Fluttertoast.showToast(
    //           msg: "Success",
    //           toastLength: Toast.LENGTH_SHORT,
    //           gravity: ToastGravity.CENTER,
    //           timeInSecForIosWeb: 1,
    //           backgroundColor: Colors.red,
    //           textColor: Colors.white,
    //           fontSize: 16.0);
    //       _loadCart();
    //     }
    //   });
     
    // }
    void _loadCart() {
    print(email);
    http.post(Uri.parse("https://crimsonwebs.com/s272043/storehelper/php/loadusercart.php"),
        body: {"email": email}).then((response) {
      setState(() {
        cartitem = int.parse(response.body);
        print(cartitem);
      });
    });
  }

  _goToCart() async {
  // Navigator.pushReplacement(
       Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage(user:widget.user)));
              _loadGrams("");
  }
  }
   
   