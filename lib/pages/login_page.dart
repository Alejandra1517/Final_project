import 'package:final_project/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final nameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  'https://cengage.force.com/resource/1607465003000/loginIcon'),
              TextField(
                controller: nameTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Usuario',
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: lastNameTextController,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ),
              ),
              ElevatedButton(
                  child: Text('Ingresar'),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (Route<dynamic> route) => false);
                  }),
              const Divider(),
              Text('')
            ],
          ),
        ),
      ),
    );
  }
}
