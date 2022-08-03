import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../exceptions/app_exception.dart';
import '../../models/api_response_model.dart';

abstract class ApiRepository {
  final String baseUrl = '';

  Future<Response> onExecuteRequest(Future<Response> Function() fn) async {
    try {
      return await fn.call();
    } on SocketException {
      throw AppException('Falha ao se conectar com a internet. Verifique se você está conectado e tente novamente.');
    } on HttpException catch (e) {
      throw AppException('Falha ao realizar chamada HTTP. Entre em contato com o suporte', e.message);
    } on FormatException catch (e) {
      throw AppException('Falha na formatação da requisição. Entre em contato com o suporte', e.message);
    } catch (_) {
      rethrow;
    }
  }

  T mapHttpResponseToResult<T>(Response response, {T Function(Map)? mapper}) {
    var map = jsonDecode(response.body); 
    var apiResponse = ApiResponse<T>.fromMap(map: map, mapper: mapper);
    
    if (response.statusCode == 200) {
      debugPrint('[apiRepository success]: ${apiResponse.result.runtimeType}');
      return apiResponse.result!;
    }

    throw AppException('Erro ${response.statusCode}', apiResponse.error);
  }
}
