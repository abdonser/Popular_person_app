import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:popular1/Domain/model/PopularList.dart';
import 'package:popular1/app/app_constant.dart';

class PopularRequest {
  static getPopular(
      {required Function(List<Result>?) onSuccess,
      required Function(int statusCode) onError}) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    await http
        .get(Uri.parse(AppConstant.popularListApi), headers: headers)
        .then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> decoded = {};
        decoded = json.decode(response.body);
        PopularList popularList = PopularList.fromJson(decoded);
        onSuccess(popularList.results);
        print(response.body);
      }
      else{
        onError(response.statusCode);
      }

    });

  }

}
