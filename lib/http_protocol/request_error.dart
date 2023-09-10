import 'package:flutter/material.dart';
import 'package:flutter_webservices/common/enumeration.dart';
import 'package:flutter_webservices/ui/components/errors/swipe_error.dart';
import 'package:flutter_webservices/ui/components/errors/text_error.dart';
import 'package:http/http.dart';

class RequestError {
  final TypeRequestError typeRequestError;
  Response? response;
  Widget? swipeError;
  String messageError;
  Widget? textError;

  RequestError(this.typeRequestError, {this.response, this.swipeError, this.messageError='', this.textError});

  getRequestError() {
    switch(typeRequestError) {
      case TypeRequestError.connectionError:
        return getMessage('Sin Conexión');
      case TypeRequestError.serverError:
        return getMessage('Error en el servidor ${response!.statusCode}');
      case TypeRequestError.messageError:
        return getMessage(messageError);
    }
  }

  getMessage(String message) {
    messageError = message;
    swipeError = SwipeError(message);
    textError = TextError(message);
    return this;
  }
}