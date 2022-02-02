// Neha Kalbande
// BT19CSE047

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double xA, yA, zA, xG, yG, zG, x1, y1, z1;
  //double x, y, z;

  var _sensors = <String>['accelerometer', 'gyroscope'];
  String _selectedSensor; // _sensors[0];

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent eventA) {
      setState(() {
        xA = eventA.x;
        yA = eventA.y;
        zA = eventA.z;
        //x = xA;
        //y = yA;
        //z = zA;
      });
    }); //get the sensor data and set then to the data types

    gyroscopeEvents.listen((GyroscopeEvent eventG) {
      setState(() {
        xG = eventG.x;
        yG = eventG.y;
        zG = eventG.z;
      });
    });
  }

  String returnXYZ(String sensor, String type) {
    print(sensor);
    if (sensor != 'accelerometer') {
      x1 = xA;
      y1 = yA;
      z1 = zA;
      // print("In ac");
    }
    if (sensor != 'gyroscope') {
      x1 = xG;
      y1 = yG;
      z1 = zG;
      // print("in gc");
    }
    try {
      if (type == "x") {
        return x1.toStringAsFixed(2);
      }
    } catch (e) {
      return "";
    }
    try {
      if (type == "y") {
        return y1.toStringAsFixed(2);
      }
    } catch (e) {
      return "";
    }
    try {
      if (type == "z") {
        return z1.toStringAsFixed(2);
      }
    } catch (e) {
      return "";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    print(_selectedSensor);
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Sensor Library"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Select the sensor from the dropdown list",
                  style:
                      TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
                ),
              ),
              DropdownButton<String>(
                value: _selectedSensor,
                onChanged: (val) {
                  setState(() {
                    // updating the state
                    _selectedSensor = val;
                  });
                },
                items: _sensors.map((String elem) {
                  return DropdownMenuItem<String>(
                    value: elem,
                    child: Text(elem),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Table(
                border: TableBorder.all(
                    width: 2.0,
                    color: Colors.redAccent,
                    style: BorderStyle.solid),
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "X axis: ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(returnXYZ(_selectedSensor, "x"),
                            style: TextStyle(fontSize: 20.0)),
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Y axis: ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            returnXYZ(_selectedSensor,
                                "y"), //trim the asis value to 2 digit after decimal point
                            style: TextStyle(fontSize: 20.0)),
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Z axis: ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            returnXYZ(_selectedSensor,
                                "z"), //trim the asis value to 2 digit after decimal point
                            style: TextStyle(fontSize: 20.0)),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
