import 'package:flutter_webservices/common/validate.dart';

class PostModel {
  int id;
  String title;
  String body;
  int userId;

  PostModel({this.id=0, this.title='', this.body='', this.userId=0});

  toObject(Map<dynamic, dynamic> data) {
    Validate validate = Validate(data);
    return PostModel(
      id: validate.checkKeyExists('id', 0),
      title: validate.checkKeyExists('title', ''),
      body: validate.checkKeyExists('body', ''),
      userId: validate.checkKeyExists('userId', 0),
    );
  }

  toMap() {
    return {
      'id': (id > 0) ? id.toString() : '',
      'title': title,
      'body': body,
      'userId': (userId > 0) ? userId.toString() : '',
    };
  }


}