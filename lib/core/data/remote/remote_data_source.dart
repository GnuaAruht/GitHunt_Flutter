import 'package:dio/dio.dart';
import 'package:githunt_flutter/core/config/date_util.dart';
import 'package:githunt_flutter/core/const/api_const.dart';
import 'package:githunt_flutter/core/model/language_model.dart';

abstract class RemoteDataSource {
  Future<Response> getRepositoryList(
    Language language,
    DateTime fromDate,
    DateTime toDate,
  );
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio client;

  RemoteDataSourceImpl(this.client);

  @override
  Future<Response> getRepositoryList(
    Language language,
    DateTime fromDate,
    DateTime toDate,
  ) {

    // todo add token if user added it

    final langQuery = language.isAllLang ? "" : "language:${language.title} ";
    final dateQuery = "created:${fromDate.toQuery()}..${toDate.toQuery()}";

    return client.get(
      ApiConst.repositoryListUrl,
      queryParameters: {
        "q": langQuery + dateQuery,
        "sort": "stars",
        "order": "desc"
      },
    );
  }

}
