import 'package:flutter/material.dart';

class UpdateStaff extends StatefulWidget {
  @override
  _UpdateStaffState createState() => _UpdateStaffState();
}

class _UpdateStaffState extends State<UpdateStaff> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  // Future<Cases> updateCases(String id, Cases cases) async {
  //   Map data = {
  //     'name': cases.name,
  //     'gender': cases.gender,
  //     'age': cases.age,
  //     'address': cases.address,
  //     'city': cases.city,
  //     'country': cases.country,
  //     'status': cases.status
  //   };

  //   final Response response = await put(
  //     '$apiUrl/$id',
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(data),
  //   );
  //   if (response.statusCode == 200) {
  //     return Cases.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to update a case');
  //   }
  // }

}
