
import 'package:rental_room/src/pages/addroom/add_room_page.dart';
import 'package:rental_room/src/pages/apartment/apartment_body_page.dart';
import 'package:rental_room/src/pages/apartment/apartment_management_page.dart';
import 'package:rental_room/src/pages/apartment/apartment_page.dart';
import 'package:rental_room/src/pages/condo/condo_body_page.dart';
import 'package:rental_room/src/pages/condo/condo_management_page.dart';
import 'package:rental_room/src/pages/condo/condo_page.dart';
import 'package:rental_room/src/pages/details/detail_apartment_page.dart';
import 'package:rental_room/src/pages/details/detail_condo_page.dart';
import 'package:rental_room/src/pages/details/detail_mansion_page.dart';
import 'package:rental_room/src/pages/details/detail_rental_page.dart';

import 'package:rental_room/src/pages/home/home_guest_page.dart';
import 'package:rental_room/src/pages/home/home_page.dart';
import 'package:rental_room/src/pages/info/info_page.dart';
import 'package:rental_room/src/pages/login/createuser_page.dart';
import 'package:rental_room/src/pages/login/login_page.dart';

import 'package:flutter/material.dart';
import 'package:rental_room/src/pages/mantion/mansion_body_page.dart';
import 'package:rental_room/src/pages/mantion/mansion_management_page.dart';
import 'package:rental_room/src/pages/mantion/mantion_page.dart';
import 'package:rental_room/src/pages/map/google_mapcondo_page.dart';
import 'package:rental_room/src/pages/priceroom/price_room_page.dart';
import 'package:rental_room/src/pages/rentalroom/rental_management_page.dart';
import 'package:rental_room/src/pages/rentalroom/rentalroom_body_page.dart';
import 'package:rental_room/src/pages/rentalroom/rentalroom_page.dart';

class AppRoute{
  static const homeRoute = "home";
  static const infoRoute = "info";
  static const loginRoute = "login";
  static const CreateuserPageRoute = "Create";
  static const CondoPageRoute = "Condo";
  static const ApartmentPageRoute = "Apartment";
  static const MansionPageRoute = "Mantion";
  static const RentalroomPageRoute = "Rental";
  static const PriceRoomPageRoute = "PriceRoom";
  static const AddRoomPageRoute = "AddRoom";
  static const GoogleMapPageRoute = "Map";
  static const HomeGuestPageRoute = "HomeGuest";
  static const ApartmentManagementPageRoute = "ApartManage";
  static const CondoManagementPageRoute = "CondoManage";
  static const CondoBodyPageRoute = "CondoBody";
  static const ApartmentBodyPageRoute = "ApartBody";
  static const MansionBodyPageRoute = "MansionBody";
  static const RentalroomBodyPageRoute = "RentalBody";
  static const DetailCondoPageRoute = "DetailCondo";
  static const DetailRentalPageRoute = "DetailRentail";
  static const DetailMansionPageRoute = "DetailMansion";
  static const DetailApartmentPageRoute = "DetailApartment";
  static const MansionManagementPageRoute = "MansionManage";
  static const RentalManagementPageRoute = "RentalManage";
  // static const ApartmentManagementPageRoute = "ApartmentManage";


  final _route = <String, WidgetBuilder>{
    homeRoute: (context) => HomePage(),
    infoRoute: (context) => InfoPage(),
    loginRoute: (context) => LoginPage(),
    CreateuserPageRoute: (context) => CreateuserPage(),
    CondoPageRoute: (context) => CondoPage(),
    ApartmentPageRoute: (context) => ApartmentPage(),
    MansionPageRoute: (context) => MansionPage(),
    RentalroomPageRoute: (context) => RentalroomPage(),
    PriceRoomPageRoute: (context) => PriceRoomPage(),
    AddRoomPageRoute: (context) => AddRoomPage(),
    GoogleMapPageRoute: (context) => GoogleMapcondoPage(),
    HomeGuestPageRoute: (context) => HomeGuestPage(),
    ApartmentManagementPageRoute: (context) => ApartmentManagementPage(),
    CondoBodyPageRoute: (context) => CondoBodyPage(),
    ApartmentBodyPageRoute: (context) => ApartmentBodyPage(),
    MansionBodyPageRoute: (context) => MansionBodyPage(),
    RentalroomBodyPageRoute: (context) => RentalroomBodyPage(),
    CondoManagementPageRoute: (context) => CondoManagementPage(),
    DetailCondoPageRoute: (context) => DetailCondoPage(),
    DetailMansionPageRoute: (context) => DetailMansionPage(),
    DetailRentalPageRoute: (context) => DetailRentalPage(),
    DetailApartmentPageRoute: (context) => DetailApartmentPage(),
    MansionManagementPageRoute: (context) => MansionManagementPage(),
    RentalManagementPageRoute: (context) => RentalManagementPage(),
  };

  get getAll => _route;
} //end class