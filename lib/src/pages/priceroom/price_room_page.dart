import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class PriceRoomPage extends StatefulWidget {
  @override
  _PriceRoomPageState createState() => _PriceRoomPageState();
}

class _PriceRoomPageState extends State<PriceRoomPage> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFFFFB2A2),
          title: Text('เปรียบเทียบราคาห้องเช่า')
      ),
      backgroundColor: Color(0XFFFFFF4F0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 15,
            ),
            // Text(
            //   'เลือกห้องเช่า',
            //   textAlign: TextAlign.start,
            //   style: TextStyle(fontSize: 16,color: Colors.blueAccent),
            // ),
            TextField(
              decoration: InputDecoration(
                labelText: 'เลือกห้องเช่า',
                icon: Icon(Icons.water_damage, color: Colors.green,),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'กับ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'เลือกห้องเช่า',
                icon: Icon(Icons.water_damage, color: Colors.green,),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(


                  onPressed: () {

                  },
                  child: const Text('เปรียบเทียบ'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0XFFF0FCB6A),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
              width: 20,
              child: Divider(
                color: Colors.black12,
                thickness: 5,
              ),
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'The Place Apartment',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 200,
                      child: Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      'ที่อยู่ : 72 ซอย บางนา-ตราด 23 แขวง บางนา เขตบางนา กรุงเทพมหานคร 10260',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
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
                      'ราคา : 3,500.00 บาท',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,letterSpacing: 5.5,color: Colors.lightGreen),
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
                      'สื่งที่อำนวย : Free Wifi',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
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
                      'ประเภทห้องเช่า : อพาร์ทเมนท์',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
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
                      'จำกัดเพศของผู้เช่า : ห้องพักรวม',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
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
                      'เบอร์ติดต่อ : 093-548-4619',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
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
                      'ระดับดาว',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network('https://www.img.in.th/images/63577f51ef286994ad91db7540bd6bbc.png'),
                      ),
                    ),
                    Text(
                      'คะแนน : 1',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(


                          onPressed: () {

                          },
                          child: const Text('ให้คะแนน'),
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
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
              width: 20,
              child: Divider(
                color: Colors.black12,
                thickness: 5,
              ),
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'S.K.Apartment',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 200,
                      child: Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      'ที่อยู่ : 48 ซอย สุขุมวิท 101/1 (วชิรธรรมสาธิต 18) ถนน สุขุมวิท แขวง บางนา เขตบางนา กรุงเทพมหานคร 10260',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
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
                      'ราคา : 5,500.00 บาท',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,letterSpacing: 5.5,color: Colors.lightGreen),
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
                      'สื่งที่อำนวย : Free Wifi',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
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
                      'ประเภทห้องเช่า : อพาร์ทเมนท์',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
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
                      'จำกัดเพศของผู้เช่า : ห้องพักรวม',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
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
                      'เบอร์ติดต่อ : 093-548-4619',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
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
                      'ระดับดาว',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network('https://www.img.in.th/images/63577f51ef286994ad91db7540bd6bbc.png'),
                      ),
                    ),
                    Text(
                      'คะแนน : 1',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(


                          onPressed: () {

                          },
                          child: const Text('ให้คะแนน'),
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
