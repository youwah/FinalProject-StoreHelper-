import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'porfile.dart';
import 'user.dart';
 

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final User user;
  

  const EditProfilePage({Key key, this.user}) : super(key: key);
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _countryController = new TextEditingController();
  TextEditingController _phoneNumController = new TextEditingController();
  double screenHeight, screenWidth;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(
                   builder: (BuildContext context) => ProfileUI2(
                     user: widget.user,
                   )));
          },
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.settings,
        //       color: Colors.green,
        //     ),
        //     onPressed: () {
        //       // Navigator.of(context).push(MaterialPageRoute(
        //       //     builder: (BuildContext context) => SettingsPage()));
        //     },
        //   ),
        // ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/images/porfile.png",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          // child: Icon(
                          //   Icons.edit,
                          //   color: Colors.white,
                          // ),
                  //         child: IconButton(
                  //              icon: Icon(
                  //              Icons.edit,
                  //              color: Colors.white,
                  //                   ),
                  //               onPressed: () {
                  //                 Navigator.of(context).push(MaterialPageRoute(
                  //               builder: (BuildContext context) => ProfileUI2(
                  //                       user: widget.user,
                  //                                )));
                  //      },
                  //  ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
                Container(
                  height:screenHeight/3,
                  width: screenWidth/1,
                  child: Column(
                    children:[
                      TextField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: widget.user.name,
                          labelText: 'Name',
                        ),
                      ),
                      TextField(
                        controller: _countryController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: widget.user.country,
                          labelText: 'Country',
                        ),
                      ),
                      TextField(
                        controller: _phoneNumController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: widget.user.phonenum,
                          labelText: 'Phone No',
                        ),
                      ),
                    ]
                  ),
                ),
              // buildTextField("Full Name", widget.user.name, false),
              // buildTextField("E-mail", widget.user.email, false),
              // buildTextField("Password", widget.user.password, true),
              // buildTextField("Location", widget.user.phonenum, false),
              // SizedBox(
              //   height: 35,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                        color: Colors.red[400],
                   // onPressed: onUpdate,
                   onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                   builder: (BuildContext context) => ProfileUI2(
                     user: widget.user,
                   )));
                   },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  MaterialButton(
                     onPressed: onUpdate,
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildTextField(
  //     String labelText, String placeholder, bool isPasswordTextField) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 35.0),
  //     child: TextField(
  //       obscureText: isPasswordTextField ? showPassword : false,
  //       decoration: InputDecoration(
  //           suffixIcon: isPasswordTextField
  //               ? IconButton(
  //                   onPressed: () {
  //                     setState(() {
  //                       showPassword = !showPassword;
  //                     });
  //                   },
  //                   icon: Icon(
  //                     Icons.remove_red_eye,
  //                     color: Colors.grey,
  //                   ),
  //                 )
  //               : null,
  //           contentPadding: EdgeInsets.only(bottom: 3),
  //           labelText: labelText,
  //           floatingLabelBehavior: FloatingLabelBehavior.always,
  //           hintText: placeholder,
  //           hintStyle: TextStyle(
  //             fontSize: 16,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.black,
  //           )),
  //     ),
  //   );
  // }
  void onUpdate() {



    setState(() {

      String _name = _nameController.text.toString();
      String _country = _countryController.text.toString();
      String _phonenum = _phoneNumController.text.toString();

      if(_name.isEmpty && _country.isEmpty && _phonenum.isEmpty ){
          Fluttertoast.showToast(
            msg: "Do not have any update",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red[200],
            textColor: Colors.white,
            fontSize: 16.0);
      }else{

        _name = (_nameController.text.toString() == "")
      ? widget.user.name
      : _nameController.text.toString();
      _country = (_countryController.text.toString() == "")
      ? widget.user.country
      : _countryController.text.toString();
      _phonenum = (_phoneNumController.text.toString() == "")
      ? widget.user.phonenum
      : _phoneNumController.text.toString();

      showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
          title: Text('Update Profile?',style: Theme.of(context).textTheme.headline5),
          content: Text("Are you sure?",style: Theme.of(context).textTheme.bodyText1),
          actions: [
            TextButton(
              child:(Text('Yes',style: Theme.of(context).textTheme.bodyText2)),
              onPressed: (){
                _updateProfile(_name,_country,_phonenum,widget.user.email);
                Navigator.of(context).pop();
              },),
            TextButton(
              child: (Text('No',style: Theme.of(context).textTheme.bodyText2)),
              onPressed: (){
                Navigator.of(context).pop();
              },),
          ],
        );
      });
      }
    });
}

void _updateProfile(String name, String country, String phonenum,String email) {

  
    print(email);
    print(name);
    print(country);
    print(phonenum);
    

    setState(() {
      http.post(
      Uri.parse("https://crimsonwebs.com/s272043/storehelper/php/updateprofile.php"),
      body: {
        "email":email,
        "name":name,
        "country":country,
        "phonenum":phonenum,
      
      }).then(
        (response){
          print(response.body);

          if(response.body=="success"){
            Fluttertoast.showToast(
            msg: "Update Success.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red[200],
            textColor: Colors.white,
            fontSize: 16.0);
          }else{
            Fluttertoast.showToast(
            msg: "Update Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red[200],
            textColor: Colors.white,
            fontSize: 16.0);
          }

        widget.user.name=name;
        widget.user.country=country;
        widget.user.phonenum=phonenum;
        
      }
    );
    });
  }
}
