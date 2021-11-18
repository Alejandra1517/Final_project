import 'dart:convert';
import 'package:final_project/models/staff.dart';
import 'package:flutter/material.dart';
import 'package:final_project/pages/create_staff_page.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'update_staff_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  pushRoute(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => InfoStaffPage()));
  }

  List<Staff> listStaff = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('principal appbar'),
        actions: [
          GestureDetector(
            onTap: () => callListStaff(),
            child: Icon(Icons.ac_unit),
          ),
        ],
      ),
      body: ListView.builder(
          //  itemCount: listStaff.length,
          itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => pushRoute(context),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(
                color: Colors.black,
                width: 0.0,
              ),
            ),
            elevation: 4.0,
            margin: EdgeInsets.only(right: 20, left: 20, top: 10),

            child: ListTile(
                trailing: Icon(Icons.delete),
                leading: Icon(Icons.person),
                title: Text(
                    '${listStaff[index].name!} ${listStaff[index].lastName!}')),
            //''),
          ),
        );
      }),
      floatingActionButton: Tooltip(
        message: 'Registrar nuevo empleado',
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateStaff()),
            );
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.orange,
        ),
      ),
    );
  }

  callListStaff() async {
    var url = Uri.parse('https://618ef00450e24d0017ce14f2.mockapi.io/Staff');
    Response response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      listStaff = (jsonDecode(response.body) as List).map((staffJson) {
        return Staff.fromJson(staffJson);
      }).toList();

      setState(() {});
    } else {
      print('Hubo un error');
    }
  }
}

Future<http.Response> callDeleteStaff(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://618ef00450e24d0017ce14f2.mockapi.io/Staff/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return response;
}
