import 'package:dio/dio.dart';
import 'package:githunt_flutter/core/config/date_util.dart';
import 'package:githunt_flutter/core/const/api_const.dart';
import 'package:githunt_flutter/core/model/language_model.dart';

abstract class RemoteDataSource {
  Future<Response> getLanguagesContent();
  Future<Response> getRepositoryList(
      Language language, DateTime fromDate, DateTime toDate);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio client;

  RemoteDataSourceImpl(this.client);

  @override
  Future<Response> getLanguagesContent() {
    return client.get(ApiConst.languageColorUrl);
  }

  @override
  Future<Response> getRepositoryList(
    Language language,
    DateTime fromDate,
    DateTime toDate,
  ) {

    final dateRangeFilter =
        "created:${fromDate.toQueryFormat()}..${toDate.toQueryFormat()}";

    final query = language.isAllLanguage
        ? dateRangeFilter
        : "language:${language.title}+$dateRangeFilter";

    return client.get(
      ApiConst.repositoryListUrl,
      queryParameters: {
        "q": query,
        // "sort": "stars",
        // "order": "desc"
      },
    );
  }
}
