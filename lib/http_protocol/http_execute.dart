import 'dart:convert';

import 'package:flutter_webservices/common/constants/url_constants.dart';
import 'package:flutter_webservices/common/enumeration.dart';
import 'package:http/http.dart' as http;

class HTTPExecute {
  String resource;
  Map<String, dynamic> params;
  Map<String, dynamic> queryParams;

  HTTPExecute(this.resource, {this.params = const {}, this.queryParams = const {}});

  get() {}

  post() {}

  put() {}

  delete() {}

  executeMethod(HTTPMethod httpMethod) async {
    http.Response response;
    switch(httpMethod) {
      case HTTPMethod.get:
        response = await http.get(endPoint, headers: headers);
        break;
      case HTTPMethod.post:
        response = await http.post(endPoint, body: encodedParams, headers: headers);
        break;
      case HTTPMethod.put:
        response = await http.put(endPoint, body: encodedParams, headers: headers);
        break;
      case HTTPMethod.delete:
        response = await http.delete(endPoint, body: encodedParams, headers: headers);
        break;
    }

    validateResponse(response);
  }

  Uri get endPoint => (queryParams.isNotEmpty) ? Uri.https(url, resource, queryParams) : Uri.parse(uri + resource);

  String get encodedParams => json.encode(params);

  Map<String, String> get headers => {
    'content-type': 'application/json'
  };

  validateResponse(http.Response response) {
    return (response.statusCode >= 200 && response.statusCode < 300)
        ? response.body.toString() : response.statusCode.toString() ;
  }
}