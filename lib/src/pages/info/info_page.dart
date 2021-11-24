import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        title: Text('Tatthep Info'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFC6FFDD), Color(0xFFFFBD786), ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1,0.9],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/Tatthep.jpg'),
              ),
              Text(
                'Tatthep Sookhom',
                style: TextStyle(
                    fontSize: 30, fontFamily: 'Pacifico', color: Colors.orange),
              ),
              Text(
                'Student',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Source Sans Pro',
                    color: Colors.deepOrangeAccent),
              ),
              SizedBox(
                width: 200,
                height: 40,
                child: Divider(
                  color: Colors.redAccent,
                  thickness: 5,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                color: Colors.lime,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.ac_unit,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Nickname : Toey',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                color: Colors.lime,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_alarm,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Email : 624235061@parichat.skru.ac.th',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                color: Colors.limeAccent,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add_call,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Telepone : 0992753925',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
