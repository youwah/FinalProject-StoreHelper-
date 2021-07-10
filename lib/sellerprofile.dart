import 'package:flutter/material.dart';
 
import 'package:flutter/cupertino.dart';


import 'editsellerporfile.dart';
import 'sellermainscreen.dart';
import 'user.dart';

class ProfileUI3 extends StatefulWidget {
final User user;
  

  const ProfileUI3({Key key, this.user}) : super(key: key);

  @override
  _ProfileUI3State createState() => _ProfileUI3State();
}

class _ProfileUI3State extends State<ProfileUI3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/back.png"
                  ),
                  fit: BoxFit.cover
                )
              ),
            child: Container(
              width: double.infinity,
              height: 200,
              child: Container(
                alignment: Alignment(0.0,2.5),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/images/sellericon.jpg"
                  ),
                  radius: 70.0,
                ),
              ),
            ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              widget.user.email
              ,style: TextStyle(
                fontSize: 25.0,
                color:Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Full Name :" +
              widget.user.name
              ,style: TextStyle(
                fontSize: 18.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Country:" +
              widget.user.country
              ,style: TextStyle(
                fontSize: 18.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            SizedBox(
              height: 10,
            ),
              Text("Phone Number:" +
              widget.user.phonenum
              ,style: TextStyle(
                fontSize: 18.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            SizedBox(
              height: 10,
            ),
            // Card(
            //   margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
            //   elevation: 2.0,
            //   child: Padding(
            //       padding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
            //       child: Text("Skill Sets",style: TextStyle(
            //           letterSpacing: 2.0,
            //           fontWeight: FontWeight.w300
            //       ),))
            // ),
                MaterialButton(
                  onPressed: (){
                      Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => EditSellerProfilePage(
                            user: widget.user,
                          )));
                  },
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.pink,Colors.redAccent]
                      ),
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
                      alignment: Alignment.center,
                      child: Text(
                        "Edit Porfile",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                  ),
                ),
            SizedBox(
              height: 25,
            ),
            Text(
              "ACCOUNT"
              ,style: TextStyle(
                fontSize: 20.0,
                color:Colors.black,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400
            ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   // Expanded(
                     Column(
                        children: [
                          Text("Status",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600
                            ),),
                          SizedBox(
                            height: 7,
                          ),
                          Text("Active",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w300
                            ),)
                        ],
                      ),
                 //   ),
                    // Expanded(
                    //   child:
                    //   Column(
                    //     children: [
                    //       Text("On Delivery",
                    //         style: TextStyle(
                    //             color: Colors.blueAccent,
                    //             fontSize: 22.0,
                    //             fontWeight: FontWeight.w600
                    //         ),),
                    //       SizedBox(
                    //         height: 7,
                    //       ),
                    //       Text("2000",
                    //         style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 22.0,
                    //             fontWeight: FontWeight.w300
                    //         ),)
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
      //      Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // children: [
                MaterialButton(
                  onPressed: (){
                      Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => SellerHomeScreen(
                            user: widget.user,
                          )));
                  },
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.pink,Colors.redAccent]
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
                      alignment: Alignment.center,
                      child: Text(
                        "Back",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                  ),
                ),
              //   MaterialButton(
              //     onPressed: (){
              //     },
              //     shape:  RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(80.0),
              //     ),
              //     child: Ink(
              //       decoration: BoxDecoration(
              //         gradient: LinearGradient(
              //             begin: Alignment.centerLeft,
              //             end: Alignment.centerRight,
              //             colors: [Colors.pink,Colors.redAccent]
              //         ),
              //         borderRadius: BorderRadius.circular(80.0),
              //       ),
              //       child: Container(
              //         constraints: BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
              //         alignment: Alignment.center,
              //         child: Text(
              //           "Edit Porfile",
              //           style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 12.0,
              //               letterSpacing: 2.0,
              //               fontWeight: FontWeight.w300
              //           ),
              //         ),
              //       ),
              //     ),
              //   )
              // ],
      //      )
          ],
        ),
      )
    );
  }
}