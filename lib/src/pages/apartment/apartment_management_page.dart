import 'dart:io';

import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rental_room/src/configs/app_route.dart';
import 'package:rental_room/src/model/apartment_model.dart';

import 'package:rental_room/src/model/condo_model.dart';
import 'package:rental_room/src/pages/apartment/apartment_page.dart';
import 'package:rental_room/src/pages/condo/condo_body_page.dart';
import 'package:rental_room/src/services/network.dart';

class ApartmentManagementPage extends StatefulWidget {
  @override
  _ApartmentManagementPageState createState() => _ApartmentManagementPageState();
}

class _ApartmentManagementPageState extends State<ApartmentManagementPage> {
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  bool _editMode;

  Apartment _apartment;

  @override
  void initState() {
    _editMode = false;
    _apartment = Apartment();
    super.initState();
  }

  // callback(File image) {
  //   _image = image;
  // }

  @override
  Widget build(BuildContext context) {
    Object arguments = ModalRoute.of(context).settings.arguments;
    if (arguments is Apartment) {
      _apartment = arguments;
      _editMode = true;
    }
    return Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15.0),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: _buildIdInput(),
                        flex: 1,
                      ),
                      SizedBox(width: 12.0),
                      Flexible(
                        child: _buildNameInput(),
                        flex: 1,
                      )
                    ],
                  ),
                  SizedBox(height: 15.0),
                  _buildDetailInput(),
                  SizedBox(height: 15.0),
                  _buildLocationInput(),
                  SizedBox(height: 12.0),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: _buildPriceInput(),
                        flex: 1,
                      ),
                      SizedBox(width: 12.0),
                      Flexible(
                        child: _buildPhoneInput(),
                        flex: 1,
                      )
                    ],
                  ),

                  SizedBox(height: 12.0),
                  _buildLimitedInput(),
                  SizedBox(height: 12.0),
                  _buildTypeInput(),
                  SizedBox(height: 12.0),
                  _buildFacilitiesInput(),
                  SizedBox(height: 12.0),
                  _buildImageInput(),
                  SizedBox(height: 20.0),
                  Text(
                    '** ระบบจะบันทึกตำแหน่ง.... ดังนั้นคุณควรอยู่ที่ห้อง....',
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

                  // ProductImage(callback, image: _game.gameImg),
                ],
              ),
            ),
          ),
        ));
  }

  InputDecoration inputStyle({String label}) => InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
    ),
    labelText: label,
  );

  TextFormField _buildIdInput() => TextFormField(
    enabled: !_editMode,
    initialValue: _apartment.apmId ?? "",
    decoration: inputStyle(label: "ลำดับ"),
    onSaved: (String value) {
      print(value);
      _apartment.apmId = value;
    },
  );

  TextFormField _buildNameInput() => TextFormField(
    initialValue: _apartment.apmName ?? "",
    decoration: inputStyle(label: "ชื่อ"),
    onSaved: (String value) {
      print(value);
      _apartment.apmName = value;
    },
  );

  TextFormField _buildLocationInput() => TextFormField(
    initialValue: _apartment.apmLocation ?? "",
    decoration: inputStyle(label: "ที่อยู่"),
    onSaved: (String value) {
      print(value);
      _apartment.apmLocation = value;
    },
  );

  TextFormField _buildDetailInput() => TextFormField(
    initialValue: _apartment.apmDetail ?? "",
    decoration: inputStyle(label: "รายละเอียด"),
    onSaved: (String value) {
      print(value);
      _apartment.apmDetail = value;
    },
  );

  TextFormField _buildImageInput() => TextFormField(
    initialValue: _apartment.apmImage ?? "",
    decoration: inputStyle(label: "แนบรูป"),
    onSaved: (String value) {
      print(value);
      _apartment.apmImage = value;
    },
  );

  TextFormField _buildLimitedInput() => TextFormField(
    initialValue: _apartment.apmLimitedroom ?? "",
    decoration: inputStyle(label: "ประเภทห้อง"),
    onSaved: (String value) {
      print(value);
      _apartment.apmLimitedroom = value;
    },
  );

  TextFormField _buildFacilitiesInput() => TextFormField(
    initialValue: _apartment.apmFacilities ?? "",
    decoration: inputStyle(label: "สิ่งอำนวยความสะดวก"),
    onSaved: (String value) {
      print(value);
      _apartment.apmFacilities = value;
    },
  );

  TextFormField _buildTypeInput() => TextFormField(
    // initialValue: _condo.condoType  == null ? '0' : _condo.condoType.toString(),
    initialValue: _apartment.apmType ?? "",
    decoration: inputStyle(label: "ชนิดที่พัก"),
    onSaved: (String value) {
      print(value);
      _apartment.apmType = value;
    },
  );

  TextFormField _buildPriceInput() => TextFormField(
    initialValue:
    _apartment.apmPrice == null ? '0' : _apartment.apmPrice.toString(),
    decoration: inputStyle(label: "price"),
    keyboardType: TextInputType.number,
    onSaved: (String value) {
      print(value);
      _apartment.apmPrice = value;
    },
  );

  TextFormField _buildPhoneInput() => TextFormField(
    initialValue:
    _apartment.apmPhone == null ? '0' : _apartment.apmPhone.toString(),
    decoration: inputStyle(label: "Phone"),
    keyboardType: TextInputType.number,
    onSaved: (String value) {
      print(value);
      _apartment.apmPhone = value;
    },
  );

  AppBar _buildAppBar() => AppBar(
    centerTitle: false,
    title: Text(_editMode ? 'Edit Apartment' : 'เพิ่มที่พัก'),
    backgroundColor: Color(0XFFFFFB2A2),
    actions: [
      TextButton(
        onPressed: () async {
          _formKey.currentState.save();
          FocusScope.of(context).requestFocus(FocusNode());
          if (_editMode) {
            try {
              Navigator.pop(context);
              final message = "";
              await NetworkService().editAllApartmentDio(null, _apartment);
              if (message == 'Edit Successfully') {
                Flushbar(
                  icon: Icon(
                    Icons.dangerous,
                    color: Colors.deepOrange,
                  ),
                  backgroundGradient:
                  LinearGradient(colors: [Colors.yellow, Colors.red]),
                  title: "Edit",
                  titleColor: Colors.red,
                  message: "Edit Succesfully",
                  messageColor: Colors.black,
                  duration: Duration(seconds: 3),
                )..show(context);
              }
            } catch (ex) {
              Flushbar(
                icon: Icon(
                  Icons.dangerous,
                  color: Colors.deepOrange,
                ),
                backgroundGradient:
                LinearGradient(colors: [Colors.yellow, Colors.red]),
                title: "Add",
                titleColor: Colors.red,
                message: "Add Failed",
                messageColor: Colors.black,
                duration: Duration(seconds: 3),
              )..show(context);
            }
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoute.ApartmentBodyPageRoute, (route) => false);
          } else {
            try {
              Navigator.pop(context);
              final message = "";
              // await NetworkService().addGameDio(_image, _game);
              if (message == 'Add Successfully') {
                Flushbar(
                  icon: Icon(
                    Icons.dangerous,
                    color: Colors.deepOrange,
                  ),
                  backgroundGradient:
                  LinearGradient(colors: [Colors.yellow, Colors.red]),
                  title: "Add",
                  titleColor: Colors.red,
                  message: "Add Succesfully",
                  messageColor: Colors.black,
                  duration: Duration(seconds: 3),
                )..show(context);
              }
            } catch (ex) {
              Flushbar(
                icon: Icon(
                  Icons.dangerous,
                  color: Colors.deepOrange,
                ),
                backgroundGradient:
                LinearGradient(colors: [Colors.yellow, Colors.red]),
                title: "Add",
                titleColor: Colors.red,
                message: "Add Failed",
                messageColor: Colors.black,
                duration: Duration(seconds: 3),
              )..show(context);
            }
          }
        },
        child: Text(
          'ยืนยัน',
          style: TextStyle(color: Colors.lightBlue),
        ),
      )
    ],
  );
} //end
//

