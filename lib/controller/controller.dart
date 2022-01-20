import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:workboost/model/availability.dart';
import 'package:workboost/model/user.dart';

class Controller {
  String baseUrl =
      "https://rcwp67zef0.execute-api.us-east-2.amazonaws.com/testlevel1/workboost2";

  Future<List> getData() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error !");
      }
    } catch (e) {
      return Future.error("Error Fetching Data !");
    }
  }

  Future<List> assignments(Map<String, dynamic> data) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl),
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );

      if (response.statusCode == 200) {
        final List parsedList = json.decode(response.body);

        List<User> list = parsedList.map((val) => User.fromJson(val)).toList();
        //return User.fromJson(jsonDecode(response.body));
        return list;
      } else {
        print(response.body);
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List> availabilities(Map<String, dynamic> data) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl),
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );

      if (response.statusCode == 200) {
        final List parsedList = json.decode(response.body);

        List<Availability> list =
            parsedList.map((val) => Availability.fromJson(val)).toList();
        //return User.fromJson(jsonDecode(response.body));
        return list;
      } else {
        print(response.body);
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<Object> addAssignment(Map<String, dynamic> data) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl),
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      print("==========================ss");
      print(response.body);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> deleteData(Map<String, dynamic> data) async {
    try {
      var response = await http.delete(
        Uri.parse("$baseUrl/delete"),
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      if (response.statusCode == 200) {
        return "success";
      } else {
        print(response.body);
        return "err";
      }
    } catch (e) {
      return "err";
    }
  }

  Future<Object> login(Map<String, dynamic> data) async {
    try {
      var url =
          "http://www.constructionyinyang.gvettech.com/wp-admin/wp-json/remote-login/login";
      var body = jsonEncode(
          {'username': 'sarkazein7@gmail.com', 'password': 'sarkazein@7'});
      var res = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"}, body: body);
      //     .then((http.Response response) {
      //   final int statusCode = response.statusCode;
      //   if (statusCode == 200) {
      //     print("++++++++++++++++++1");
      //     print(response.body);
      //     return true;
      //   }
      // });
      print(res.statusCode);
      print("++++++++++++++++++2");

      return false;
    } catch (e) {
      print("++++++++++++++++++3");

      return false;
    }
  }
}
