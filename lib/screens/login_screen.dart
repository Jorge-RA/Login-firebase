import 'package:flutter/material.dart';
import 'package:login_firebase/models/user..dart';
import 'package:login_firebase/services/firebase_login.dart';
import 'package:login_firebase/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  Map<String, String> myForm = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Image.network(
                  'https://cdn.iconscout.com/icon/free/png-256/firebase-3628772-3030134.png',
                  height: 200,
                ),
                SizedBox(height: 30),
                CustomTextField(
                  onChanged: (value) {
                    myForm['email'] = value.trim();
                  },
                  labelText: 'Email',
                  icon: Icons.email,
                ),
                SizedBox(height: 30),
                CustomTextField(
                  onChanged: (value) {
                    myForm['password'] = value;
                  },
                  labelText: 'Contraseña',
                  icon: Icons.password,
                  isPsw: true,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  child: Text('Ingresar'),
                  onPressed: () async {
                    final isLogin =
                        await Firebase().login(User.formAuth(myForm));
                    if (isLogin == null) {
                      Navigator.of(context).pushNamed('home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Usuario no encontrado.\r $isLogin'),
                        ),
                      );
                    }
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('register');
                  },
                  child: Text('Registrarse'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
