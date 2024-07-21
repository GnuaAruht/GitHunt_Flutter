import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:githunt_flutter/core/model/error_model.dart';

part 'data_state.freezed.dart';

@freezed
class DataState<T> with _$DataState {
  factory DataState.success(T data) = DataStateSuccess;
  factory DataState.failure(Error error) = DataStateFailure;
}