import 'dart:convert';
import 'dart:io';

import 'package:final_project/models/staff.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CreateStaff extends StatefulWidget {
  @override
  _CreateStaffState createState() => _CreateStaffState();
}

class _CreateStaffState extends State<CreateStaff> {
  final textControllerName = TextEditingController();
  final textControllerLastName = TextEditingController();
  final textControllerAdress = TextEditingController();
  final textControllerBirthday = TextEditingController();
  final textControllerSalary = TextEditingController();
  final textControllerCreateDay = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('devuelvis'),
        //  backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: textControllerName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombres',
                  hintText: 'Enter Password',
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: textControllerLastName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Apellidos',
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: textControllerAdress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Dirección',
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: textControllerBirthday,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Fecha de nacimiento',
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: textControllerSalary,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Salario',
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: textControllerCreateDay,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Fecha de ingreso',
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              RaisedButton(
                child: Text("Back"),
                onPressed: () => callCreateStaff(
                    textControllerName.text,
                    textControllerLastName.text,
                    textControllerAdress.text,
                    textControllerBirthday.text,
                    textControllerSalary.text,
                    textControllerCreateDay.text),
              )
            ],
          ),
        ),
      ),
    );
  }

  void callCreateStaff(String name, String lastName, String adress,
      String birthday, String salary, String createDate) async {
    var staff = Staff(
        name: name,
        lastName: lastName,
        adress: adress,
        birthday: birthday,
        salary: salary);

    var url = Uri.parse('https://618ef00450e24d0017ce14f2.mockapi.io/Staff');

    var staffBody = jsonEncode(staff);

    Response response = await http.post(url,
        body: staffBody,
        headers: <String, String>{
          'ContentType': 'application/json, Charse-Utf-8'
        });
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      Navigator.pop(context);
    } else {
      print('hubo un error');
    }
  }
}


//async {
  //   var url = Uri.parse('https://618ef00450e24d0017ce14f2.mockapi.io/Staff');
  //   Response response = await http.get(url);
  //   if (response.StatusCode >= 200 && response.StatusCode <= 300) {
    //(json.decode(response.body) as list).map(staffJson) => Staff.fromJson(staffJson)).tolist();
    //setState(){

    //}
  //   } else {
  //     print('hubo un error');
  //   }
  // }