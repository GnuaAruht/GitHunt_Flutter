// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UIState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(Error error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(Error error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(Error error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UIStateInit value) init,
    required TResult Function(UIStateLoading value) loading,
    required TResult Function(UIStateSuccess value) success,
    required TResult Function(UIStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIStateInit value)? init,
    TResult? Function(UIStateLoading value)? loading,
    TResult? Function(UIStateSuccess value)? success,
    TResult? Function(UIStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIStateInit value)? init,
    TResult Function(UIStateLoading value)? loading,
    TResult Function(UIStateSuccess value)? success,
    TResult Function(UIStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UIStateCopyWith<$Res> {
  factory $UIStateCopyWith(UIState value, $Res Function(UIState) then) =
      _$UIStateCopyWithImpl<$Res, UIState>;
}

/// @nodoc
class _$UIStateCopyWithImpl<$Res, $Val extends UIState>
    implements $UIStateCopyWith<$Res> {
  _$UIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UIStateInitImplCopyWith<$Res> {
  factory _$$UIStateInitImplCopyWith(
          _$UIStateInitImpl value, $Res Function(_$UIStateInitImpl) then) =
      __$$UIStateInitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UIStateInitImplCopyWithImpl<$Res>
    extends _$UIStateCopyWithImpl<$Res, _$UIStateInitImpl>
    implements _$$UIStateInitImplCopyWith<$Res> {
  __$$UIStateInitImplCopyWithImpl(
      _$UIStateInitImpl _value, $Res Function(_$UIStateInitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UIStateInitImpl implements UIStateInit {
  const _$UIStateInitImpl();

  @override
  String toString() {
    return 'UIState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UIStateInitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(Error error) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(Error error)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(Error error)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UIStateInit value) init,
    required TResult Function(UIStateLoading value) loading,
    required TResult Function(UIStateSuccess value) success,
    required TResult Function(UIStateError value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIStateInit value)? init,
    TResult? Function(UIStateLoading value)? loading,
    TResult? Function(UIStateSuccess value)? success,
    TResult? Function(UIStateError value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIStateInit value)? init,
    TResult Function(UIStateLoading value)? loading,
    TResult Function(UIStateSuccess value)? success,
    TResult Function(UIStateError value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class UIStateInit implements UIState {
  const factory UIStateInit() = _$UIStateInitImpl;
}

/// @nodoc
abstract class _$$UIStateLoadingImplCopyWith<$Res> {
  factory _$$UIStateLoadingImplCopyWith(_$UIStateLoadingImpl value,
          $Res Function(_$UIStateLoadingImpl) then) =
      __$$UIStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UIStateLoadingImplCopyWithImpl<$Res>
    extends _$UIStateCopyWithImpl<$Res, _$UIStateLoadingImpl>
    implements _$$UIStateLoadingImplCopyWith<$Res> {
  __$$UIStateLoadingImplCopyWithImpl(
      _$UIStateLoadingImpl _value, $Res Function(_$UIStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UIStateLoadingImpl implements UIStateLoading {
  const _$UIStateLoadingImpl();

  @override
  String toString() {
    return 'UIState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UIStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(Error error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(Error error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(Error error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UIStateInit value) init,
    required TResult Function(UIStateLoading value) loading,
    required TResult Function(UIStateSuccess value) success,
    required TResult Function(UIStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIStateInit value)? init,
    TResult? Function(UIStateLoading value)? loading,
    TResult? Function(UIStateSuccess value)? success,
    TResult? Function(UIStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIStateInit value)? init,
    TResult Function(UIStateLoading value)? loading,
    TResult Function(UIStateSuccess value)? success,
    TResult Function(UIStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UIStateLoading implements UIState {
  const factory UIStateLoading() = _$UIStateLoadingImpl;
}

/// @nodoc
abstract class _$$UIStateSuccessImplCopyWith<$Res> {
  factory _$$UIStateSuccessImplCopyWith(_$UIStateSuccessImpl value,
          $Res Function(_$UIStateSuccessImpl) then) =
      __$$UIStateSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UIStateSuccessImplCopyWithImpl<$Res>
    extends _$UIStateCopyWithImpl<$Res, _$UIStateSuccessImpl>
    implements _$$UIStateSuccessImplCopyWith<$Res> {
  __$$UIStateSuccessImplCopyWithImpl(
      _$UIStateSuccessImpl _value, $Res Function(_$UIStateSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UIStateSuccessImpl implements UIStateSuccess {
  const _$UIStateSuccessImpl();

  @override
  String toString() {
    return 'UIState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UIStateSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(Error error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(Error error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(Error error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UIStateInit value) init,
    required TResult Function(UIStateLoading value) loading,
    required TResult Function(UIStateSuccess value) success,
    required TResult Function(UIStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIStateInit value)? init,
    TResult? Function(UIStateLoading value)? loading,
    TResult? Function(UIStateSuccess value)? success,
    TResult? Function(UIStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIStateInit value)? init,
    TResult Function(UIStateLoading value)? loading,
    TResult Function(UIStateSuccess value)? success,
    TResult Function(UIStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class UIStateSuccess implements UIState {
  const factory UIStateSuccess() = _$UIStateSuccessImpl;
}

/// @nodoc
abstract class _$$UIStateErrorImplCopyWith<$Res> {
  factory _$$UIStateErrorImplCopyWith(
          _$UIStateErrorImpl value, $Res Function(_$UIStateErrorImpl) then) =
      __$$UIStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Error error});
}

/// @nodoc
class __$$UIStateErrorImplCopyWithImpl<$Res>
    extends _$UIStateCopyWithImpl<$Res, _$UIStateErrorImpl>
    implements _$$UIStateErrorImplCopyWith<$Res> {
  __$$UIStateErrorImplCopyWithImpl(
      _$UIStateErrorImpl _value, $Res Function(_$UIStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$UIStateErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error,
    ));
  }
}

/// @nodoc

class _$UIStateErrorImpl implements UIStateError {
  const _$UIStateErrorImpl(this.error);

  @override
  final Error error;

  @override
  String toString() {
    return 'UIState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UIStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UIStateErrorImplCopyWith<_$UIStateErrorImpl> get copyWith =>
      __$$UIStateErrorImplCopyWithImpl<_$UIStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(Error error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(Error error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(Error error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UIStateInit value) init,
    required TResult Function(UIStateLoading value) loading,
    required TResult Function(UIStateSuccess value) success,
    required TResult Function(UIStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIStateInit value)? init,
    TResult? Function(UIStateLoading value)? loading,
    TResult? Function(UIStateSuccess value)? success,
    TResult? Function(UIStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIStateInit value)? init,
    TResult Function(UIStateLoading value)? loading,
    TResult Function(UIStateSuccess value)? success,
    TResult Function(UIStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UIStateError implements UIState {
  const factory UIStateError(final Error error) = _$UIStateErrorImpl;

  Error get error;
  @JsonKey(ignore: true)
  _$$UIStateErrorImplCopyWith<_$UIStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
