// import 'dart:convert';
// import 'package:eChanneling/network/api_config.dart';
// import 'package:eChanneling/network/api_endpoints.dart';
// import 'package:http/http.dart' as http;
//
// enum HttpMethod{
//   get,
//   post,
//   put,
//   delete,
//   patch
// }
//
// class ApiClients{
//   static const _headers = {'Content-Type' : 'application/json'};
//   static Future <dynamic> request({
//     required String endpoint,
//     required HttpMethod method,
//     Map<String,dynamic>? body,
//     Map<String,dynamic>? params
// }) async{
//
//   String resolvedEndpoints = endpoint;
//
//   final uri = Uri.parse("${ApiConfig.baseUrl}/${ApiEndpoints}");
//
//   late http.Response response;
// }
// }