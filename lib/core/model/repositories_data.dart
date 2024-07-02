import 'package:githunt_flutter/core/model/repository.dart';

class RepositoriesData {

  final DateTime fromDate;
  final DateTime toDate;
  final List<Repository> repositories;

  RepositoriesData({
    required this.fromDate,
    required this.toDate,
    required this.repositories,
  });

}
