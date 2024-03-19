import 'package:web_test/web_test.dart' as web_test;
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert' show jsonEncode;

void main(List<String> arguments) async {
  const startDelaySeconds = 15;
  const numberOfRequests = 300;
  const requestDelayDuration = const Duration(seconds: 0);
  print('Hello world: ${web_test.calculate()}!');
  final dio = Dio();

  for (var s = startDelaySeconds; s > 0; s--) {
    print('Starting in: $s');
    await Future<void>.delayed(const Duration(seconds: 1));
  }
  var _postCounter = 1;
  var _counter = 1;

  for (var i = 0; i < numberOfRequests; i++) {
// await Dio()
    // .get<String>(
    // 'https://jsonplaceholder.typicode.com/comments/$_counter++')
    //  .then((value) => print('VALUE: $value'));
    final fluff = List.generate(i, (index) => index).join();
    final ct = CancelToken();
    try {
      await dio.post<String>(
        'https://jsonplaceholder.typicode.com/posts?n=$i&fluff=$fluff',
        data: jsonEncode({'test': 'test', 'id': i}),
        cancelToken: ct,
      );
    } catch (_) {
      print('request failed');
    }

    await Dio().fetch(RequestOptions(
        path: 'https://jsonplaceholder.typicode.com/posts?n=$i',
        method: 'GET',
        data: 'wofje'));

    print(i);
// await Dio()
//     .get<String>(
//         'http://localhost:3000/foo',
// )
    // .then((value) => print('Done Getting ${_postCounter}'));
    sleep(requestDelayDuration);
    print(i);
  }
  print('DONE: SLEEPING FOR ETERNITY NOW');
  sleep(const Duration(days: 300));
}
