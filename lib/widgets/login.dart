// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hometask_1_optional/widgets/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  bool _isCheked = false;
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordVisible = true;
  SharedPreferences? loginData;

  @override
  void initState() {
    super.initState();
    remembered();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hometask #1 (optional)'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(30),
          children: [
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _loginController,
              decoration: InputDecoration(
                labelText: 'Login',
                hintText: 'Login',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (_loginController.text.toLowerCase().trim() != 'admin') {
                  return 'wrong login';
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Password',
                suffixIcon: IconButton(
                  icon: isPasswordVisible
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: () =>
                      {setState(() => isPasswordVisible = !isPasswordVisible)},
                ),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (_passwordController.text.trim() != '123456') {
                  return 'wrong password';
                } else {
                  return null;
                }
              },
              obscureText: isPasswordVisible,
            ),
            const SizedBox(
              height: 15,
            ),
            CheckboxListTile(
                value: _isCheked,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  'Remember me',
                  style: TextStyle(fontSize: 18),
                ),
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    _isCheked = value!;
                  });
                }),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    final isValid = formKey.currentState!.validate();
                    if (_isCheked == true) {
                      remember(true);
                    }

                    if (isValid == true) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Welcome()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(120, 35),
                    elevation: 5,
                    shadowColor: Colors.greenAccent,
                    shape: StadiumBorder(),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void remember(bool value) async {
    _isCheked = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool('remember', value);
        prefs.setString('login', _loginController.text);
        prefs.setString('password', _passwordController.text);
      },
    );
  }

  void remembered() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var _remember = _prefs.getBool('remember');
    var _login = _prefs.getString('login');
    var _password = _prefs.getString('password');

    if (_remember == true && _login == 'admin' && _password == '123456') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Welcome()));
  }
}
}