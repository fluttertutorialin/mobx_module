import 'dart:async';
import 'package:dio/dio.dart';
import 'package:mobx_module/constants/endpoints.dart';
import 'package:mobx_module/data/network/dio_client.dart';

class PostApi {
  // singleton object
  static final PostApi _singleton = PostApi._();

  // A private constructor. Allows us to create instances of PostApi
  // only from within the PostApi class itself.
  PostApi._();

  // factory method to return the same object each time its needed
  factory PostApi() => _singleton;

  // Singleton accessor
  static PostApi get instance => _singleton;

  // rest client
  //final _restClient = RestClient.instance;
  final _dioClient = DioClient.instance;

  // Returns list of post in response
  Future<Response> getPosts() {
    return _dioClient
        .get(Endpoints.getPostPoneReasonList)
        .then((Response res) => res)
        .catchError((error) => throw error);
  }

//sample api call with default rest client
  /*Future<PostsList> getPosts() {
    return _restClient
        .get(Endpoints.getPosts)
        .then((dynamic res) => PostsList.fromJson(res))
        .catchError((error) => throw NetworkException(message: error));
  }*/
}
