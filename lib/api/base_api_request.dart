import 'package:dio/dio.dart';

class BaseApiRequest {
  Dio api = Dio();
  String baseUrl = "https://fakestoreapi.com";

  Future<Dio> dio() async {
    api.options.baseUrl = baseUrl;
    return api;
  }
}
