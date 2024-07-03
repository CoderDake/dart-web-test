import 'package:web_test/web_test.dart' as web_test;
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert' show jsonEncode;

void main(List<String> arguments) async {
  /// How long to wait before starting the network requests
  const startDelaySeconds = 0;
  const numberOfRequests = 300;

  /// The duration between requests.
  const requestDelayDuration = Duration(seconds: 10);
  print('Hello world: ${web_test.calculate()}!');
  final dio = Dio();

  for (var s = startDelaySeconds; s > 0; s--) {
    print('Starting in: $s');
    await Future<void>.delayed(const Duration(seconds: 1));
  }

  for (var i = 0; i < numberOfRequests; i++) {
    final fluff = List.generate(i, (index) => index).join();
    await dio.post<String>(
      'https://jsonplaceholder.typicode.com/posts?n=$i&fluff=$fluff',
      data: jsonEncode({'test': 'test', 'id': i}),
    );

    await Dio().fetch(RequestOptions(
        path: 'https://jsonplaceholder.typicode.com/posts?n=$i',
        method: 'GET',
        data: 'wofje'));

    print(i);
    await Future.delayed(requestDelayDuration);
    print(i);
  }
  print('DONE: SLEEPING FOR ETERNITY NOW');
  await Future.delayed(const Duration(days: 300));
}
