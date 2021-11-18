import 'package:flutter/material.dart';

class InfoStaffPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('devuelvis'),
      ),
      body: Container(
        width: 350,
        height: 450,
        padding: EdgeInsets.only(top: 80),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.all(15),
          elevation: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_DAPSTuYSGKFkQKCvrBoSsE2f1ecPtRpigw&usqp=CAU'),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('person'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
