import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProviders {
  var url = 'https://test.turbocare.app/turbo/care/v1/makes?class=';
  //Uri.parse('https://test.turbocare.app/turbo/care/v1/makes?class=');

  Future<List<String>> getVehicle2Class() async {
    var url2w = url + '2w';
    var result = await http.get(Uri.parse(url2w));
    print('Result - ${result.body}');

    String s = result.body.substring(1, result.body.length - 1);
    List<String> resp = s.split(",");
    return resp;
  }

  Future<List<String>> getVehicle4Class() async {
    var url4w = url + '4w';
    var result = await http.get(Uri.parse(url4w));
    print('Result - ${result.body}');

    String s = result.body.substring(1, result.body.length - 1);
    List<String> resp = s.split(",");
    return resp;
  }

  Future<List<String>> getVehicleModel(String model) async {
    print('model - $model');
    var url = 'https://test.turbocare.app/turbo/care/v1/models?class=2w&make=' +
        model;
    var result = await http.get(Uri.parse(url));
    print('Result getVehicleModel - ${result.body}');

    String s = result.body.substring(1, result.body.length - 1);
    List<String> resp = s.split(",");
    return resp;
  }
}
