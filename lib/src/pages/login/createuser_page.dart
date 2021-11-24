import 'package:flutter/material.dart';
import 'package:rental_room/src/configs/app_route.dart';

class CreateuserPage extends StatefulWidget {
  @override
  _CreateuserPageState createState() => _CreateuserPageState();
}

class _CreateuserPageState extends State<CreateuserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFFFFB2A2),
        title: Text('สร้างบัญชีผู้ใช้'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Form(
            child: Column(
              children: <Widget>[

                _buildNameInput(),
                SizedBox(height: 12.0),
                _buildSurnameInput(),
                SizedBox(height: 12.0),
                _buildEmailInput(),
                SizedBox(height: 12.0),
                _buildPasswordInput(),
                SizedBox(height: 30.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.loginRoute);
                    },
                    child: Container(
                      height: 40, width: 300,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(255, 143, 158, 1),
                              Color.fromRGBO(255, 188, 143, 1),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pink.withOpacity(0.2),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ]
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'ลงทะเบียน',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              letterSpacing: 0.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),


                ]),
                SizedBox(height: 10.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.homeRoute);
                    },
                    child: Container(
                      height: 40, width: 300,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(255, 143, 158, 1),
                              Color.fromRGBO(255, 188, 143, 1),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pink.withOpacity(0.2),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ]
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'เข้าสู่ระบบ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              letterSpacing: 0.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),


                ]),
                SizedBox(height: 10.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.loginRoute);
                    },
                    child: Container(
                      height: 40, width: 300,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(255, 143, 158, 1),
                              Color.fromRGBO(255, 188, 143, 1),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pink.withOpacity(0.2),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ]
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoute.loginRoute);
                          },
                          child: Text(
                            'ยกเลิก',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              letterSpacing: 0.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),


                ]),

              ],
            ),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }


  InputDecoration inputStyle({String label}) => InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black12,
      ),
    ),
    labelText: label,
  );


  TextFormField _buildNameInput() => TextFormField(
    decoration: inputStyle(label: "ชื่อ"),

  );

  TextFormField _buildSurnameInput() => TextFormField(
    decoration: inputStyle(label: "นามสกุล"),

  );

  TextFormField _buildEmailInput() => TextFormField(
    decoration: inputStyle(label: "อีเมลล์"),


  );

  TextFormField _buildPasswordInput() => TextFormField(
    decoration: inputStyle(label: "รหัสผ่าน"),
    keyboardType: TextInputType.number,

  );


}//end
