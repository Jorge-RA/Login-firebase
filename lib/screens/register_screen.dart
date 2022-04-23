import 'package:flutter/material.dart';
import 'package:login_firebase/models/user..dart';
import 'package:login_firebase/widgets/custom_text_field.dart';

import '../services/firebase_login.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
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
                  icon: Icons.email,
                  labelText: 'Email',
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
                CustomTextField(
                  onChanged: (value) {
                    myForm['repeatPassword'] = value;
                  },
                  icon: Icons.password,
                  labelText: 'Repita contraseña',
                  isPsw: true,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  child: Text('Registrarse'),
                  onPressed: () async {
                    if (myForm['password'] != myForm['repeatPassword']) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Las contraseñas no coinciden'),
                        ),
                      );
                      return;
                    }

                    final isRegis =
                        await Firebase().register(User.formAuth(myForm));
                    if (isRegis == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Registrado con éxito.'),
                        ),
                      );
                      Navigator.of(context).pushReplacementNamed('login');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(isRegis),
                        ),
                      );
                    }
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('login');
                  },
                  child: Text('Loguearse'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
