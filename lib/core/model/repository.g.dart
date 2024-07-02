// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repository _$RepositoryFromJson(Map<String, dynamic> json) => Repository(
      htmlUrl: json['html_url'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      stargazersCount: (json['stargazers_count'] as num?)?.toInt(),
      forks: (json['forks'] as num?)?.toInt(),
      openIssues: (json['open_issues'] as num?)?.toInt(),
      owner: RepoOwner.fromJson(json['owner'] as Map<String, dynamic>),
      created: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$RepositoryToJson(Repository instance) =>
    <String, dynamic>{
      'html_url': instance.htmlUrl,
      'name': instance.name,
      'description': instance.description,
      'stargazers_count': instance.stargazersCount,
      'forks': instance.forks,
      'open_issues': instance.openIssues,
      'owner': instance.owner.toJson(),
      'created_at': instance.created.toIso8601String(),
    };

RepoOwner _$RepoOwnerFromJson(Map<String, dynamic> json) => RepoOwner(
      name: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
      htmlUrl: json['html_url'] as String,
    );

Map<String, dynamic> _$RepoOwnerToJson(RepoOwner instance) => <String, dynamic>{
      'login': instance.name,
      'avatar_url': instance.avatarUrl,
      'html_url': instance.htmlUrl,
    };
