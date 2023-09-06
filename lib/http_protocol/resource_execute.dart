import 'package:flutter_webservices/common/constants/url_constants.dart';
import 'package:flutter_webservices/http_protocol/http_execute.dart';

class ResourceExecute {
  // Obtener todos los posts
  static getPosts() => HTTPExecute(postsResource).get();

  // Obtener un post por ID
  static getPost(int postID) => HTTPExecute(
    postsResource + postID.toString()
  ).get();

  // Obtener todos los posts de un userID
  static getUserPosts(int userID) => HTTPExecute(
    postsResource,
    queryParams: {'userId': userID.toString()}
  ).get();

  // Crear post
  static createPost(Map<String, dynamic> params) => HTTPExecute(
    postsResource,
    params: params,
  ).post();

  // Actualizar post
  static updatePost(int postID, Map<String, dynamic> params) => HTTPExecute(
    postsResource + postID.toString(),
    params: params,
  ).put();

  // Borrar post
  static deletePost(int postID) => HTTPExecute(
    postsResource + postID.toString(),
  ).delete();
}

