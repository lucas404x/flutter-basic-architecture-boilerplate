import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/api_response.model.dart';

abstract class ApiRepository {
  final String baseUrl = 'http://10.0.0.102:5000/api';

  T mapHttpResponseToResult<T>(Response response, {T Function(Map)? mapper}) {
    var map = jsonDecode(response.body); 
    var apiResponse = ApiResponse.fromMap(map: map, mapper: mapper);
    
    if (apiResponse.status?.code == 200 && apiResponse.result != null) {
      debugPrint('[apiRepository success]: ${apiResponse.result.runtimeType}');
      return apiResponse.result!;
    }

    debugPrint('[apiRepository error]: ${apiResponse.status}');

    throw Exception(apiResponse.status?.message);
  }
}
