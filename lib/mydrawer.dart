import 'package:flutter/material.dart';

import 'package:storehelper/user.dart';



import 'favorite.dart';
import 'historyscreen.dart';
import 'homescreen.dart';
import 'loginscreen.dart';
import 'materiallist.dart';
import 'porfile.dart';
import 'promotionlist.dart';

class MyDrawer extends StatefulWidget {
  final User user;

  const MyDrawer({Key key, this.user}) : super(key: key);
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountEmail: Text(widget.user.email),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage(
              "assets/images/porfile.png",
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
                      builder: (content) => HomeScreen(
                            user: widget.user,
                          )));
            }),
        ListTile(
            title: Text("Order History"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pop(context);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => PaymentHistoryScreen(
                            user: widget.user
                          )));
            }),
        ListTile(
            title: Text("Favorite"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pop(context);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => FavoriteScreen(
                            user: widget.user,curtab: 0,
                          )));
            }),
        ListTile(
            title: Text("Material"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => MaterialListScreen(
                            user: widget.user,
                          )));
            }),
        ListTile(
            title: Text("Promotion"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) =>   PromotionListScreen(
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
                      builder: (content) => ProfileUI2(
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