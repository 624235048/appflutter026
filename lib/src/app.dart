import 'package:rental_room/src/configs/app_route.dart';

import 'package:flutter/material.dart';
import 'package:rental_room/src/pages/addroom/add_room_page.dart';
import 'package:rental_room/src/pages/apartment/apartment_body_page.dart';
import 'package:rental_room/src/pages/apartment/apartment_page.dart';
import 'package:rental_room/src/pages/condo/condo_body_page.dart';
import 'package:rental_room/src/pages/condo/condo_management_page.dart';
import 'package:rental_room/src/pages/condo/condo_page.dart';
import 'package:rental_room/src/pages/home/home_guest_page.dart';
import 'package:rental_room/src/pages/home/home_page.dart';
import 'package:rental_room/src/pages/login/createuser_page.dart';

import 'package:rental_room/src/pages/login/login_page.dart';
import 'package:rental_room/src/pages/mantion/mansion_body_page.dart';
import 'package:rental_room/src/pages/mantion/mantion_page.dart';
import 'package:rental_room/src/pages/priceroom/price_room_page.dart';
import 'package:rental_room/src/pages/rentalroom/rental_management_page.dart';
import 'package:rental_room/src/pages/rentalroom/rentalroom_body_page.dart';
import 'package:rental_room/src/pages/rentalroom/rentalroom_page.dart';







class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.cyan),
      // home: HomeGuestPage(),
      home: HomeGuestPage(),
      routes: AppRoute().getAll,
    );
  }
} //end class