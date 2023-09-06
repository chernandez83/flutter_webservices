import 'package:flutter_webservices/http_protocol/request_error.dart';

class Validate {
  Map data;
  
  Validate(this.data);
  
  checkKeyExists(String key, var defaultValue) {
    return (data.containsKey(key) && data[key] != null)
        ? validateType(data[key], defaultValue)
        : defaultValue;
  }

  validateType(var value, var defaultValue) {
    switch(defaultValue.runtimeType) {
      case int:
        return int.parse(value.toString());
      case String:
        return value.toString();
      case double:
        return double.parse(value.toString());
      case bool:
        return bool.parse(value.toString());
      default:
        return value;
    }
  }

  hasRequestErrorOrBody(var method) {
    return (data is RequestError) ? data : method(data);
  }
}