import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_room/src/configs/api.dart';
import 'package:rental_room/src/configs/app_route.dart';
import 'package:rental_room/src/model/apartment_model.dart';
import 'package:rental_room/src/model/mansion_model.dart';

import 'package:rental_room/src/services/network.dart';

class MansionBodyPage extends StatefulWidget {
  @override
  _MansionBodyPageState createState() => _MansionBodyPageState();

}

class _MansionBodyPageState extends State<MansionBodyPage> {

  bool isSearching = false;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  int _current = 0;
  bool check = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  bool _checkboxValue = false;
  bool _checkboxValue2 = false;
  bool _checkboxValue3 = false;
  bool _checkboxValue4 = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFFBF8AFF),
        title: !isSearching
            ? Text('แมนชั่น')
            : TextField(
          onChanged: (text) {
            text = text.toLowerCase();
            setState(() {});
          },

          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: "ชื่อ ห้องเช่า ราคา",
              hintStyle: TextStyle(color: Colors.white)),
          // onTap: (){
          //         showSearch(context: context, delegate: NetworkService());
          // },
        ),
        actions: <Widget>[
          isSearching
              ? IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                this.isSearching = false;
              });
            },
          )
              : IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                this.isSearching = true;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.money_off,
              color: Colors.black,
            ),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(
                  'ช่วงราคา THB',
                  style: TextStyle(fontSize: 25),
                ),
                key: _formkey,
                content: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 10,
                        width: 500,
                        child: Divider(
                          color: Colors.black12,
                          thickness: 2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('น้อยกว่า 3,000 บาท'),
                          Checkbox(
                              value: check,
                              onChanged: (bool value) {
                                setState(() {
                                  check = value;
                                });
                              })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('3,000 - 4,000 บาท'),
                          Checkbox(
                              value: check2,
                              onChanged: (bool value) {
                                setState(() {
                                  check2 = value;
                                });
                              })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('4,000 - 5,000 บาท'),
                          Checkbox(
                              value: check3,
                              onChanged: (bool value) {
                                setState(() {
                                  check3 = value;
                                });
                              })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('มากกว่า 5,000 บาท'),
                          Checkbox(
                              value: _checkboxValue4,
                              onChanged: (bool value) {
                                setState(() {
                                  _checkboxValue4 = value;
                                });
                              })
                        ],
                      ),
                      SizedBox(
                        height: 10,
                        width: 500,
                        child: Divider(
                          color: Colors.black12,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      var route = new MaterialPageRoute(
                        builder : (BuildContext context) => new MansionBodyPage(),
                      );
                      Navigator.of(context).push(route);
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: 1000,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/BGBG3.jpg",),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white,BlendMode.darken),
          ),
        ),
        child: FutureBuilder<MansionModel>(
          future: NetworkService().getAllMansionDio(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 10,
                ),
                itemCount: snapshot.data.mansions.length,
                itemBuilder: (context, index) {
                  var mansion = snapshot.data.mansions[index];
                  return Container(
                    color: Colors.black12,
                    child: ListTile(
                      onTap: (){
                        print('click list');
                        Navigator.pushNamed(context, AppRoute.DetailMansionPageRoute,
                            arguments: mansion);
                      },
                      title: Column(
                        children: [
                          SizedBox(
                            width: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                API.MANSION_IMAGE + mansion.msImage,
                                scale: 1,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          Text(" Apartment Number  : " + mansion.msId,style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 3.5,
                              color: Colors.black45)),
                          Text('เป็นที่นิยม',style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 3.5,
                              color: Colors.redAccent)),
                          SizedBox(
                            height: 1,
                          ),
                          Container(
                            child: Card(
                              color: Colors.grey.shade50,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                              ),
                              elevation: 5,
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(mansion.msName,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 3.5,
                                          color: Colors.deepOrange)),
                                  SizedBox(
                                    height: 10,
                                    width: 200,
                                    child: Divider(
                                      color: Colors.black12,
                                      thickness: 2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "ที่อยู่ : " + mansion.msLocation,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'สื่งที่อำนวย : ' + mansion.msFacilities,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      "ประเภทห้องพัก : " +
                                          mansion.msLimitedroom,
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("เบอร์โทรศัพท์ : " + mansion.msPhone,
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "ราคา : " + mansion.msPrice + " Bath. ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 5.5,
                                        color: Colors.green),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),

                                ],
                              ),

                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "แก้ไขข้อมูล : ",
                                  style: TextStyle(fontSize: 16)),
                              Flexible(
                                child: IconButton(
                                  onPressed: (){
                                    Navigator.pushNamed(context, AppRoute.MansionManagementPageRoute, arguments: mansion);
                                  },
                                  icon: Icon(Icons.edit, color: Colors.green),

                                ),
                                flex: 1,
                              ),
                              Text(
                                  "ลบข้อมูล : ",
                                  style: TextStyle(fontSize: 16)),
                              Flexible(
                                child: IconButton(
                                  onPressed: () async {
                                    print('delete');
                                    _showMyDialog(mansion.msId);
                                  },
                                  icon: Icon(Icons.delete_forever,
                                      color: Colors.redAccent),
                                ),
                              )
                            ],
                          ),
                          // condo.condoPhone == '0'
                          //     ? Text('฿' + condo.condoPrice + '   out of stock')
                          //     : Text('฿' +
                          //     condo.condoPrice +
                          //     " " 'stock :' +
                          //     condo.condoPhone),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Flexible(
                          //       child: IconButton(
                          //         onPressed: () {
                          //           // Navigator.pushNamed(context, AppRoute.gameManament, arguments: game);
                          //         },
                          //         icon: Icon(Icons.edit, color: Colors.indigo),
                          //       ),
                          //       flex: 1,
                          //     ),
                          //     // Flexible(
                          //     //   child: IconButton(
                          //     //     onPressed: () async {
                          //     //       print('delete');
                          //     //       _showMyDialog(game.id);
                          //     //     },
                          //     //     icon: Icon(Icons.delete_forever,
                          //     //         color: Colors.redAccent),
                          //     //   ),
                          //     // )
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0XFFFFFB2A2),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        iconSize: 30,


        items: [
          BottomNavigationBarItem(label: 'Favorit',icon: Icon(Icons.favorite,color: Colors.red,)),
          BottomNavigationBarItem(label: 'Notification',icon: Icon(Icons.notifications_active,color: Colors.green,)),
        ],

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.RentalManagementPageRoute);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  Future<void> _showMyDialog(String id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ลบข้อมูล ?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('คุณต้องการลบข้อมูลใช่หรือไม่ ?'),
                Icon(
                  Icons.delete_forever,
                  size: 150,
                  color: Colors.red,
                ),
                Text('**หากคุณลบข้อมูลแล้ว จะไม่สามารถกู้คืนข้อมูลได้**',style: TextStyle(fontSize: 13,color: Colors.red),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () async {
                Navigator.of(context).pop();
                final message = await NetworkService().deleteMansionDio(id);
                print(message);
                if (message == 'Delete Successfully') {
                  Flushbar(
                    icon: Icon(
                      Icons.dangerous,
                      color: Colors.deepOrange,
                    ),
                    backgroundGradient:
                    LinearGradient(colors: [Colors.yellow, Colors.red]),
                    title: "Delete",
                    titleColor: Colors.red,
                    message: "Delete Successfully",
                    messageColor: Colors.black,
                    duration: Duration(seconds: 3),
                  )..show(context);
                }
                setState(() {

                });
                initState();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
