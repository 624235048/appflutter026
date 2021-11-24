import 'package:another_flushbar/flushbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rental_room/src/widgets/menu_model.dart';
import 'package:rental_room/src/configs/app_route.dart';
import 'package:rental_room/src/configs/app_setting.dart';
import 'package:rental_room/src/widgets/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  int _current = 0;
  bool isSearching = false;
  bool check = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  bool _checkboxValue = false;
  bool _checkboxValue2 = false;
  bool _checkboxValue3 = false;
  bool _checkboxValue4 = false;

  // @override
  // Widget build(BuildContext context) {
  //   Color getColor(Set<MaterialState> states) {
  //     const Set<MaterialState> interactiveStates = <MaterialState>{
  //       MaterialState.pressed,
  //       MaterialState.hovered,
  //       MaterialState.focused,
  //     };
  //     if (states.any(interactiveStates.contains)) {
  //       return Colors.blue;
  //     }
  //     return Colors.red;
  //   }
  //
  //   return Checkbox(
  //     checkColor: Colors.white,
  //     fillColor: MaterialStateProperty.resolveWith(getColor),
  //     value: isChecked,
  //     onChanged: (bool? value) {
  //       setState(() {
  //         isChecked = value!;
  //       });
  //     },
  //   );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Tatthep'),
              accountEmail: Text('624235061@parichat.skru.ac.th'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Tatthep.jpg'),
              ),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
              ),
            ),
            ...MenuViewModel()
                .items
                .map((e) => ListTile(
                      leading: Icon(e.icon, color: e.iconColor),
                      title: Text(e.title),
                      onTap: () {
                        e.onTap(context);
                      },
                    ))
                .toList(),
            Spacer(),
            Spacer(),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.red),
              title: Text('Logout'),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove(AppSetting.userNameSetting);
                prefs.remove(AppSetting.passwordSetting);
                Navigator.pushNamed(context, AppRoute.loginRoute);
                //Navigator.pushNamed(context, AppRoute.loginRoute);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0XFFFFFB2A2),
        title: !isSearching
            ? Text('ประเภทห้องเช่า')
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

        ],
      ),
      backgroundColor: Color(0XFFFFFF0EC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://www.pf.co.th/blog/wp-content/uploads/2017/07/e-DSC04777-Pano-8.jpg',
                  scale: 1,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Condo',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'สไลต์ ตอนโดมิเนี่ยมแบบเรียบหรู',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.CondoBodyPageRoute);
                  },
                  child: const Text('รายละเอียด'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0XFFFFE5524),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2,
            ),
            SizedBox(
              height: 10,
              width: 350,
              child: Divider(
                color: Colors.red,
                thickness: 5,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //กั้นโรงแรม
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://hor2u.com/upload_hotel_img/_upload/30114_20210322.jpg',
                  scale: 1,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Apartment',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'สไลต์ อพาร์ทเม้นท์ เงียบสงบกลางชุมชน',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.ApartmentBodyPageRoute);
                  },
                  child: const Text('รายละเอียด'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0XFFFFE5524),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2,
            ),
            SizedBox(
              height: 10,
              width: 350,
              child: Divider(
                color: Colors.red,
                thickness: 5,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //กั้นโรงแรม
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://cdn.renthub.in.th/images/uploaded/202005/20200514/apartment_pictures/normal/a9750b006fec2c5440683eab8cc0bfb6.jpg?1589452637',
                  scale: 1,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Mantion',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'สไลต์ แมนชั่นเรียบง่าย ราคาย่อมเยา',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.MansionBodyPageRoute);
                  },
                  child: const Text('รายละเอียด'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0XFFFFE5524),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2,
            ),
            SizedBox(
              height: 10,
              width: 350,
              child: Divider(
                color: Colors.red,
                thickness: 5,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //กั้นโรงแรม
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://hor2u.com/upload_hotel_img/_upload/21147_20160726.jpg',
                  scale: 1,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Rental Room',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'สไลต์ หอพัก ในงบประหยัด ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.RentalroomBodyPageRoute);
                  },
                  child: const Text('รายละเอียด'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0XFFFFE5524),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2,
            ),
            SizedBox(
              height: 10,
              width: 350,
              child: Divider(
                color: Colors.red,
                thickness: 5,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //กั้นโรงแรม
          ],
        ),
      ),
    );
  }
}
