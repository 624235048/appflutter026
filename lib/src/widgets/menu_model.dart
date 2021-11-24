import 'package:rental_room/src/configs/app_route.dart';
import 'package:flutter/material.dart';

class Menu {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function(BuildContext context) onTap;

  const Menu({
    this.title,
    this.icon,
    this.iconColor = Colors.grey,
    this.onTap,
  });
}

class MenuViewModel {
  MenuViewModel();

  List<Menu> get items => <Menu>[

    Menu(
      title: 'ประเภทห้องเช่า',
      icon: Icons.account_balance,
      iconColor: Colors.lightBlueAccent,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.homeRoute);
      },
    ),
    Menu(
      title: 'เปรียบเทียบราคาห้องเช่า',
      icon: Icons.money_off,
      iconColor: Colors.red,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.PriceRoomPageRoute);
      },
    ),

    Menu(
      title: 'เพิ่มห้องเช่า',
      icon: Icons.add,
      iconColor: Colors.green,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.AddRoomPageRoute);
      },
    ),


  ];
}
