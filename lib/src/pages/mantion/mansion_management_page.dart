import 'dart:io';

import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rental_room/src/configs/app_route.dart';



import 'package:rental_room/src/model/mansion_model.dart';

import 'package:rental_room/src/services/network.dart';

class MansionManagementPage extends StatefulWidget {
  @override
  _MansionManagementPageState createState() => _MansionManagementPageState();
}

class _MansionManagementPageState extends State<MansionManagementPage> {
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  bool _editMode;

  Mansion _mansion;

  @override
  void initState() {
    _editMode = false;
    _mansion = Mansion();
    super.initState();
  }

  // callback(File image) {
  //   _image = image;
  // }

  @override
  Widget build(BuildContext context) {
    Object arguments = ModalRoute.of(context).settings.arguments;
    if (arguments is Mansion) {
      _mansion = arguments;
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

    initialValue: _mansion.msId ?? "",
    decoration: inputStyle(label: "ลำดับ"),
    onSaved: (String value) {
      print(value);
      _mansion.msId = value;
    },
  );

  TextFormField _buildNameInput() => TextFormField(
    initialValue: _mansion.msName ?? "",
    decoration: inputStyle(label: "ชื่อ"),
    onSaved: (String value) {
      print(value);
      _mansion.msName = value;
    },
  );

  TextFormField _buildLocationInput() => TextFormField(
    initialValue: _mansion.msLocation ?? "",
    decoration: inputStyle(label: "ที่อยู่"),
    onSaved: (String value) {
      print(value);
      _mansion.msLocation = value;
    },
  );

  TextFormField _buildDetailInput() => TextFormField(
    initialValue: _mansion.msDetail ?? "",
    decoration: inputStyle(label: "รายละเอียด"),
    onSaved: (String value) {
      print(value);
      _mansion.msDetail = value;
    },
  );

  TextFormField _buildImageInput() => TextFormField(
    initialValue: _mansion.msImage ?? "",
    decoration: inputStyle(label: "แนบรูป"),
    onSaved: (String value) {
      print(value);
      _mansion.msImage = value;
    },
  );

  TextFormField _buildLimitedInput() => TextFormField(
    initialValue: _mansion.msLimitedroom ?? "",
    decoration: inputStyle(label: "ประเภทห้อง"),
    onSaved: (String value) {
      print(value);
      _mansion.msLimitedroom = value;
    },
  );

  TextFormField _buildFacilitiesInput() => TextFormField(
    initialValue: _mansion.msFacilities ?? "",
    decoration: inputStyle(label: "สิ่งอำนวยความสะดวก"),
    onSaved: (String value) {
      print(value);
      _mansion.msFacilities = value;
    },
  );

  TextFormField _buildTypeInput() => TextFormField(
    // initialValue: _condo.condoType  == null ? '0' : _condo.condoType.toString(),
    initialValue: _mansion.msType ?? "",
    decoration: inputStyle(label: "ชนิดที่พัก"),
    onSaved: (String value) {
      print(value);
      _mansion.msType = value;
    },
  );

  TextFormField _buildPriceInput() => TextFormField(
    initialValue:
    _mansion.msPrice == null ? '0' : _mansion.msPrice.toString(),
    decoration: inputStyle(label: "price"),
    keyboardType: TextInputType.number,
    onSaved: (String value) {
      print(value);
      _mansion.msPrice = value;
    },
  );

  TextFormField _buildPhoneInput() => TextFormField(
    initialValue:
    _mansion.msPhone == null ? '0' : _mansion.msPhone.toString(),
    decoration: inputStyle(label: "Phone"),
    keyboardType: TextInputType.number,
    onSaved: (String value) {
      print(value);
      _mansion.msPhone = value;
    },
  );

  AppBar _buildAppBar() => AppBar(
    centerTitle: false,
    title: Text(_editMode ? 'Edit Mansion' : 'เพิ่มที่พัก'),
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
              await NetworkService().editAllMansionDio(null, _mansion);
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
                context, AppRoute.MansionManagementPageRoute, (route) => false);
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

// class ProductImage extends StatefulWidget {
//   final Function callBack;
//   final String image;
//
//   const ProductImage(this.callBack, {Key key, this.image})
//       : super(key: key);
//
//   @override
//   _ProductImageState createState() => _ProductImageState();
// }
//
// class _ProductImageState extends State<ProductImage> {
//   File _imageFile;
//   String _image;
//   final _picker = ImagePicker();
//
//   @override
//   void initState() {
//     _image = widget.image;
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _imageFile?.delete();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           _buildPickerImage(),
//           _buildPreviewImage(),
//         ],
//       ),
//     );
//   }
//
//   dynamic _buildPreviewImage() {
//     if ((_image == null || _image.isEmpty) && _imageFile == null) {
//       return SizedBox();
//     }
//
//     final container = (Widget child) => Container(
//       color: Colors.grey[100],
//       margin: EdgeInsets.only(top: 4),
//       alignment: Alignment.center,
//       height: 350,
//       child: child,
//     );
//
//     // return _image != null
//     //     ? container(Image.network('${API.GAME_IMAGE}/$_image'))
//     //     : Stack(
//     //   children: [
//     //     container(Image.file(_imageFile)),
//     //     _buildDeleteImageButton(),
//     //   ],
//     // );
//   }
//
//   OutlinedButton _buildPickerImage() => OutlinedButton.icon(
//     icon: Icon(Icons.image),
//     label: Text('image'),
//     onPressed: () {
//       _modalPickerImage();
//     },
//   );
//
//   void _modalPickerImage() {
//     final buildListTile =
//         (IconData icon, String title, ImageSource source) => ListTile(
//       leading: Icon(icon),
//       title: Text(title),
//       onTap: () {
//         Navigator.of(context).pop();
//         _pickImage(source);
//       },
//     );
//
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return SafeArea(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               buildListTile(
//                 Icons.photo_camera,
//                 "Take a picture from camera",
//                 ImageSource.camera,
//               ),
//               buildListTile(
//                 Icons.photo_library,
//                 "Choose from photo library",
//                 ImageSource.gallery,
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void _pickImage(ImageSource source) {
//     _picker
//         .getImage(
//       source: source,
//       imageQuality: 70,
//       maxHeight: 500,
//       maxWidth: 500,
//     )
//         .then((file) {
//       if (file != null) {
//         setState(() {
//           _imageFile = File(file.path);
//           // _image = null;
//           widget.callBack(_imageFile);
//         });
//       }
//     }).catchError((error) {
//       //todo
//     });
//   }
//
//   Positioned _buildDeleteImageButton() => Positioned(
//     right: 0,
//     child: IconButton(
//       onPressed: () {
//         setState(() {
//           // _imageFile = null;
//           widget.callBack(null);
//         });
//       },
//       icon: Icon(
//         Icons.clear,
//         color: Colors.black54,
//       ),
//       splashColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//     ),
//   );
//
//   Future<void> _showMyDialog(String id) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Delete ?'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: const <Widget>[
//                 Text('Would you like to approve of this message?'),
//                 Icon(
//                   Icons.delete_forever,
//                   size: 50,
//                   color: Colors.red,
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Ok'),
//               onPressed: () async {
//                 Navigator.of(context).pop();
//                 final message = await null;
//                 print(message);
//                 if (message == 'Delete Successfully') {
//                   Flushbar(
//                     icon: Icon(
//                       Icons.dangerous,
//                       color: Colors.deepOrange,
//                     ),
//                     backgroundGradient:
//                     LinearGradient(colors: [Colors.yellow, Colors.red]),
//                     title: "Delete",
//                     titleColor: Colors.red,
//                     message: "Delete Successfully",
//                     messageColor: Colors.black,
//                     duration: Duration(seconds: 3),
//                   )..show(context);
//                 }
//                 setState(() {
//
//                 });
//                 initState();
//               },
//             ),
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
