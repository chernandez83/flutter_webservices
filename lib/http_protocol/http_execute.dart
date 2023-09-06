import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_webservices/common/constants/url_constants.dart';
import 'package:flutter_webservices/common/enumeration.dart';
import 'package:flutter_webservices/http_protocol/request_error.dart';
import 'package:http/http.dart' as http;

class HTTPExecute {
  String resource;
  Map<String, dynamic> params;
  Map<String, dynamic> queryParams;

  HTTPExecute(this.resource, {this.params = const {}, this.queryParams = const {}});

  get() {
    return checkConnection(HTTPMethod.get);
  }

  post() {
    return checkConnection(HTTPMethod.post);
  }

  put() {
    return checkConnection(HTTPMethod.put);
  }

  delete() {
    return checkConnection(HTTPMethod.delete);
  }

  checkConnection(HTTPMethod httpMethod) async {
    final connection = await Connectivity().checkConnectivity();
    if(connection == ConnectivityResult.none) {
      return RequestError(TypeRequestError.connectionError).getRequestError();
    } else {
      return await executeMethod(httpMethod);
    }
  }

  Uri get endPoint => (queryParams.isNotEmpty) ? Uri.https(url, resource, queryParams) : Uri.parse(uri + resource);

  String get encodedParams => json.encode(params);

  Map<String, String> get headers => {
    'content-type': 'application/json'
  };

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

  validateResponse(http.Response response) {
    return (response.statusCode >= 200 && response.statusCode < 300)
        ? json.decode(response.body.toString())
        : RequestError(TypeRequestError.serverError, response: response).getRequestError();
  }
}