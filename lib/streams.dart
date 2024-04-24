// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test/timer.dart';

class Streams {
  final StreamTimer timer;
  Streams({
    required this.timer,
  });

  Stream<int> streamGenerator(int start, int end) async* {
    for (int i = start; i < (end + 1); i++) {
      yield i;
      await timer.delay();
    }
  }

  Stream<int> get data1 => streamGenerator(0, 100);
  Stream<int> get data2 => streamGenerator(100, 200);
  Stream<int> get data3 => streamGenerator(200, 300);
}
