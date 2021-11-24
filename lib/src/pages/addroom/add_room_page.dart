import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_room/src/configs/app_route.dart';
import 'package:share/share.dart';

class AddRoomPage extends StatefulWidget {
  @override
  _AddRoomPageState createState() => _AddRoomPageState();
}

class _AddRoomPageState extends State<AddRoomPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFFFFB2A2),
          title: Text('รายละเอียดของห้อง')
      ),
      backgroundColor: Color(0XFFFFFF4F0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              child: Card(
                color: Colors.grey.shade100,
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
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(

                          onPressed: () {

                          },
                          child: const Text('                                เลือกจากอัลบั้ม...                                     '),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0XFFFFE5524),
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'ชื่อห้องเช่า',
                        icon: Icon(Icons.drive_file_rename_outline, color: Colors.black54,),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'ราคา THB',
                        icon: Icon(Icons.money_off, color: Colors.green,),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'ประเภทห้องเช่า',
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black54,),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'จำกัดเพศของผู้เช่า',
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black54,),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'เบอร์โทรติดต่อ',
                        icon: Icon(Icons.phone, color: Colors.green,),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'สิ่งอำนวยความสะดวก',
                        icon: Icon(Icons.wifi, color: Colors.black54,),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'ที่อยู่',
                        icon: Icon(Icons.location_on_rounded, color: Colors.red,),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    SizedBox(
                      height: 20,
                      width: 335,
                      child: Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      '** ระบบจะบันทึกตำแหน่ง.... ดังนั้นคุฯควรอยู่ที่ห้อง....',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 20,
                      width: 335,
                      child: Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'ละติจูด',
                        icon: Icon(Icons.album_outlined, color: Colors.black54,),
                        // suffixIcon: IconButton(
                        //    icon: Icon(Icons.album_outlined),
                        //   onPressed: () { },
                        //
                        // ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'ลองติจูด',
                        icon: Icon(Icons.album_outlined, color: Colors.black54,),
                        // suffixIcon: IconButton(
                        //    icon: Icon(Icons.album_outlined),
                        //   onPressed: () { },
                        //
                        // ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(

                          onPressed: () {

                          },
                          child: const Text('ค้นหาตำแหน่ง'),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0XFFF0FCB6A),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                      width: 335,
                      child: Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(

                          onPressed: () {
                               Navigator.pushNamed(context, AppRoute.ApartmentPageRoute);
                          },
                          child: const Text('                                     เพิ่ม                                       '),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0XFFFFE5524),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                      width: 335,
                      child: Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
