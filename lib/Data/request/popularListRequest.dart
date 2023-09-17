import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:popular1/Domain/model/Popular%20info%20model.dart';
import 'package:popular1/Domain/model/PopularImages.dart';
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
  static getPopularInfo(

      {required int id,
        required Function(PopularInfoModel) onSuccess,
        required Function(int statusCode) onError}) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    await http
        .get(Uri.parse("https://api.themoviedb.org/3/person/$id?api_key=2dfe23358236069710a379edd4c65a6b"), headers: headers)
        .then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> decoded = {};
        decoded = json.decode(response.body);
        PopularInfoModel popularInfoModel = PopularInfoModel.fromJson(decoded);
        onSuccess(popularInfoModel);
        print(response.body);
      }
      else{
        onError(response.statusCode);
      }

    });

  }
  static getPopularImage(

      {required int id,
        required Function(PopularImages) onSuccess,
        required Function(int statusCode) onError}) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    await http
        .get(Uri.parse("https://api.themoviedb.org/3/person/$id/images?api_key=2dfe23358236069710a379edd4c65a6b"), headers: headers)
        .then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> decoded = {};
        decoded = json.decode(response.body);
        PopularImages popularImages = PopularImages.fromJson(decoded);
        onSuccess(popularImages);
        print(response.body);
      }
      else{
        onError(response.statusCode);
      }

    });

  }

}
