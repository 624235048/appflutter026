import 'package:animated_background/animated_background.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:rental_room/src/configs/app_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  bool isHidden = false;

  int selectedRadio;
  int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  var _passwordController = TextEditingController();

  var _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFFFF9475),
        title: Text('Login'),
      ),

      backgroundColor: Color(0XFFFFFB2A2),

      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFC6FFDD),
                  Color(0xFFFFBD786),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.9],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Image.network(
            'https://www.img.in.th/images/e015af20b33f8dd7e9ad3026e0c88127.jpg',
            width: 200,
            height: 200,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Login',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontFamily: 'SourceSansPro'),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _usernameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'username',
                    hintText: 'xx@gmail.com',
                    icon: Icon(Icons.person),
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: isHidden,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'password',
                    icon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: isHidden
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: togglePasswordVisibility),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: selectedRadio,
                      onChanged: (val) {
                        print("Radio $val");
                        setSelectedRadio(val = 1);
                      },
                    ),
                    Text("Remember me"),
                    Radio(
                        value: 2,
                        groupValue: selectedRadio,
                        activeColor: Colors.green,
                        onChanged: (val) {
                          print("Radio $val");
                          setSelectedRadio(val = 2);
                        }),
                    Text("Forget Password"),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    final username = _usernameController.text;
                    final password = _passwordController.text;

                    Navigator.pushNamed(context, AppRoute.homeRoute);
                    Flushbar(
                      icon: Icon(
                        Icons.check,
                        color: Colors.black,
                      ),
                      backgroundGradient: LinearGradient(
                          colors: [Colors.green, Colors.lightGreenAccent]),
                      title: "Login Success",
                      titleColor: Colors.black,
                      message: "Login Success , Welcome",
                      messageColor: Colors.black,
                      duration: Duration(seconds: 3),
                    )..show(context);
                  },
                  child: Text('LOGIN'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0XFFFFF2D00),
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 300,
                  child: Divider(
                    color: Colors.black12,
                    thickness: 1,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, AppRoute.CreateuserPageRoute);
                  },
                  child: Text('Create Username'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0XFFFFF2D00),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}
