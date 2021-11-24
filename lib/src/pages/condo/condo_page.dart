import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_room/src/configs/api.dart';
import 'package:rental_room/src/configs/app_route.dart';
import 'package:rental_room/src/model/condo_model.dart';
import 'package:rental_room/src/services/network.dart';

class CondoPage extends StatefulWidget {
  @override
  _CondoPageState createState() => _CondoPageState();

}

class _CondoPageState extends State<CondoPage> {

  bool isSearching = false;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  int _current = 0;
  bool check = true;
  bool check2 = true;
  bool check3 = true;
  bool check4 = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFFBF8AFF),
        title: !isSearching
            ? Text('คอนโดมิเนี่ยม')
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
                              value: check4,
                              onChanged: (bool value) {
                                setState(() {
                                  check4 = value;
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
                // content: Text('น้อยกว่า 3,000 บาท\n\n3,000 - 4,000 บาท\n\n4,000 - 5,000 บาท\n\nมากกว่า 5,000 บาท'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      var route = new MaterialPageRoute(
                        builder : (BuildContext context) => new CondoPage(),
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
            image: AssetImage("assets/images/BGBG.jpg",),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white,BlendMode.darken),
          ),
        ),
        child: FutureBuilder<CondoModel>(
          future: NetworkService().getAllCondoDio(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 10,
                ),
                itemCount: snapshot.data.condos.length,
                itemBuilder: (context, index) {
                  var condo = snapshot.data.condos[index];
                  return Container(
                    color: Colors.black12,
                    child: ListTile(
                      onTap: (){
                        print('click list');
                        Navigator.pushNamed(context, AppRoute.DetailCondoPageRoute,
                            arguments: condo);
                      },
                      title: Column(
                        children: [
                          SizedBox(
                            width: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                API.CONDO_IMAGE + condo.condoImage,
                                scale: 1,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          Text(" Condo Number  : " + condo.condoId,style: TextStyle(fontSize: 15,
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
                                  Text(condo.condoName,
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
                                    "ที่อยู่ : " + condo.condoLocation,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'สื่งที่อำนวย : ' + condo.condoFacilities,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      "ประเภทห้องพัก : " +
                                          condo.condoLimitedroom,
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("เบอร์โทรศัพท์ : " + condo.condoPhone,
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "ราคา : " + condo.condoPrice + " Bath. ",
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
        tooltip: 'Home',
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.HomeGuestPageRoute);
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
          title: const Text('Delete ?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Would you like to approve of this message?'),
                Icon(
                  Icons.delete_forever,
                  size: 50,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () async {
                Navigator.of(context).pop();
                final message = await NetworkService().deleteCondoDio(id);
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
