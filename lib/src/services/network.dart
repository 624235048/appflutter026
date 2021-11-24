import 'dart:convert';
import 'dart:io';

import 'package:rental_room/src/configs/api.dart';
import 'package:rental_room/src/model/apartment_model.dart';
import 'package:rental_room/src/model/condo_model.dart';
import 'package:rental_room/src/model/mansion_model.dart';
import 'package:rental_room/src/model/dormitory_model.dart';
import 'package:rental_room/src/services/network.dart';

import 'package:dio/dio.dart';

import 'package:http_parser/http_parser.dart';

class NetworkService{
  NetworkService._internal();

  static final NetworkService _instace = NetworkService._internal();

  factory NetworkService() => _instace;

  static final Dio _dio = Dio();


  Future<CondoModel> getAllCondoDio()  async {
    var url = API.BASE_URL + API.CONDO;
    print('url getAllCondoDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return condoModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }


  Future<ApartmentModel> getAllApartmentDio()  async {
    var url = API.BASE_URL + API.APARTMENT;
    print('url getAllApartmentDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return apartmentModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }


  Future<MansionModel> getAllMansionDio()  async {
    var url = API.BASE_URL + API.MANSION;
    print('url getAllMansionDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return mansionModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }


  Future<DormitoryModel> getAllDormitoryDio()  async {
    var url = API.BASE_URL + API.DORMITORY;
    print('url getAllDormitoryDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return dormitoryModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }




  // Future<String> validateUserLoginDio(String username, String password) async {
  //   FormData data = FormData.fromMap({
  //     'username': username,
  //     'password': password,
  //   });
  //   try {
  //     //var url = API.BASE_URL + '/flutterapp/f_user_login.php';
  //     //var url = API.BASE_URL + '/api/user';
  //     var url = API.BASE_URL + '/flutterapi/api/user';
  //     final response = await _dio.post(url, data: data);
  //     if (response.statusCode == 200) {
  //       var jsonString = response.data;
  //       // var jsonMap = json.encode(jsonString);
  //       String username = jsonString["username"];
  //       print('username = ' + username);
  //       String password = jsonString["password"];
  //       print('password = ' + password);
  //       if (username != 'failed') {
  //         return 'pass';
  //       } else {
  //         return 'failed';
  //       }
  //     } else {
  //       return 'failed';
  //     }
  //   } catch (Exception) {
  //     throw Exception; //('Network failed');
  //   }
  // }





  //Future<String> addProduct(File imageFile, Game game) async {
  ///condo
  Future<String> addAllCondoDio(File imageFile, Condo condo) async {
    FormData data = FormData.fromMap({
      'condo_id': condo.condoId,
      'condo_name': condo.condoName,
      'condo_price': int.parse(condo.condoPrice),
      'condo_location': condo.condoLocation,
      //'game_img': game.gameImg,
      'condo_phone': int.parse(condo.condoPhone),
      'condo_limitedroom': int.parse(condo.condoLimitedroom),
      'condo_facilities': int.parse(condo.condoFacilities),
      'condo_type': int.parse(condo.condoType),
      if (imageFile != null)
        'condo_img': 'has_image'
      else
        'condo_img': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });
    try {
      final response = await _dio.post(API.BASE_URL + API.CONDO, data: data);
      print(response);
      if (response != null) {
        if (response.statusCode == 200) {
          print(response.data);
          if (response.data > 0) {
            return 'Add Successfully';
          } else {
            return 'Add Failed';
          }
        }
      } else {
        print('response is nulllllll');
      }
    } catch (DioError) {
      print('Exception --> response is nulllllll');
      print(DioError.toString());
      throw DioError;
    }
  }

  Future<String> editAllCondoDio(File imageFile, Condo condo) async {
    FormData data = FormData.fromMap({
      'condo_id' : condo.condoId,
      'condo_name': condo.condoName,
      'condo_price': condo.condoPrice,
      'condo_image': condo.condoImage,
      'condo_location': condo.condoLocation,
      'condo_phone': condo.condoPhone,
      'condo_type': condo.condoType,
      'condo_limitedroom': condo.condoLimitedroom,
      'condo_facilities': condo.condoFacilities,
      // if (imageFile != null)
      //   'photo': await MultipartFile.fromFile(
      //     imageFile.path,
      //     contentType: MediaType('image', 'jpg'),
      //   ),
      if (imageFile != null)
        'condo_image': condo.condoImage
      else
        'condo_image': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final response =
    await _dio.post(API.BASE_URL + API.CONDO + '/' + condo.condoId, data: data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.data);
      if (response.data > 0) {
        return 'Edit Successfully';
      } else {
        return 'Edit Failed';
      }
    }
    throw Exception('Network failed');
  }

  Future<String> deleteCondoDio(String id) async {
    final response = await _dio.delete(API.BASE_URL + API.CONDO + '/' + id);

    if (response.statusCode == 200) {
      if (response.data > 0) {
        return 'Delete Successfully';
      } else {
        return 'Delete Failed';
      }
    }
    throw Exception('Network failed');
  }//condo


  ///apartment
  Future<String> addAllApartmentDio(File imageFile, Apartment apartment) async {
    FormData data = FormData.fromMap({
      'apartment_id': apartment.apmId,
      'apartment_name': apartment.apmName,
      'apartment_price': int.parse(apartment.apmPrice),
      'apartment_location': apartment.apmLocation,
      //'game_img': game.gameImg,
      'apartment_phone': int.parse(apartment.apmPhone),
      'apartment_limitedroom': int.parse(apartment.apmLimitedroom),
      'apartment_facilities': int.parse(apartment.apmFacilities),
      'apartment_type': int.parse(apartment.apmType),
      if (imageFile != null)
        'apartment_img': 'has_image'
      else
        'apartment_img': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });
    try {
      final response = await _dio.post(API.BASE_URL + API.APARTMENT, data: data);
      print(response);
      if (response != null) {
        if (response.statusCode == 200) {
          print(response.data);
          if (response.data > 0) {
            return 'Add Successfully';
          } else {
            return 'Add Failed';
          }
        }
      } else {
        print('response is nulllllll');
      }
    } catch (DioError) {
      print('Exception --> response is nulllllll');
      print(DioError.toString());
      throw DioError;
    }
  }

  Future<String> editAllApartmentDio(File imageFile, Apartment apartment) async {
    FormData data = FormData.fromMap({
      'apm_id' : apartment.apmId,
      'apm_name': apartment.apmName,
      'apm_price': apartment.apmPrice,
      'apm_image': apartment.apmImage,
      'apm_location': apartment.apmLocation,
      'apm_phone': apartment.apmPhone,
      'apm_type': apartment.apmType,
      'apm_limitedroom': apartment.apmLimitedroom,
      'apm_facilities': apartment.apmFacilities,

      if (imageFile != null)
        'apm_image': apartment.apmImage
      else
        'apm_image': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final response =
    await _dio.post(API.BASE_URL + API.APARTMENT + '/' + apartment.apmId, data: data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.data);
      if (response.data > 0) {
        return 'Edit Successfully';
      } else {
        return 'Edit Failed';
      }
    }
    throw Exception('Network failed');
  }

  Future<String> deleteApartmentDio(String id) async {
    final response = await _dio.delete(API.BASE_URL + API.APARTMENT + '/' + id);

    if (response.statusCode == 200) {
      if (response.data > 0) {
        return 'Delete Successfully';
      } else {
        return 'Delete Failed';
      }
    }
    throw Exception('Network failed');
  }//apartment



  //mansion
  Future<String> addAllMansionDio(File imageFile, Mansion mansion) async {
    FormData data = FormData.fromMap({
      'ms_id': mansion.msId,
      'ms_name': mansion.msName,
      'ms_price': int.parse(mansion.msPrice),
      'ms_location': mansion.msLocation,
      //'game_img': game.gameImg,
      'ms_phone': int.parse(mansion.msPhone),
      'ms_limitedroom': int.parse(mansion.msLimitedroom),
      'ms_facilities': int.parse(mansion.msFacilities),
      'ms_type': int.parse(mansion.msType),
      if (imageFile != null)
        'ms_img': 'has_image'
      else
        'ms_img': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });
    try {
      final response = await _dio.post(API.BASE_URL + API.MANSION, data: data);
      print(response);
      if (response != null) {
        if (response.statusCode == 200) {
          print(response.data);
          if (response.data > 0) {
            return 'Add Successfully';
          } else {
            return 'Add Failed';
          }
        }
      } else {
        print('response is nulllllll');
      }
    } catch (DioError) {
      print('Exception --> response is nulllllll');
      print(DioError.toString());
      throw DioError;
    }
  }

  Future<String> editAllMansionDio(File imageFile, Mansion mansion) async {
    FormData data = FormData.fromMap({
      'ms_id' : mansion.msId,
      'ms_name': mansion.msName,
      'ms_price': mansion.msPrice,
      'ms_image': mansion.msImage,
      'ms_location': mansion.msLocation,
      'ms_phone': mansion.msPhone,
      'ms_type': mansion.msType,
      'ms_limitedroom': mansion.msLimitedroom,
      'ms_facilities': mansion.msFacilities,

      if (imageFile != null)
        'ms_image': mansion.msImage
      else
        'ms_image': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final response =
    await _dio.post(API.BASE_URL + API.MANSION + '/' + mansion.msId, data: data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.data);
      if (response.data > 0) {
        return 'Edit Successfully';
      } else {
        return 'Edit Failed';
      }
    }
    throw Exception('Network failed');
  }

  Future<String> deleteMansionDio(String id) async {
    final response = await _dio.delete(API.BASE_URL + API.MANSION + '/' + id);

    if (response.statusCode == 200) {
      if (response.data > 0) {
        return 'Delete Successfully';
      } else {
        return 'Delete Failed';
      }
    }
    throw Exception('Network failed');
  }//mansion


  //rental
  Future<String> addAllDormitoryDio(File imageFile, Dormitory dormitory) async {
    FormData data = FormData.fromMap({
      'ddm_id': dormitory.dmId,
      'dm_name': dormitory.dmName,
      'dm_price': int.parse(dormitory.dmPrice),
      'dm_location': dormitory.dmLocation,
      //'game_img': game.gameImg,
      'dm_phone': int.parse(dormitory.dmPhone),
      'dm_limitedroom': int.parse(dormitory.dmLimitedroom),
      'dm_facilities': int.parse(dormitory.dmFacilities),
      'dm_type': int.parse(dormitory.dmType),
      if (imageFile != null)
        'dm_img': 'has_image'
      else
        'dm_img': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });
    try {
      final response = await _dio.post(API.BASE_URL + API.DORMITORY, data: data);
      print(response);
      if (response != null) {
        if (response.statusCode == 200) {
          print(response.data);
          if (response.data > 0) {
            return 'Add Successfully';
          } else {
            return 'Add Failed';
          }
        }
      } else {
        print('response is nulllllll');
      }
    } catch (DioError) {
      print('Exception --> response is nulllllll');
      print(DioError.toString());
      throw DioError;
    }
  }

  Future<String> editAllRentalDio(File imageFile, Dormitory dormitory) async {
    FormData data = FormData.fromMap({
      'dm_id' : dormitory.dmId,
      'dm_name': dormitory.dmName,
      'dm_price': dormitory.dmPrice,
      'dm_image': dormitory.dmImage,
      'dm_location': dormitory.dmLocation,
      'dm_phone': dormitory.dmPhone,
      'dm_type': dormitory.dmType,
      'dm_limitedroom': dormitory.dmLimitedroom,
      'dm_facilities': dormitory.dmFacilities,

      if (imageFile != null)
        'dm_image': dormitory.dmImage
      else
        'dm_image': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final response =
    await _dio.post(API.BASE_URL + API.DORMITORY + '/' + dormitory.dmId, data: data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.data);
      if (response.data > 0) {
        return 'Edit Successfully';
      } else {
        return 'Edit Failed';
      }
    }
    throw Exception('Network failed');
  }

  Future<String> deleteRentalDio(String id) async {
    final response = await _dio.delete(API.BASE_URL + API.DORMITORY + '/' + id);

    if (response.statusCode == 200) {
      if (response.data > 0) {
        return 'Delete Successfully';
      } else {
        return 'Delete Failed';
      }
    }
    throw Exception('Network failed');
  }//rental

}//end class