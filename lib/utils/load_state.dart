import 'package:flutter/material.dart';

enum LoadStatus { empty, loading, success, error }

@immutable
class LoadState<T> {
  final LoadStatus status;
  final T? _value;
  final Exception? _error;

  T get value =>
      _value != null ? _value! : throw Exception('Value not loaded yet');

  Exception get error => _error!;

  bool get isEmpty => status == LoadStatus.empty;
  bool get isLoading => status == LoadStatus.loading;
  bool get isError => status == LoadStatus.error;
  bool get isSuccess => status == LoadStatus.success;
  bool get isEnabled => [LoadStatus.empty, LoadStatus.error].contains(status);

  const LoadState.empty()
      : status = LoadStatus.empty,
        _value = null,
        _error = null;

  const LoadState.loading()
      : status = LoadStatus.loading,
        _value = null,
        _error = null;

  const LoadState.success(T value)
      : status = LoadStatus.success,
        _value = value,
        _error = null;

  const LoadState.error(Object exception)
      : status = LoadStatus.error,
        _value = null,
        _error = exception as Exception;

  static Future<LoadState<T>> tryLoad<T>(Future<T> Function() body) async {
    try {
      return LoadState<T>.success(await body());
    } on Exception catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return LoadState<T>.error(e);
    }
  }
}
