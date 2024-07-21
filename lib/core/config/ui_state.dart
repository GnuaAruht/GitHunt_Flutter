
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:githunt_flutter/core/model/error_model.dart';

part 'ui_state.freezed.dart';

@freezed
class UIState with _$UIState {
  const factory UIState.init() = UIStateInit;
  const factory UIState.loading() = UIStateLoading;
  const factory UIState.success() = UIStateSuccess;
  const factory UIState.error(Error error) = UIStateError;
}