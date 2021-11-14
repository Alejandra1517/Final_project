import 'package:final_project/pages/create_staff_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //List<Staff> listStaff = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('principal appbar'),
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   onPressed: () => callListStaff(),
          // ),
        ),
        // body: ListView.builder(itemBuilder: (context, index) {
        //   itemCount:
        //   listStaff.length;
        //   return Text(listStaff[index].name!);
        // }),
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
      ),
    );
  }
}

// callListStaff() async {

//      var url = Uri.parse('https://618ef00450e24d0017ce14f2.mockapi.io/Staff');
//      Response response = await http.get(url);
//      if (response.statusCode >= 200 && response.statusCode <= 300) {
//   (json.decode(response.body) as list).map(staffJson) => Staff.fromJson(staffJson)).tolist();
//   setState(){
//   }
//      } else {
//        print('hubo un error');
//      }
//    }






// class ListStaff extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       margin: EdgeInsets.all(15),
//       elevation: 10,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(30),
//         child: Column(
//           children: <Widget>[
//             Image(
//               image: NetworkImage(
//                   'https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'),
//             ),
//             Container(
//               padding: EdgeInsets.all(10),
//               child: Text('Montañas'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//}

