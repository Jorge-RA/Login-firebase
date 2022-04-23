import 'dart:convert';

import 'package:login_firebase/models/user..dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Firebase {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _apiKey = 'AIzaSyDuhWaRUrOQroW3xlPP-UTEDNlzlqKntOs';

  Future<String?> login(User user) async {
    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _apiKey,
    });

    //Se puede agrupar en otra función.
    try {
      final response = await http.post(url, body: user.userForm);
      final Map<String, dynamic> decodedData = jsonDecode(response.body);
      if (decodedData.containsKey('idToken'))
        return null;
      else
        return decodedData['error']['message'];
    } catch (e) {
      print(e);
    }
    //
  }

  Future<String?> register(User user) async {
    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key': _apiKey,
    });

    //Se puede agrupar en otra función
    try {
      final response = await http.post(url, body: user.userForm);
      final Map<String, dynamic> decodedData = jsonDecode(response.body);
      if (decodedData.containsKey('idToken'))
        return null;
      else
        return decodedData['error']['message'];
    } catch (e) {
      print(e);
    }
  }
}
