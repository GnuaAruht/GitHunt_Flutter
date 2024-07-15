import 'package:dio/dio.dart';
import 'package:githunt_flutter/core/config/date_util.dart';
import 'package:githunt_flutter/core/const/api_const.dart';
import 'package:githunt_flutter/core/model/language_model.dart';

abstract class RemoteDataSource {
  Future<Response> getRepositoryList(
    String? pat,
    String language,
    DateTime fromDate,
    DateTime toDate,
  );
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio client;

  RemoteDataSourceImpl(this.client);

  @override
  Future<Response> getRepositoryList(
    String? pat,
    String language,
    DateTime fromDate,
    DateTime toDate,
  ) {

    final langQuery = language == allLanguages ? "" : "language:$language ";
    final dateQuery = "created:${fromDate.toQuery()}..${toDate.toQuery()}";

    Options? options;
    if(pat != null) {
      options = Options(headers: {"Authorization": "token $pat"});
    }

    return client.get(
      ApiConst.repositoryListUrl,
      options: options,
      queryParameters: {
        "q": langQuery + dateQuery,
        "sort": "stars",
        "order": "desc"
      },
    );
  }

}
