import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rental_room/src/configs/api.dart';
import 'package:rental_room/src/configs/app_route.dart';
import 'package:rental_room/src/model/condo_model.dart';
import 'package:share/share.dart';

class DetailCondoPage extends StatefulWidget {
  @override
  _DetailCondoPageState createState() => _DetailCondoPageState();
}

class _DetailCondoPageState extends State<DetailCondoPage> {
  final controller = TextEditingController();
  Condo _condoModel;
  double rating = 0;
  @override
  void initState() {
    _condoModel = new Condo();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int _current = 0;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  List<Map<String, String>> imgArray = [
    {
      "img":
          "https://images.unsplash.com/photo-1501084817091-a4f3d1d19e07?fit=crop&w=2700&q=80",
      "title": "Login",
      "description":
          "You need a creative space ready for your art? We got that covered.",
      "price": "\$125",
      "page": "login"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1500628550463-c8881a54d4d4?fit=crop&w=2698&q=80",
      "title": "Info",
      "description":
          "Don't forget to visit one of the coolest art galleries in town.",
      "price": "\$200",
      "page": "info"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1496680392913-a0417ec1a0ad?fit=crop&w=2700&q=80",
      "title": "Upcoming",
      "description":
          "Some of the best music video services someone could have for the lowest prices.",
      "price": "\$300",
      "page": "upcoming"
    },
  ];

  @override
  Widget build(BuildContext context) {
    Object arguments = ModalRoute.of(context).settings.arguments;
    if (arguments is Condo) {
      _condoModel = arguments;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Color(0XFFFFFB2A2),

      appBar: AppBar(
        backgroundColor: Color(0XFFFFFB2A2),
        title: Text(
          'รายละเอียดของห้อง',
          style: TextStyle(letterSpacing: 5),
        ),
      ),

      body: Container(
        height: 1000,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/BGBG.jpg",
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.darken),
          ),
        ),
        child: SingleChildScrollView(
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
                    API.CONDO_IMAGE + _condoModel.condoImage,
                    scale: 0.5,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                _condoModel.condoName,
                style: TextStyle(fontSize: 13, letterSpacing: 5),
              ),
              Text(
                'กำลังเป็นที่นิยม !!!',
                style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 2,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w500,
                ),
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
                      Text(
                        _condoModel.condoName,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: 200,
                        child: Divider(
                          color: Colors.black12,
                          thickness: 2,
                        ),
                      ),
                      Text(
                        'ที่อยู่ :' + _condoModel.condoLocation,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'สิ่งอำนวย :' + _condoModel.condoFacilities,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'ประเภทห้องพัก :' + _condoModel.condoLimitedroom,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'เบอร์โทรศัพท์ :' + _condoModel.condoPhone,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ราคา : " + _condoModel.condoPrice + " Bath. ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 5.5,
                            color: Colors.green),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'จองที่พัก',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0XFFFFE5524),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: 300,
                        child: Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ดูแผนที่:',
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.location_on_rounded,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoute.GoogleMapPageRoute);
                            },
                          ),
                          Text(
                            'แชร์ข้อมูล:',
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.share,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              Share.share('ข้อมูลที่พัก : ' +
                                  _condoModel.condoImage +
                                  '  ' +
                                  _condoModel.condoName +
                                  '  ' +
                                  _condoModel.condoLocation +
                                  '  ' +
                                  _condoModel.condoFacilities +
                                  '  ' +
                                  _condoModel.condoLimitedroom +
                                  '  ' +
                                  _condoModel.condoPhone +
                                  '  ' +
                                  _condoModel.condoPrice);
                              // Share.share('Title : ' + _movieModel.title + ' - Overview : ' + _movieModel.overview +  'https://image.tmdb.org/t/p/w500/' +
                              //     _movieModel.posterPath);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                        width: 300,
                        child: Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                      ),
                      Text('ระดับดาว',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 21)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Rating : $rating',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 5.5,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RatingBar.builder(
                          initialRating: rating,
                          minRating: 1,
                          itemSize: 40,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          updateOnDrag: true,
                          onRatingUpdate: (rating) => setState(() {
                            this.rating = rating;
                          })),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => showRating(),
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
                      Text(
                        'ความคิดเห็น',
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
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                              'assets/images/Tatthep.jpg',
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'ความคิดเห็น',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 16),
                      ),
                      TextField(
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.red),
                        decoration: InputDecoration(
                            hintText: "แสดงความคิดเห็น",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              var route = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new DetailCondoPage(),
                              );
                              Navigator.of(context).push(route);
                            },
                            child: const Text('Sent'),
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
                height: 10,
              ),
              CarouselSlider.builder(
                itemCount: imgList.length,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (context, index, realIdx) {
                  return Container(
                    child: Center(
                        child: Image.network(imgList[index],
                            fit: BoxFit.cover, width: 1000)),
                  );
                },
              ),
              SizedBox(height: 20),
              CarouselSlider(
                items: imgArray
                    .map((item) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, item["page"]);
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.4),
                                          blurRadius: 8,
                                          spreadRadius: 0.3,
                                          offset: Offset(0, 3))
                                    ]),
                                    child: AspectRatio(
                                      aspectRatio: 2 / 2,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: Image.network(
                                          item["img"],
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Column(
                                    children: [
                                      Text(item["price"],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.pinkAccent)),
                                      Text(item["title"],
                                          style: TextStyle(
                                              fontSize: 32,
                                              color: Colors.black)),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, right: 16.0, top: 8),
                                        child: Text(
                                          item["description"],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.pinkAccent),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                    height: 530,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    aspectRatio: 4 / 4,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    // viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0XFFFFFB2A2),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
              label: 'Favorit',
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              )),
          BottomNavigationBarItem(
              label: 'Notification',
              icon: Icon(
                Icons.notifications_active,
                color: Colors.green,
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        tooltip: 'Home',
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.homeRoute);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildRating() => RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      itemSize: 30,
      itemPadding: EdgeInsets.symmetric(horizontal: 5),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) => setState(() {
        this.rating = rating;
      }));

  void showRating() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('ระดับความพึงพอใจของที่พัก'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '**กรุณาประเมิณความพึงใจ**',
              style: TextStyle(fontSize: 15, color: Colors.red),
            ),
            const SizedBox(
              height: 20,
            ),
            buildRating(),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ));
}
