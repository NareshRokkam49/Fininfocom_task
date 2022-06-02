import 'package:flutter/material.dart';

const submitstyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black);

const colorstyle = TextStyle(color: Colors.black);

bool checkemailvalidation(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool checkphonenovalidation(String phonenumber) {
  return RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
      .hasMatch(phonenumber);
}
