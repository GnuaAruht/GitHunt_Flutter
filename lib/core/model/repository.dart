import 'package:githunt_flutter/core/model/language_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repository.g.dart';


@JsonSerializable(explicitToJson: true)
class Repository {
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  final String name;
  final String? description;
  @JsonKey(name: 'stargazers_count')
  final int? stargazersCount;
  final int? forks;
  @JsonKey(name: 'open_issues')
  final int? openIssues;
  final RepoOwner owner;
  @JsonKey(name: 'created_at')
  final DateTime created;
  @JsonKey(name: 'language')
  final String? languageName;

  Repository({
    required this.htmlUrl,
    required this.name,
    required this.description,
    required this.stargazersCount,
    required this.forks,
    required this.openIssues,
    required this.owner,
    required this.created,
    required this.languageName,
  });

  factory Repository.fromJson(Map<String,dynamic> json) => _$RepositoryFromJson(json);

}

@JsonSerializable()
class RepoOwner {
  @JsonKey(name: 'login')
  final String name;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @JsonKey(name: 'html_url')
  final String htmlUrl;

  RepoOwner({
    required this.name,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  factory RepoOwner.fromJson(Map<String,dynamic> json) => _$RepoOwnerFromJson(json);

  Map<String,dynamic> toJson() => _$RepoOwnerToJson(this);

}
