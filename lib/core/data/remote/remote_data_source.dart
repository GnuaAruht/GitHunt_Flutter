import 'package:dio/dio.dart';
import 'package:githunt_flutter/core/const/api_const.dart';

abstract class RemoteDataSource {
  Future<Response> getLanguagesContent();
}

class RemoteDataSourceImpl implements RemoteDataSource {

  final Dio client;

  RemoteDataSourceImpl(this.client);

  @override
  Future<Response> getLanguagesContent() {
    return client.get(ApiConst.languageColorUrl);
  }

}
