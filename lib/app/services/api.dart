import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class ApiConnect extends GetConnect {
  final timers = <String, RestartableTimer>{};

  ApiConnect() {
    baseUrl = 'https://api.openweathermap.org';

    var timeout = const Duration(seconds: 45);

    httpClient.timeout = timeout;
    httpClient.addResponseModifier((request, response) {
      timers[request.url.toString()]!.cancel();
      debugPrint(
        '[Http] Response(${response.isOk}) - ${response.statusCode} ${response.statusText} / ${request.method} ${request.url}\n'
        '[Http] Timer Cancel ${request.url}',
      );

      return response;
    });

    httpClient.addRequestModifier((Request request) {
      timers[request.url.toString()] = RestartableTimer(
        timeout,
        () {
          debugPrint(
            '[Http] Timer Elapsed ${request.url}\n'
            '[Http] Internet maybe slow, please check your connection',
          );

          timers[request.url.toString()]?.cancel();
        },
      );

      debugPrint(
        '[Http] Request - ${request.method} ${request.url}\n'
        '[Http] Timer Start ${request.url}',
      );

      return request;
    });
  }
}
