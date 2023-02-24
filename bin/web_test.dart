import 'package:web_test/web_test.dart' as web_test;
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert' show jsonEncode;
void main(List<String> arguments) async {
  print('Hello world: ${web_test.calculate()}!');
  var _postCounter = 1;
  var _counter = 1;
  for(var i = 0; i < 200; i ++){
// await Dio()
 // .get<String>(
 // 'https://jsonplaceholder.typicode.com/comments/$_counter++')
 //  .then((value) => print('VALUE: $value'));
await Dio()
    .post<String>(
        'https://jsonplaceholder.typicode.com/posts',
        data: jsonEncode({'DAKE': _postCounter++}))
    .then((value) => print('Done Posting ${_postCounter}'));
await Dio()
    .get<String>(
        'https://jsonplaceholder.typicode.com/photos',
)
    .then((value) => print('Done Getting ${_postCounter}'));
    sleep(Duration(seconds:10));
    print(i);
  }
}
