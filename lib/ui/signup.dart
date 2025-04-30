import 'package:flutter/material.dart';
import 'package:grocery/constants/constants.dart';
import 'package:grocery/services/auth.dart';
import 'package:grocery/ui/widgets/custom_shape.dart';
import 'package:grocery/ui/widgets/customappbar.dart';
import 'package:grocery/ui/widgets/responsive_ui.dart';
import 'package:grocery/ui/widgets/textformfield.dart';



class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final AuthService _auth = AuthService();

  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  String email = '';
  String password = '';
  String firstname = '';
  String lastname = '';
  String number = '';
  String error = '';
  bool loading=false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88,child: CustomAppBar()),
                clipShape(),
                form(),
                acceptTermsTextRow(),
                SizedBox(height: _height/35,),
                button(),
                infoTextRow(),
                socialIconsRow(),
                //signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large? _height/8 : (_medium? _height/7 : _height/6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large? _height/12 : (_medium? _height/11 : _height/10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: _height / 5.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 10.0),
                  blurRadius: 20.0),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
              onTap: (){
                print('Adding photo');
              },

              child: Icon(Icons.add_a_photo, size: _large? 40: (_medium? 33: 31),color: Colors.orange[200],)),
        ),
//        Positioned(
//          top: _height/8,
//          left: _width/1.75,
//          child: Container(
//            alignment: Alignment.center,
//            height: _height/23,
//            padding: EdgeInsets.all(5),
//            decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              color:  Colors.orange[100],
//            ),
//            child: GestureDetector(
//                onTap: (){
//                  print('Adding photo');
//                },
//                child: Icon(Icons.add_a_photo, size: _large? 22: (_medium? 15: 13),)),
//          ),
//        ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left:_width/ 12.0,
          right: _width / 12.0,
          top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            lastNameTextFormField(),
            SizedBox(height: _height/ 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    double _width;

  double _pixelRatio;

  bool large;

  bool medium;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium=  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      
      borderRadius: BorderRadius.circular(30.0),
      elevation: large? 12 : (medium? 10 : 8),
      child: TextFormField(
         //controller: emailController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.orange[200],
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person, color: Colors.orange[200], size: 20),
          hintText: 'First Name',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
        onChanged: (val){
                  setState(() {
                    firstname = val;
                  });
                },
      ),
    );

  }

  Widget lastNameTextFormField() {
    double _width;

  double _pixelRatio;

  bool large;

  bool medium;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium=  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      
      borderRadius: BorderRadius.circular(30.0),
      elevation: large? 12 : (medium? 10 : 8),
      child: TextFormField(
         //controller: emailController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.orange[200],
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person, color: Colors.orange[200], size: 20),
          hintText: 'Last Name',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
        onChanged: (val){
                  setState(() {
                    lastname = val;
                  });
                },
      ),
    );
  }

  Widget emailTextFormField() {
    double _width;

  double _pixelRatio;

  bool large;

  bool medium;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium=  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      
      borderRadius: BorderRadius.circular(30.0),
      elevation: large? 12 : (medium? 10 : 8),
      child: TextFormField(
        // controller: emailController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.orange[200],
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email, color: Colors.orange[200], size: 20),
          hintText: 'Email ID',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
        onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
      ),
    );
  }

  Widget phoneTextFormField() {
    double _width;

  double _pixelRatio;

  bool large;

  bool medium;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium=  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      
      borderRadius: BorderRadius.circular(30.0),
      elevation: large? 12 : (medium? 10 : 8),
      child: TextFormField(
         //controller: emailController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.orange[200],
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone, color: Colors.orange[200], size: 20),
          hintText: 'Mobile Number',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
        onChanged: (val){
                  setState(() {
                    number = val;
                  });
                },
      ),
    );
  }

  Widget passwordTextFormField() {
     double _width;

  double _pixelRatio;

  bool large;

  bool medium;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium=  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      
      borderRadius: BorderRadius.circular(30.0),
      elevation: large? 12 : (medium? 10 : 8),
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.orange[200],
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock, color: Colors.orange[200], size: 20),
          hintText: 'Password',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
        onChanged: (val){
                  setState(() {
                   password = val;
                  });
                },
      )
    );
  }

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: Colors.orange[200],
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              }),
          Text(
            "I accept all terms and conditions",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: _large? 12: (_medium? 11: 10)),
          ),
        ],
      ),
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () async {
        print("Routing to your account");
        dynamic result = await _auth.registerWithEmailAndPassword(email,password,firstname,lastname,number);
        if(result==null)
                    {
                      setState(() {
                        loading = false;
                        error = 'Could not sign in with those credentials';
                      });
                    }
                    else{
                      Navigator.pop(context);
                    }

      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
//        height: _height / 20,
        width:_large? _width/4 : (_medium? _width/3.75: _width/3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange[200], Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('SIGN UP', style: TextStyle(fontSize: _large? 14: (_medium? 12: 10)),),
      ),
    );
  }

  Widget infoTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Or create using social media",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: _large? 12: (_medium? 11: 10)),
          ),
        ],
      ),
    );
  }

  Widget socialIconsRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 80.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/googlelogo.png"),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/fblogo.jpg"),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/twitterlogo.jpg"),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(SIGN_IN);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800, color: Colors.orange[200], fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
