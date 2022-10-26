// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hometask_1_optional/widgets/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вітаю!'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                          // logout();    
                              
                    },
            label: Icon(Icons.logout),
            icon: Text('Вийти'),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Вітаю!',
          style: TextStyle(
              color: Color.fromARGB(255, 37, 171, 106),
              fontSize: 35,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

//   void logout() async{
//     SharedPreferences loginData = await SharedPreferences.getInstance();
// await loginData.getBool('_isCheked, false');
//   }
}
