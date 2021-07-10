import 'package:flutter/material.dart';
import 'package:storehelper/user.dart';


import 'loginscreen.dart';
import 'sellergoodslist.dart';
import 'sellermainscreen.dart';
import 'sellermateriallist.dart';
import 'sellernewlist.dart';
import 'sellerprofile.dart';
import 'sellerpromolist.dart';

class SellerDrawer extends StatefulWidget {
  final User user;

  const SellerDrawer({Key key, this.user}) : super(key: key);
  @override
  _SellerDrawerState createState() => _SellerDrawerState();
}

class _SellerDrawerState extends State<SellerDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountEmail: Text(widget.user.email),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage(
              "assets/images/sellericon.jpg",
            ),
          ),
          accountName: Text(widget.user.name),
        ),
        ListTile(
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => SellerHomeScreen(
                            user: widget.user
                          )));
            }),
        ListTile(
            title: Text("Promotion List"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pop(context);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => SellerPromotionListScreen(
                            user: widget.user
                          )));
            }),
        ListTile(
            title: Text("New List"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pop(context);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => SellerNewListScreen(
                            user: widget.user,
                          )));
            }),
        ListTile(
            title: Text("Material List"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => SellerMaterialListScreen(
                            user: widget.user,
                          )));
            }),
        ListTile(
            title: Text("Goods List"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => SellerGoodsListScreen(
                            user: widget.user,
                          )));
            }),
        ListTile(
            title: Text("My Profile"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pop(context);
               Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => ProfileUI3(
                        user: widget.user,
                          )));
            }),
        ListTile(
            title: Text("Logout"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigator.pop(context);
              //                Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (content) => LoginScreen(
                        
              //             )));
              _onBackPressed();
            })
      ],
    ));
  }
  _onBackPressed() {
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
                    Navigator.push(context,
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
}