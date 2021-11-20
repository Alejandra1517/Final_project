import 'dart:convert';
import 'package:final_project/models/staff.dart';
import 'package:final_project/pages/login_page.dart';
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
        MaterialPageRoute(builder: (BuildContext context) => UpdateStaff()));
  }

  List<Staff> listStaff = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrar personal'),
        actions: [
          GestureDetector(
            onTap: () => callListStaff(),
            child: Icon(Icons.list),
          ),
          OptionUsers()
        ],
      ),
      body: ListView.builder(
          itemCount: listStaff.length,
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
                  trailing: GestureDetector(
                    onTap: () => null,
                    child: Icon(Icons.delete),
                  ),
                  leading: Icon(Icons.person),
                  title: Text(
                      '${listStaff[index].name!} ${listStaff[index].lastName!}'),
                ),
                //
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
    var url = Uri.parse('https:6196e68baf46280017e7e304.mockapi.io/Staff');
    Response response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      listStaff = (jsonDecode(response.body) as List).map((staffJson) {
        return Staff.fromJson(staffJson);
      }).toList();
      setState(() {});
    } else {
      print('Hubo un error');
    }
    return CircularProgressIndicator();
  }

//   Future<http.Response> callDeleteStaff(String id) async {
//     var staffBody = jsonEncode(.toJson());

//     var url = Uri.parse('https://6196e68baf46280017e7e304.mockapi.io/Staff/$id');

//     final response = http.delete(url,
//         body: staffBody,
//         headers: <String, String>{
//           'ContentType': 'application/json, Charse-Utf-8'
//         });
//     return response;
//   }

}

class OptionUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: Icon(Icons.more_vert),
        itemBuilder: (BuildContext context) => <PopupMenuItem>[
              PopupMenuItem(
                child: Container(
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text('Tema')),
                      InkWell(
                          onTap: () => Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage())),
                          child: Text('Salir')),
                    ],
                  ),
                ),
              ),
            ]);
  }
}
