import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String value) onChanged;
  final Color primaryColor =
      Color.fromARGB(255, 94, 168, 252); //Color.fromARGB(255, 211, 60, 0);
  //     color: Color.fromARGB(45, 245, 245, 245),

  final String labelText;
  final IconData icon;
  final bool isPsw;
  CustomTextField({
    Key? key,
    required this.labelText,
    required this.icon,
    this.isPsw = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(57, 145, 145, 145),
      ),
      child: TextField(
        cursorColor: primaryColor,
        obscureText: isPsw,
        decoration: InputDecoration(
          label: Text(labelText),
          labelStyle: TextStyle(color: primaryColor),
          suffixIcon: Icon(icon, color: primaryColor),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        onChanged: (value) {
          this.onChanged(value);
        },
      ),
    );
  }
}
