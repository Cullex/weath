import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

mixin DynamicStateMixin {
  final value = {}.obs;

  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool val) {
    if (val) _error.value = '';
    _loading.value = val;
  }

  final _error = ''.obs;
  String get error => _error.value;
  set error(String val) => _error.value = val.replaceAll('Exception', 'Error');

  final _message = ''.obs;
  String get message => _message.value;
  set message(String val) => _message.value = val;

  T as<T>(key, [T? defaultValue]) => (value[key] ?? defaultValue) as T;
  void put<T>(key, T val) => value[key] = val;

  useLoading(Future Function() future) async {
    loading = true;

    try {
      await future();
    } on SocketException {
      error = 'Internet connection failed, please try again';
    } catch (err) {
      error = 'Oops, $err';
    }

    loading = false;
  }

  useError(err, [trace = '']) {
    debugPrint(err);
    debugPrint(trace);

    error = err.toString();
    loading = false;
  }
}
