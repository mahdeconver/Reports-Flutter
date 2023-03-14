import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class myProvider with ChangeNotifier {
  var data;
  var status;

  String serverUrl = "http://10.0.2.2:8000/api";

// get
  Future<dynamic> ProfileAllUser() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl/admin/Profile All User";
    http.Response response = await http.get(
      Uri.parse(myUrl),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $value'},
    );

    dynamic data = json.decode(response.body);
    return data['users'];
  }

  Future<dynamic> ProfileSingleUser() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl/v1/Profile Single User";
    http.Response response = await http.get(
      Uri.parse(myUrl),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $value'},
    );

    return json.decode(response.body);
  }

  Future<List> AllReportGet() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl/v1/all";
    http.Response response = await http.get(
      Uri.parse(myUrl),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $value'},
    );
    return json.decode(response.body);
  }

  Future<List> SingleReportGet({required int id}) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl/v1/reports/$id";
    http.Response response = await http.get(
      Uri.parse(myUrl),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $value'},
    );
    return json.decode(response.body);
  }

  Future<dynamic> SingleUserDataGet() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl/v1/reports";
    http.Response response = await http.get(
      Uri.parse(myUrl),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $value'},
    );
    dynamic data = json.decode(response.body);
    return data['data'];
  }

  // post

  void CreateReport({required String title, required String report}) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl/v1/reports";
    http.post(
      Uri.parse(myUrl),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $value'},
      body: {
        'title': "$title",
        'report': '$report',
      },
    ).then(
      (response) {
        print("the response to postData function is : $response");
      },
    );
  }

  Register({
    required String name,
    required String email,
    required String address,
    required String password,
  }) async {
    String myUrl = "$serverUrl/Register";
    final response = await http.post(
      Uri.parse(myUrl),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'name': "$name",
        'email': "$email",
        'address': "$address",
        'password': json.encode("$password")
      },
    );
    status = response.body.contains('status');
    data = json.decode(response.body);
    if (status == true) {
      print("error : ${data['message']}");
    } else {
      print("token : ${data['token']}");
      _saveToken(data['token']);
    }
  }

  RegisterAdmin({
    required String name,
    required String email,
    required String address,
    required String password,
  }) async {
    String myUrl = "$serverUrl/admin/Register";
    final response = await http.post(
      Uri.parse(myUrl),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'name': "$name",
        'email': "$email",
        'address': "$address",
        'password': json.encode("$password")
      },
    );
    status = response.body.contains('status');
    data = json.decode(response.body);
    if (status == true) {
      print("error : ${data['message']}");
    } else {
      print("token : ${data['token']}");
      _saveToken(data['token']);
    }
  }

  SignIn({
    required String email,
    required String password,
  }) async {
    String myUrl = "$serverUrl/Sign in";
    final response = await http.post(
      Uri.parse(myUrl),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'email': "$email",
        'password': "$password",
      },
    );
    status = response.body.contains('status');
    data = json.decode(response.body);
    if (status == true) {
      print("error : ${data['message']}");
    } else {
      print("token : ${data['token']}");
      _saveToken(data['token']);
    }
  }

  SignInAdmin({
    required String email,
    required String password,
  }) async {
    String myUrl = "$serverUrl/admin/login";
    final response = await http.post(
      Uri.parse(myUrl),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'email': "$email",
        'password': "$password",
      },
    );
    status = response.body.contains('status');
    data = json.decode(response.body);
    if (status == true) {
      print("error : ${data['message']}");
    } else {
      print("token : ${data['token']}");
      _saveToken(data['token']);
    }
  }

//put

  void UpdateReport(
      {required int id, required String title, required String report}) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl/v1/reports/$id";
    http.put(
      Uri.parse(myUrl),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $value'},
      body: {
        'title': "$title",
        'report': "$report",
      },
    ).then(
      (response) {
        print("the response to Register function is : $response");
      },
    );
  }

//delet

  DeleteReport({
    required int id,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl/v1/reports/$id";
    http.delete(
      Uri.parse(myUrl),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $value'},
    ).then(
      (response) {
        print("the response to Register function is : $response");
      },
    );
  }

  _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  readToken() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    print("value : $value");
  }
}
